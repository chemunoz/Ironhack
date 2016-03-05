require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative './lib/blog.rb'
require_relative './lib/posts.rb'

blogg = Blog.new
blogg.add_post(Post.new("Post title 1", "Post 1 text", "Javi"))
blogg.add_post(Post.new("Post title 2", "Post 2 text", "Joaquin"))
blogg.add_post(Post.new("Post title 3", "Lorem ipsum dolor sit amet, consectetur adipisicing elit. At iure, asperiores, omnis numquam nihil architecto, aut blanditiis ipsa saepe quidem ex culpa hic excepturi eius cupiditate similique, quibusdam harum neque.", "Christopher"))


get "/" do #http://localhost:4567  
  @posts=blogg.latest_posts 
  erb(:posts)
end

get "/post_details/:id" do
  @post_detail=blogg.latest_posts
  @id=params[:id]
  erb(:details)
end


get "/new_post" do
  erb(:new_post)
end

post "/save_post" do
  blogg.add_post(Post.new(params[:title],params[:body],params[:category],params[:author]))
  redirect '/'
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
# post "/calculate" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f

#   case params[:operation]
#   when "addition"
#     Calculator.new.add(first,second)
#   when "subtract"
#     Calculator.new.substract(first,second)
#   when "multiply"
#     Calculator.new.multiply(first,second) 
#   when "division"  
#     Calculator.new.divide(first,second)
#   end
# end

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
