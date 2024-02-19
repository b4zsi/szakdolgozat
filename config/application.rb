require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SzakdolgozatProject
  class Application < Rails::Application
    Rails.application.config.session_store :disabled
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_storage.content_types_to_serve_as_binary -= ['image/svg+xml']
    config.i18n.default_locale = :hu
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.api_only = true
  end
end
