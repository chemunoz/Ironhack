require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require "artii"


get "/ascii/:word/?:fonts?" do 
  a=Artii::Base.new :font=>params[:fonts] || "alligator"

  # if params[:fonts]!=nil
  #   a=Artii::Base.new :font=>params[:fonts]
  # else
  #   a=Artii::Base.new :font=>"alligator"
  # end
  "<pre>#{a.asciify(params[:word])}</pre>"
end


get "/ascii/unicorn/special/secret" do 
  "<img src='../../../unicorn.jpg' width=500>"
end