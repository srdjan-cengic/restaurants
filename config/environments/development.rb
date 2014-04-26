RestaurantsBa::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Change mail delvery to either :smtp, :sendmail, :file, :test
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USERNAME"],
    password: ENV["GMAIL_PASSWORD"]
  }

  #Allows detailed configuration for :smtp delivery method:
  #:address - Allows you to use a remote mail server. Just change it from its default "localhost" setting.
  #:port - On the off chance that your mail server doesn't run on port 25, you can change it.
  #:domain - If you need to specify a HELO domain, you can do it here.
  #:user_name - If your mail server requires authentication, set the username in this setting.
  #:password - If your mail server requires authentication, set the password in this setting.
  #:authentication - If your mail server requires authentication, you need to specify the authentication type here. This is a symbol and one of :plain, :login, :cram_md5.
  #:enable_starttls_auto - Set this to false if there is a problem with your server certificate that you cannot resolve.

  # Specify what domain to use for mailer URLs
  config.action_mailer.default_url_options = { host: "127.0.0.1", port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
