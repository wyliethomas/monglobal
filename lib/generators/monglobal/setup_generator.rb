require 'rails/generators'
module Monglobal
  class SetupGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates/", __FILE__)

    def build_initializer
      template "monglobal.rb", "config/initializers/monglobal.rb"
    end

  end
end
