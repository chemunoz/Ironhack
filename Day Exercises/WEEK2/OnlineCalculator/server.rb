require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative './lib/calculator_logic'


enable(:sessions)

get "/" do #http://localhost:4567 
  file=File.open("./public/state.txt","r")
  #binding.pry
  @prev=file.readlines[0].to_i
  file.close
  @newyork=(Time.now-(6* 3600)).strftime("%H:%M:%S")
  @tokio=(Time.now+(8 * 3600)).strftime("%H:%M:%S")
  @moscow=(Time.now+(2 * 3600)).strftime("%H:%M:%S")

  erb(:menu)
end

# ITERATION 1
# get "/add" do #http://localhost:4567/add
#   erb(:add)
# end


#ITERATION 2
# post "/calculate_add" do
#    first = params[:first_number].to_f
#    second = params[:second_number].to_f
#    Calculator.new.add(first,second)
# end

# post "/calculate_substract" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Calculator.new.substract(first,second)
# end

# post "/calculate_multiply" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Calculator.new.multiply(first,second)
# end

# post "/calculate_divide" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Calculator.new.divide(first,second)
# end


# ITERATION 3
post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f

  case params[:operation]
  when "addition"
    Calculator.new.add(first,second)
  when "subtract"
    Calculator.new.substract(first,second)
  when "multiply"
    Calculator.new.multiply(first,second) 
  when "division"  
    Calculator.new.divide(first,second)
  end
end

# get "/about" do #http://localhost:4567/about
#   "<h2>Welcome to my awesome personal web!!</h2>"
# end

# get "/author" do #http://localhost:4567/author
#   erb(:author)
# end

# get "/time" do #http://localhost:4567/time
#   @timer=Time.now.strftime("%d/%b/%Y:%H:%M:%S")
#   erb(:time)
# end

# get "/pizza" do #http://localhost:4567/pizza
#   @ingredients=["cheese", "pepperoni", "mushrooms"]
#   erb(:pizza)
# end

# get "/users/:username" do
#   @username=params[:username]
#   erb(:user_profile)
# end

# get "/sum/:num1/:num2" do
#   @sum=params[:num1].to_i+params[:num2].to_i
#   erb(:sum)
# end

# get "/hours/ago/:num1" do
#   @hour=params[:num1]
#   @updated_time=(Time.now-(@hour.to_i * 3600)).strftime("%H:%M:%S")
#   #binding.pry
#   erb(:hour)
# end

# get "/tetera" do
#   status(418)
#   "I'm a teapot!!"
# end

# get "/sessions_test/:text" do
#   text=params[:text]
#   session[:saved_value]=text
# end

# get "/sessions_test" do
#   session[:saved_value]
# end
