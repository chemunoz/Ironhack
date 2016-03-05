require 'pry' 
#binding.pry
#require_relative 'post.rb'

class Blog
  def initialize
    @posts_array = []
    @current_pagination=1
    @pagination_items=3
  end

  def add_post(postt) #postt=Post Object
    @posts_array.push(postt)
  end

  def posts
    @posts_array
  end

  def latest_posts
    @posts_array.reverse {|a,b| b.date <=> a.date}
  end

  # def publish_front_page
  #   loop do 
  #     # system("clear")
  #     # puts "$$$$$$$$ WELCOME TO CHEBLOG $$$$$$$$$$$"
  #     # puts "(type 'next'/'prev' or the number of the page or 'exit' to finish)\n\n"
      
  #     array_items=items_2_show(@current_pagination)

  #     array_items.each do |item|
  #       if(item.title==="Post title 2")
  #         puts "******" + item.title + "******"
  #       else
  #         puts item.title
  #       end
  #       puts "***************"
  #       puts item.post
  #       puts "---------------"
  #       puts ""
  #     end

  #     #PAGINATION
  #     for i in 1..pagination
  #       if i==@current_pagination
  #         print "#{i} ".green
  #       else
  #         print "#{i} "
  #       end
  #     end
  #     puts ""

  #     respuesta = gets.chomp
  #     #binding.pry
  #     if respuesta.to_i!=0
  #       @current_pagination=respuesta.to_i
  #     else
  #       if respuesta.to_s.downcase==="next"
  #        @current_pagination=@current_pagination+1
  #       end
  #       if respuesta.to_s.downcase==="prev"
  #         @current_pagination=@current_pagination-1
  #       end
  #     end
  #   break if respuesta==="exit"
  #   end 
  # end


  


  # def pagination
  #   pags=(@posts_array.length.to_f/@pagination_items.to_f).ceil
  # end


  # def items_2_show(page)
  #   item_counter=0
  #   array_page=[]
  #   counter=0

  #   item_2_end=page.to_i*@pagination_items
  #   item_2_start=item_2_end-(@pagination_items-1)

  #   @posts_array.reverse.each do |x|
  #     #binding.pry
  #     counter+=1;
  #     #binding.pry
  #     if counter>=item_2_start && counter<=item_2_end
  #       if item_counter<@pagination_items
  #         item_counter+=1
  #         array_page.push(x)    
  #       end
  #     end
  #   end
  #   array_page
  # end

end


# blogg = Blog.new()
# blogg.add_post Post.new("Post title 1", "Post 1 text")
# blogg.add_post Post.new("Post title 2", "Post 2 text")
# blogg.add_post Post.new("Post title 3", "Post 3 text")
# blogg.posts