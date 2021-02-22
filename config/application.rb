require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Valczykanger
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

Sentry.init do |config|
  config.dsn = 'https://90b089c2050048b29caa4f1aed7082cc@o522258.ingest.sentry.io/5633436'
  config.breadcrumbs_logger = [:active_support_logger]

  # Only use Sentry on production
  config.enabled_environments = %w[production]

  # Spam me with everything you got
  config.traces_sample_rate = 1.0

  # Dont hide request body from reports
  config.send_default_pii = true
end