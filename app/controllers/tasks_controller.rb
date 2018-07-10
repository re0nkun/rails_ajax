class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  
  def index 
  end

  def new 
    @task = Task.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html
        format.js
      else
        format.js { render :new }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end
  def update
    @task.update_attributes(task_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def all_tasks
      @tasks = Task.all
    end

    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name)
    end
end
