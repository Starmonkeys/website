class ProjectsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.author = current_user
    if @project.save
      redirect_to(@project, :notice => 'Project created')
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
    redirect_to projects_path unless @project.author == current_user
  end

  def show
    @project = Project.find(params[:id])
  end
end
