class Api::V1::ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: projects
  end

  def create
    project = Project.create(project_params)
    user = User.find(params[:user_id])
    user.projects << project
    render json: project
  end

  def show
    project = Project.find_by(id: params[:id])
    render json: project
  end

  def update
    project = Project.find_by(id: params[:id])
    project.update(project_params)
    render json: project
  end

  def destroy
    project = Project.find_by(id: params[:id])
    project.destroy
    projects = Project.all
    render json: projects
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

end
