class CitiesController < ApplicationController
  def index
    @cities_in_ddbb=City.all
  end
end
