class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: t('controllers.sessions_controller.create.success')
    else
      flash.now[:danger] = t('controllers.sessions_controller.create.failure')
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = t('controllers.sessions_controller.destroy.notice')
    redirect_to new_session_path
  end
end
