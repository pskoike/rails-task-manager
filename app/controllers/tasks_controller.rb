class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to tasks_path
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end



  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :done)
  end
end
