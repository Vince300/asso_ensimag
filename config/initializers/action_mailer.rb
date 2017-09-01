Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: Rails.application.secrets.asso_smtp_domain,
      user_name: Rails.application.secrets.asso_smtp_login,
      password: Rails.application.secrets.asso_smtp_pass,
      authentication: 'login',
      enable_starttls_auto: true
  }
end