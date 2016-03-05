require 'Imdb'

class Films
  def initialize(arrayID)
    @arrayID=arrayID
  end

  def film_rating(idArray)
    idArray.each do |item|
     i = Imdb::Movie.new(item)
     puts i.rating
    end
  end

  
def search_film(film)
  idArray = []
    film.each do |item|
    i = Imdb::Search.new(item)
    idArray.push (i.movies[0].id)
    end
    film_rating(idArray)
  end
end

#filmsArray = ["0087332","0095016","0068646","0099785","1408101"]

filmsArray = ["Ghostbusters", "Die Hard", "The Godfather", "Home Alone", "Star Trek", "Titanic"]

filmObj = Films.new(filmsArray)
#filmObj.film_rating
filmObj.search_film(filmsArray)
#peli.search_film("Star Trek")