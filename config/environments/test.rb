
Rails.application.configure do
  config.cache_classes = false
  config.action_view.cache_template_loading = true
  config.eager_load = false
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host, protocol: 'http' }
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    user_name: "s.note.mailer@gmail.com",
    password: ENV['MAILER_PASSWORD'],
    authentication: "plain",
    enable_starttls_auto: true
  }
end
