class Calculator
  def add(num1, num2)
    first = num1
    second = num2
    result = first + second
    # save("ADD: #{num1} + #{num2} = #{result}")
    save("#{result}")
    "<img src='./logo.png' width='100'><br><br>#{first} + #{second} = #{result}<br><button type='submit' name='save_button' value='save'>SAVE</button>"
  end
  
  def substract(num1, num2)
    first = num1
    second = num2
    result = first - second
    # save("SUBSTRACT: #{num1} + #{num2} = #{result}")
    save("#{result}")
    "<img src='./logo.png' width='100'><br><br>#{first} - #{second} = #{result}<br><button type='submit' name='save_button' value='save'>SAVE</button>"
  end

  def multiply(num1, num2)
    first = num1
    second = num2
    result = first * second
    # save("MULTIPLY: #{num1} + #{num2} = #{result}")
    save("#{result}")
    "<img src='./logo.png' width='100'><br><br>#{first} * #{second} = #{result}<br><button type='submit' name='save_button' value='save'>SAVE</button>"
  end

  def divide(num1, num2)
    first = num1
    second = num2
    result = first / second
    # save("DIVIDE: #{num1} + #{num2} = #{result}")
    save("#{result}")
    "<img src='./logo.png' width='100'><br><br>#{first} / #{second} = #{result}<br><button type='submit' name='save_button' value='save'>SAVE</button>"
  end

  def save(operation)
    file=File.open("./public/state.txt","w")
    file.puts(operation)
    file.close
  end
end