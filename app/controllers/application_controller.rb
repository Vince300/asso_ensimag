class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_pundit, except: [ :index, :show, :detail, :calendar, :asso_events ]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Error handlers
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :error_internal
    rescue_from Pundit::NotAuthorizedError, with: :error_forbidden
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error_not_found
  end

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

    def error_forbidden
      @error_status = 403
      render_error
    end

    def error_not_found
      @error_status = 404
      render_error
    end

    def error_internal
      @error_status = 500
      render_error
    end

    def render_error
      respond_to do |format|
        format.html { render 'errors/error', status: @error_status }
        format.all { render nothing: true, status: @error_status }
      end
    end
end
