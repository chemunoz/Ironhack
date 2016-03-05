require 'pry'

class Calculator
  def add (number)
    calc=number.split(",")
    #binding.pry
    total=calc.reduce(0) {|sum, x| sum+x.to_i}
    puts total
  end

  def add2 (number)
    total=0
    calc=number.split(",")
    calc.each do |item|
      total+=item.to_i
    end
    puts total
  end
end


obj=Calculator.new


obj.add("1,2,3,4,5")
obj.add2("1,2,3,4,5")


#COMPROBACION ADD
if 0==Calculator.new.add("")
  puts "FUNCIONA"
else
  "Está roto"
end

if 2==Calculator.new.add("2")
  puts "FUNCIONA"
else
  "Está roto"
end



#COMPROBACION ADD2
if 0==Calculator.new.add2("")
  puts "FUNCIONA"
else
  "Está roto"
end

if 2==Calculator.new.add2("2")
  puts "FUNCIONA"
else
  "Está roto"
end