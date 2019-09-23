class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action :forbid_login_user, only: [:new]
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice:  t('controllers.users_controller.create.notice')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('controllers.users_controller.update.notice')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: t('controllers.users_controller.destroy.notice')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to tasks_path
    end
  end

end
