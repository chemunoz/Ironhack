class Api::V1::TasksController < ApplicationController
  before_action :user_exists
  before_action :task_exists, only: [:show, :destroy, :complete]

  def index
    completed_tasks = @user.tasks.where(completed: true)
    pending_tasks = @user.tasks.where(completed: :false)
    #tasks = @user.tasks #.all (me lo ahorro porque ya me lo devuelve por default
    #render json: tasks
    render json: {completed: completed_tasks, pending: pending_tasks}
  end

  def create
    task = @user.tasks.create(task_params)
    render json: task
  end

  def show
    render json: @task
  end 

  def destroy
    @task.destroy #no tenemos que definilo en el modelo porque lo hereda de ActiveRecord
    render json: @task
  end

  def complete
    @task.complete!
    render json: @task
  end



  private
  def user_exists
    @user = User.find_by(id: params[:user_id])
    unless @user
      render json: {error: "user not found"}, status: 400
      return
    end
  end

  def task_exists
    @task = Task.find_by(id: params[:id])
    unless @task
      render json: {error: "task not found"}, status: 400
      return
    end
  end

  def task_params
    params.require(:task).permit(:name, :due_date)
  end
end