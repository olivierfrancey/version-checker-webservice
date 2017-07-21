class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  before_action :set_locale, :get_projects
  layout :resolve_layout
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_projects
    @projects = Project.all
    #@projects = UserProject.where(['user_id = ?', session[:user_id]])
  end

  def check_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private   
    def resolve_layout
      case action_name
        when "home"
        "home"
        else 
        "application"
        end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user
    end

end

