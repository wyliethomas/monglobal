require 'rails/generators'
module Monglobal
  class SetupGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates/", __FILE__)

    # Commandline options can be defined here using Thor-like options:
    argument :model_name

    # all public methods in here will be run in order

    def build_translate_models
      template "model.rb", "app/models/#{class_file_name}"
    end



    protected

    def newklass
      klass = model_name.constantize
      return klass
    end

    def class_name
      "#{model_name}Translation"
    end

    def class_file_name
      #"test"
      "#{class_name}.rb"
    end


  end
end
