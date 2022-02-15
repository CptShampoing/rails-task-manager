class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    task_by_id
  end

  def update
    task_by_id
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def show
    task_by_id
  end

  def destroy
    task_by_id
    @task.destroy
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def task_by_id
    @task = Task.find(params[:id])
  end
end
