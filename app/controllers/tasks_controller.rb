class TasksController < ApplicationController

  #index
  def index
    @tasks = Task.all
  end
  #show
  def show
    @task = Task.find(params[:id])
  end
  #new
  def new
    @task = Task.new
  end

  #create

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  #edit
  def edit
    @task = Task.find(params[:id])
  end

  #update
  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_path
  end

  #destroy

  def destroy
    task = Task.find(params[:id])
    task.delete
    redirect_to tasks_path
  end

  #Préserver notre base de données.
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name,:description)

  end
end
