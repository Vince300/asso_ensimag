class UserCreateMailer < ActionMailer::Base
  default from: Rails.application.secrets.asso_smtp_login

  def welcome_email(user)
    @user   = user
    @url    = Rails.application.routes.url_helpers.new_user_session_url
    @domain = URI.parse(@url).host.downcase
    mail(to: @user.email, subject: "Bienvenue sur #{@domain}")
  end
end
