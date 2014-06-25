class ProjectsController < ApplicationController
  
  before_filter :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end
  
  def tags
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    end
    render :index
  end
  
  def new
    @project = Project.new
    authorize @project, :owner?
  end
  
  def create
    @project = Project.new(project_params)
    authorize @project, :owner?
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
    authorize @project, :owner?
  end
  
  def update
    @project = Project.find(params[:id])
    authorize @project, :owner?
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    authorize @project, :owner?
    @project.destroy
    redirect_to portfolio_url, notice: 'Project was successfully deleted.'
  end
  
  private
  def project_params
    params.require(:project).permit(*policy(@project || Project).permitted_attributes)
  end
  
  private
  def set_project
     @project = Project.find(params[:id])
  end
end
