require "monglobal/version"
require 'active_support'


module Monglobal  

  #allows for :translates method on model in rails
  def self.included(klass)
    klass.extend ClassMethods
  end

  def update_translation(locale, params)

    if locale == "#{I18n.default_locale}"
      #just update the main record
      self.update_attributes(params)
    else
      #or update the translations
      params = {locale => params}

      translations = send("#{self.class.to_s}Translation".underscore.pluralize.to_sym)
      translation_class = Kernel.const_get("#{self.class.to_s}Translation")


      # update existing translations
      translations.each do |translation|
        translation.update_attributes(params.delete(translation.locale))
      end
      
      # create new translations
      attrs = params[locale]
      if attrs
        tr = translation_class.new(attrs)
        tr.locale = locale
        translations << tr
      end
      
      save
    end #if default locale
  end


  module ClassMethods
    def translates(*args)
      klass_name = "#{name.camelcase}Translation"
      
      # Create the translation model
      translation_model = Class.new do
        include MongoMapper::EmbeddedDocument
        key :locale, String
        args.each do |attr|
          key attr.to_sym, String
        end

      end
      Object.const_set klass_name, translation_model
      
      instance_eval do
        has_many klass_name.underscore.pluralize.to_sym
      end
      
      # Add attributes readers
      class_eval do
        args.each do |attr|
          define_method(attr) do | *params |
            requested_locale = params.first
            requested_locale = I18n.locale if requested_locale.nil?
            if requested_locale == I18n.default_locale
              instance_variable_get("@#{attr}")
            else
              translations = send(klass_name.underscore.pluralize.to_sym)
              translated_attr = nil
              translations.each do |translation|
                translated_attr = translation.send(attr.to_sym) if translation.locale.to_sym == requested_locale
              end
              translated_attr = instance_variable_get("@#{attr}") if translated_attr.nil?
              translated_attr
            end
          end
        end
      end
    end
  end
end

