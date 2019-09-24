class Admin::UsersController < ApplicationController
  before_action :authenticate_user
  before_action :require_adimn
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # before_action :admin_user, only: [:create, :update]


  def index
    @query = User.ransack(params[:q])
    @users = @query.result(distinct: true).sorted.page(params[:page])
    @tasks = Task.all
  end

  def show
    @query = Task.where(user_id: params[:id]).ransack(params[:q])
    @tasks = @query.result(distinct: true).sorted.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user), notice:  "#{@user.name}さんのアカウントを作成しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "#{@user.name}さんの情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    if @user == User.first && @user == User.last
      redirect_to admin_users_path, notice: "ユーザがゼロになってしまう為、削除できません。"
    else
      if @user.admin == true
        redirect_to admin_users_path, notice: "管理者権限を持つユーザは削除できません。"
      else
        @user.destroy
        redirect_to admin_users_path, notice: "ユーザを削除しました。"
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def require_adimn
    if current_user.admin != true
      flash[:notice] = "権限がありません。"
      redirect_to tasks_path
    end
  end
end
