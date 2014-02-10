class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
        flash[:notice] = "Project has been created."
        redirect_to @project
    else
        flash.now[:error] =  "Project could not be saved."
        render :new
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @project.destroy
    redirect_to projects_url
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
  
  private
  def set_project
     @project = Project.find(params[:id])
  end
end
