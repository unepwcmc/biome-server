class ProjectsController < ApplicationController
  layout "dashboard"
  
  respond_to :html, :json

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_with(@project) do |format|
      if @project.save
        format.html { redirect_to @project, :notice => 'Project was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
   @project =  Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_with(@project) do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to @project, :notice => 'Project was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_with(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project was successfully deleted.'

    respond_with(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, layers_attributes: [:id, :name, :_destroy],
                                    layers_projects_attributes: [:id, :layer_id, :_destroy])
  end
end
