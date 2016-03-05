require 'pry'

class StringCalculator
  def add (number)
    calc=number.split(",")
    #binding.pry
    total=calc.reduce(0) {|sum, x| sum+x.to_i}
    total
  end

  def add2 (number)
    total=0
    calc=number.split(",")
    calc.each do |item|
      total+=item.to_i
    end
    total
  end
end


obj=StringCalculator.new


#obj.add("1,2,3,4,5")
#obj.add2("1,2,3,4,5")

#SIN BEFORE (METODO ADD)
# RSpec.describe "String calculator" do
#   it "returns 0 for the empty string" do
#     expect(StringCalculator.new.add("")).to eq(0)
#   end
# end


#SIN BEFORE (METODO ADD2)
# RSpec.describe "String calculator" do
#   it "returns 0 for the empty string" do
#     expect(StringCalculator.new.add2("2")).to eq(2)
#   end
# end



#CON BEFORE (METODO ADD)
# RSpec.describe "String calculator" do
#   before  :each do
#     @calculador=StringCalculator.new
#   end
  
#   it "returns 0 for the empty string" do
#     expect(@calculador.add("")).to eq(0)
#   end
# end

#CON BEFORE (METODO ADD2)
RSpec.describe "String calculator" do
  before  :each do
    @calculador=StringCalculator.new
  end
  
  it "returns 0 for the empty string" do
    expect(@calculador.add("")).to eq(0)
  end

  it "returns 0 for the empty string" do
    expect(@calculador.add("2")).to eq(2)
  end

  it "returns 0 for the empty string" do
    expect(@calculador.add("2,3")).to eq(5)
  end
end


#CON BEFORE (METODO ADD2)
# RSpec.describe "String calculator" do
#   before  :each do
#     @calculador=StringCalculator.new
#   end
  
#   it "returns 0 for the empty string" do
#     expect(@calculador.add("")).to eq(0)
#   end

#   it "returns 0 for the empty string" do
#     expect(@calculador.add("2")).to eq(2)
#   end

#   it "returns 0 for the empty string" do
#     expect(@calculador.add("2,3")).to eq(5)
#   end
# end



#CON LET y BEFORE (METODO ADD)
RSpec.describe "String calculator" do
  let (:calculator){StringCalculator.new}
  
  it "returns 0 for the empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns 0 for the empty string" do
    expect(calculator.add("2")).to eq(2)
  end

  it "returns 0 for the empty string" do
    expect(calculator.add("2,3")).to eq(5)
  end
end
