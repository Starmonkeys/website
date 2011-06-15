class TasksController < ApplicationController
  before_filter :authorize, :except => [:index, :show]

  def index
    @tasks = Task.all
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.author = current_user
    if params[:project_id]
      @taskable = Project.find(params[:project_id])
    end
    @task.taskable = @taskable
    if @task.save
      redirect_to(@taskable, :notice => 'Task created')
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    redirect_to tasks_path unless @task.author == current_user
  end

  def show
    @task = Task.find(params[:id])
  end
end
