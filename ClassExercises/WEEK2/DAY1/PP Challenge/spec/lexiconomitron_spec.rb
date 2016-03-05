require 'rspec'
require './lexiconomitron.rb'

describe Lexiconomitron do 
  let (:lexi){Lexiconomitron.new}
  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
    it "invert the order of the letters" do
      expect(lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
  end

  describe "#oompa_loompa" do
    it "invert the order of the letters" do
      expect(lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
  end
end
