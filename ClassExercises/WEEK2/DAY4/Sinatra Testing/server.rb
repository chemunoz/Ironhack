require "sinatra"


get "/" do #http://localhost:4567 
  "HOLA!!"
end

get "/real_page" do #http://localhost:4567/real_page
  "HOLA!!"
end

get "/hi" do #http://localhost:4567/hi
  redirect to('/real_page')
end

get "/adios" do
  "ADIOS"
end
