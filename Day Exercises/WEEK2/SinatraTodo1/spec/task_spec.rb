require 'rspec'
require 'pry'
require './task.rb'

describe Task do 
  before  :each do
    @tasky=Task.new("Buy the milk")
  end
  
  describe "#complete!" do
    it "set the status a true=done" do
      expect(@tasky.complete!).to eq(true)
    end
  end
  
  describe "#make_incomplete!" do
    it "set the status a false=pending" do
      expect(@tasky.make_incomplete!).to eq(false)
    end
  end

  describe "#complete?" do
    it "test the state of the task (false=pending / true=done)" do
      expect(@tasky.complete?).to be false
    end
  end

  describe "#update_content!" do
    it "update the text of the task" do
      expect(@tasky.update_content!("Hooola Amigooos")).to eq("Hooola Amigooos")
    end
  end

  describe "@created_at" do
    it "check the time of creation" do
      expect(@tasky.created_at).to eq(Time.now.strftime("%d/%b/%Y:%H:%M:%S"))
    end
  end
end

