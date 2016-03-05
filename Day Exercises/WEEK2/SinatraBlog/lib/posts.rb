require 'pry' 

class Post
  attr_reader :title, :date, :post, :category, :author
  def initialize(title, post, category, author)
    @title=title
    @date=Time.new#.strftime("%d/%b/%Y:%H:%M:%S")
    @post=post
    @category=category
    @author=author
  end
end