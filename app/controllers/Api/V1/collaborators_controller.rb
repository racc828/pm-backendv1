class Api::V1::CollaboratorsController < ApplicationController

  def index
    project = Project.find(params[:project_id])
    bybug
    collaborators = project.collaborators
    render json: collaborators
  end

  def create
    user = User.find(collaborator_params[:collaborator_id])
    project = Project.find(params[:project_id])
    user.participating_projects << project
    projects = user.projects + user.participating_projects
    render json: projects
    # collaborator = Collaborator.create(collaborator_params)
    # project = Project.find(params[:project_id])
    # project.collaborators << collaborator
    # render json: collaborator
  end

  def show
    collaborator = Collaborator.find_by(id: params[:id])
    render json: collaborator
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:project_id, :collaborator_id)
  end

end
