class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        session[:current_project] = nil
        session[:current_document] = nil
        redirect_to projects_path, notice: t('session.successfull_connection')
      else
        redirect_to new_session_path, notice: t('session.failed_connection')
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:current_project_id)
    session.delete(:current_document_id)
    session.delete(:projects)
    redirect_to new_session_path
  end
end
