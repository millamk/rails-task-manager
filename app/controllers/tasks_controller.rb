class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index         # GET /tasks
    @tasks = Task.all
  end

  def show          # GET /task/:id
  end

  def new           # GET /tasks/new
    @task = Task.new
  end

  def create        # POST /tasks
    @task = Task.new(task_params)
    redirect_to tasks_path
  end

  def edit          # GET /task/:id/edit
  end

  def update        # PATCH /task/:id
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy       # DELETE /task/:id
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
