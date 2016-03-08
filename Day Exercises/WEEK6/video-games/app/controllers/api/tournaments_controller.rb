class Api::TournamentsController < ApplicationController
  
  def index
    tours=Tournament.all
    render json: tours
  end

  def create
    tour = Tournament.create(tournament_params)
    render status: 201, json: tour
  end

  def delete
    tour = Tournament.find(params[:id])
    tour.destroy
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
