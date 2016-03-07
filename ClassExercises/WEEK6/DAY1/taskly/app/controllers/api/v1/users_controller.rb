class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
    # render xml: users
  end


  def create
    user = User.create(user_params)
    render json: user
  end


  def show
    user = User.find_by(id: params[:id])
    unless user
      render json: {error: "user not found"}, status: 400
      return
    end
    render json: user
  end


  def update
    user = User.find_by(id: params[:id])
    unless user
      render json: { error: "user not found"}, status: 400
      return
    end
    user.update(user_params)
    render json: user
  end


  def destroy
    user = User.find_by(id: params[:id])
    unless user
      render json: { error: "user not found"}, status: 400
      return
    end
    user.destroy
    render json: user
  end


  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
