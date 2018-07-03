# frozen_string_literal: true

# Enable locale fallbacks for I18n (makes lookups for any locale fall back to
# the I18n.default_locale when a translation cannot be found).
Rails.application.config.i18n.fallbacks = true

I18n.available_locales = %i[fr en]

# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# Set default locale to something other than :en
I18n.default_locale = :fr
