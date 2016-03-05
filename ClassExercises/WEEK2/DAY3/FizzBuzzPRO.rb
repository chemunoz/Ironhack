#lambda es una funcion que guardas para ejecutar despues

array_rules=[
  {rule: =>lambda{|num| num %3 == 0}, text: "Fizz"},
  {rule: =>lambda{|num| num %5 == 0}, text: "Buzz"}
]

class FizzBuzz
  def initialize rules
    @rules = rules
  end

  def conv number
    result= ""
    @result.each do |rule|
      result+=rule[:text] if rule[:rule].call(number)
    end 
    result.empty? ? number : result
  end

end

FizzBuzz.new(array_rules).conv(3)