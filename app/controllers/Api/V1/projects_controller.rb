class Api::V1::ProjectsController < ApplicationController

  def index
    user = current_user
    projects = user.projects + user.participating_projects
    projects_with_list = projects.map do |project|
      {
        id:project.id,
        name:project.name,
        user_id:project.user.id,
        lists:project.lists
      }
    end
    render json: projects_with_list
  end

  def create
    project = Project.create(project_params)
    user = User.find(params[:user_id])
    user.projects << project
    render json: project
  end

  def show
    project = Project.find_by(id: params[:id])
    projectJson = {
      id:project.id,
      name:project.name,
      user_id:project.user.id,
      lists:project.lists
    }
    render json: projectJson
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
