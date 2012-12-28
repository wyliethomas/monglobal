# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mongotrans::Application.initialize!

LANGS = []
for lang in I18n.available_locales
  LANGS << lang.to_sym
end


