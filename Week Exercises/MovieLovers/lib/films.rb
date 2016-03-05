require 'Imdb'
require "pry"


class IMDBSearcher

  def search_by_title(film)
    imdb_array = Imdb::Search.new(film)
  end

end


class Films

  def search_film(film)
    selected_array=IMDBSearcher.new.search_by_title(film)
    transform_array(selected_array)
  end

  def transform_array(imdb_array)
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








# filmObj = Films.new
# filmObj.search_film("raffaella")
