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
    @project = Project.find(params[:project_id])
    @task.project = @project
    if @task.save
      redirect_to(@project, :notice => 'Task created')
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    @project = @task.project
    redirect_to project_tasks_path(@project.id) unless @task.author == current_user
  end

  def show
    @task = Task.find(params[:id])
    @project = @task.project
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to([@task.project, @task], :notice => 'Successfully updated')
    else
      render :action => 'edit'
    end
  end
end
