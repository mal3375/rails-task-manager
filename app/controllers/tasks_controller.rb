class TasksController < ApplicationController
before_action :set_task, only [:show, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    #redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
    #redirect_to task_path(@task)
  end

  def update
    @task.update(params[:id])
    #redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@task), status: :see_other, notice: 'Task was successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
