class Api::TournamentsController < ApplicationController
  
  def index
    tours=Tournament.all
    render json: tours
  end

  def create
    tour = Tournament.create(tournament_params)
    render json: tour
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
