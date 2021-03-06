class Api::V1::TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.create(task_params)
    list = List.find(params[:list_id])
    list.tasks << task
    render json: task
  end

  def show
    task = Task.find_by(id: params[:id])
    render json: task
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(task_params)
    render json: task
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    tasks = Task.all
    render json: tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :list_id, :description)
  end

end
