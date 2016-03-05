require "sinatra"
require "sinatra/reloader" if development?
require "pry"
enable(:sessions)

get "/" do #http://localhost:4567 
  "<h1>My first Sinatra app.</h1>"
end

get "/hi" do #http://localhost:4567/hi
  @greeting="Hello World"
  erb(:hipage)
end

get "/about" do #http://localhost:4567/about
  "<h2>Welcome to my awesome personal web!!</h2>"
end

get "/author" do #http://localhost:4567/author
  erb(:author)
end

get "/time" do #http://localhost:4567/time
  @timer=Time.now.strftime("%d/%b/%Y:%H:%M:%S")
  erb(:time)
end

get "/pizza" do #http://localhost:4567/pizza
  @ingredients=["cheese", "pepperoni", "mushrooms"]
  erb(:pizza)
end

get "/users/:username" do
  @username=params[:username]
  erb(:user_profile)
end

get "/sum/:num1/:num2" do
  @sum=params[:num1].to_i+params[:num2].to_i
  erb(:sum)
end

get "/hours/ago/:num1" do
  @hour=params[:num1]
  @updated_time=(Time.now-(@hour.to_i * 3600)).strftime("%H:%M:%S")
  #binding.pry
  erb(:hour)
end

get "/tetera" do
  status(418)
  "I'm a teapot!!"
end

get "/sessions_test/:text" do
  text=params[:text]
  session[:saved_value]=text
end

get "/sessions_test" do
  session[:saved_value]
end
