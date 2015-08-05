class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_pundit, except: [ :index, :show, :detail, :calendar, :asso_events ]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    #->Prelang (user_login:devise)
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in)        { |u| u.permit(:login, :username, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

    def verify_pundit
      unless request.original_fullpath =~ /^\/admin/ or devise_controller?
        verify_authorized
      end
    end
end
