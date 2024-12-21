class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params_new)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params_edit)
    redirect_to task_path(@task)
  end

  def destroy
    raise
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params_new
    params.require(:task).permit(:name, :details)
  end

  def task_params_edit
    params.require(:task).permit(:name, :details, :completed)
  end
end
