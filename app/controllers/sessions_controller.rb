class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: t('session.successful_connection')
    else
      flash.now.alert = t('session.failed_connection')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: t('session.logout')
  end
end
