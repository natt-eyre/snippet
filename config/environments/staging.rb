require_relative "production"

if ENV["EMAIL_RECIPIENTS"]
  Mail.register_interceptor(
    RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"))
  )
end

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: ENV.fetch("HOST") }
end
