require 'Imdb'
require "pry"
require_relative 'imdb_searcher'

class Films
  def initialize(imdbsearcher)
    @imdbsearcher=imdbsearcher
  end
  
  def search_film(film)
    selected_array=@imdbsearcher.search_by_title(film)
  end

end

# filmObj = Films.new
# filmObj.search_film("raffaella")