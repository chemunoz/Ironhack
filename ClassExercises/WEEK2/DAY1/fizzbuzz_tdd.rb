#FIZZ BUZZ
require 'rspec'

class FizzBuzz
  def calc(number)
    if number%3==0 && number%5==0 && number>0
      "FizzBuzz"
    elsif number%3==0 && number>0
      "Fizz"
    elsif number%5==0 && number >0
      "Buzz"
    else
      number
    end
  end

  #REFACTOR
  def calc_refact(number)
    result=""
    if number%3==0 && number>0
      result="Fizz"
    end
    if number%5==0 && number >0
      result+="Buzz"
    end
    result.empty? ? number : result
  end
end

#FizzBuzz.calc(3)


#TDD sin Refactor
# RSpec.describe "FizzBuzz" do
#   let (:fizzbuzz){FizzBuzz.new}
  
#   it "returns the number if the number isn't divisible by 3 neither by 5" do
#     expect(fizzbuzz.calc(0)).to eq(0)
#   end

#   it "returns the number if the number isn't divisible by 3 neither by 5" do
#     expect(fizzbuzz.calc(2)).to eq(2)
#   end

#   it "returns Fizz if number is divible by 3" do
#     expect(fizzbuzz.calc(3)).to eq("Fizz")
#   end

#   it "returns Fizz if number is divible by 3" do
#     expect(fizzbuzz.calc(6)).to eq("Fizz")
#   end

#   it "returns Buzz if number is divible by 5" do
#     expect(fizzbuzz.calc(5)).to eq("Buzz")
#   end

#   it "returns FizzBuzz if number is divible by 5 AND by 3" do
#     expect(fizzbuzz.calc(105)).to eq("FizzBuzz")
#   end
# end

#TDD CON Refactor
RSpec.describe "FizzBuzz" do
  let (:fizzbuzz){FizzBuzz.new}
  
  it "returns the number if the number isn't divisible by 3 neither by 5" do
    expect(fizzbuzz.calc_refact(0)).to eq(0)
  end

  it "returns the number if the number isn't divisible by 3 neither by 5" do
    expect(fizzbuzz.calc_refact(2)).to eq(2)
  end

  it "returns Fizz if number is divible by 3" do
    expect(fizzbuzz.calc_refact(3)).to eq("Fizz")
  end

  it "returns Fizz if number is divible by 3" do
    expect(fizzbuzz.calc_refact(6)).to eq("Fizz")
  end

  it "returns Buzz if number is divible by 5" do
    expect(fizzbuzz.calc_refact(5)).to eq("Buzz")
  end

  it "returns FizzBuzz if number is divible by 5 AND by 3" do
    expect(fizzbuzz.calc_refact(105)).to eq("FizzBuzz")
  end
end
