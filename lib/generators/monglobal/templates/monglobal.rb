LANGS = []
for lang in I18n.available_locales
  LANGS << lang.to_sym
end
