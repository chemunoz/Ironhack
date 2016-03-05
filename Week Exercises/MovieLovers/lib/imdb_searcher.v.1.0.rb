require 'Imdb'
require "pry"

class IMDBSearcher

  def search_by_title(film)
    imdb_array = Imdb::Search.new(film)
    films_hash=Hash.new

    if imdb_array.movies.length>=1
      imdb_array.movies.select! do |item|
        item.poster!=nil
      end
      films_hash=imdb_array.movies.first(9).map! do |item|
        {
          title: item.title,
          poster: item.poster, 
          plot: item.plot_summary,
          year: item.year
        }
      end 
    end
    films_hash
  end

end

# filmObj = IMDBSearcher.new.search_by_title("raffaella")