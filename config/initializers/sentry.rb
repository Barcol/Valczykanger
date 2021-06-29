Sentry.init do |config|
  config.dsn =
    "https://90b089c2050048b29caa4f1aed7082cc@o522258.ingest.sentry.io/5633436"
  config.breadcrumbs_logger = [:active_support_logger]

  # Only use Sentry on production
  config.enabled_environments = %w[production]

  # Spam me with everything you got
  config.traces_sample_rate = 1.0

  # Dont hide request body from reports
  config.send_default_pii = true
end
