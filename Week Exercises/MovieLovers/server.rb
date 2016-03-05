require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require 'Imdb'
require_relative './lib/films.rb'
require_relative './lib/imdb_searcher.rb'


get "/" do #http://localhost:4567
  erb(:search_form)
end

post "/search_results" do
  # @text_searched=params[:title]
  # params[:film_question]
  # @results = Films.new(IMDBSearcher.new).search_film(@text_searched)
  # @results.length>0 ? @random_year=@results.sample[:year] : @random_year=0
  # erb(:search_results)
  @text_searched=params[:title]
  params[:film_question]
  @results = Films.new.search_film(@text_searched)
  @results.length>0 ? @random_year=@results.sample[:year] : @random_year=0
  erb(:search_results)
end

post "/answer" do
  @params[:film_answered]==params[:film_question] ? "OHH YEEAAAH" : "MUY MAAL"
end
