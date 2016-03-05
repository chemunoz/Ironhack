require 'rspec'
require 'pry'
require_relative '../lib/blog.rb'

describe Blog do
  before  :each do
    @blogy=Blog.new
  end

  describe "#posts" do
    it "test if the post is saved" do
      obj1=Post.new("Post title 1", "Post 1 text")
      obj2=Post.new("Post title 2", "Post 2 text")
      @blogy.add_post(obj1)
      @blogy.add_post(obj2)
      expect(@blogy.latest_posts).to eq([obj2,obj1])
    end
  end


end




