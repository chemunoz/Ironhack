require 'rspec'
require 'pry'
require_relative '../lib/films.rb'



describe Films do
  before  :each do
    @tasky=Films.new
  end

  describe "" do
    it "set the status a true=done" do
      hashes=[{:title=>"Raffaela (2013) (Short)", :poster=>"http://ia.media-imdb.com/images/M/MV5BMjA4OTMwMzkxMF5BMl5BanBnXkFtZTcwNTc5NDg2OQ@@.jpg", :plot=>"An intimate portrait of 87-year-old Raffaela. After leaving her home in Italy nearly sixty years ago for England, she reflects back on her life and opens up candidly to her grandson about life, love and food."},
      {:title=>"Raffaello Follieri (2010) (TV Episode) - American Greed (2007) (TV Series)", :poster=>"http://ia.media-imdb.com/images/M/MV5BMjM1NTg5ODE0Nl5BMl5BanBnXkFtZTgwNjk1MDYyMjE@.jpg", :plot=>"Millionaire playboy and girlfriend of a Hollywood starlet scams investors with a phony connection to the Pope. His image soon will be shattered when he is revealed as a con man when a multi-million dollar fraud is exposed."},
      {:title=>"- American Greed (2007) (TV Series)", :poster=>"http://ia.media-imdb.com/images/M/MV5BNzQ5Njc2MjQyMF5BMl5BanBnXkFtZTgwNTQ5OTE0MjE@.jpg", :plot=>nil}]
      
      expect(@tasky.complete!).to eq(true)
    end
  end


end
#   describe "#make_incomplete!" do
#     it "set the status a false=pending" do
#       expect(@tasky.make_incomplete!).to eq(false)
#     end
#   end

#   describe "#complete?" do
#     it "test the state of the task (false=pending / true=done)" do
#       expect(@tasky.complete?).to be false
#     end
#   end

#   describe "#update_content!" do
#     it "update the text of the task" do
#       expect(@tasky.update_content!("Hooola Amigooos")).to eq("Hooola Amigooos")
#     end
#   end

#   describe "@created_at" do
#     it "check the time of creation" do
#       expect(@tasky.created_at).to eq(Time.now.strftime("%d/%b/%Y:%H:%M:%S"))
#     end
#   end
#end
