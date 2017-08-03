class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user, :current_project, :current_document, :logged_in?

  before_action :set_locale, :user_projects, :set_projects
  layout :resolve_layout
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def get_projects
  #   @projects = Project.all
  #   #@projects = UserProject.where(['user_id = ?', session[:user_id]])
  # end

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
      p "get current_user"
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_project
      p "get current_project"
      if session[:current_project_id]
        @current_project ||= Project.find(session[:current_project_id])
      else
        @current_project = nil
      end
    end

    def current_document
      p "get current_document"
      if session[:current_document_id]
        @current_document ||= Document.find(session[:current_document_id])
      else
        @current_document = nil
      end
    end

    def user_projects
      session[:projects] = Access.where(user_id: session[:user_id]).pluck(:project_id)
    end

    # global method because it's used in the header
    def set_projects
      @projects = Project.where(id: session[:projects])
    end

    def logged_in?
      current_user
    end

end

