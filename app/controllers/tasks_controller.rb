class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :check_task_authority, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @query = Task.ransack(params[:q])
    @tasks = @query.result(distinct: true).sorted.page(params[:page])
    @mytasks = @tasks.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to @task, notice: t('controllers.tasks_controller.create.notice')
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: t('controllers.tasks_controller.update.notice')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('controllers.tasks_controller.destroy.notice')
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id, :name, :description, :deadline, :status, :priority, :q, connects_attributes: [:id, :task_id, :label_id], label_ids: [])
  end

  def check_task_authority
    if current_user.admin != true
      if Task.find(params[:id].to_i).user_id.to_i == current_user.id
      else
        redirect_to tasks_path, notice: '権限がありません。'
      end
    end
  end

end
