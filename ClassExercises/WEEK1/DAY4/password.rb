  def pass(user,pass)
    if user="usuario" && pass=="1234"
      puts "Introduce un texto:"
      phrase = gets.chomp
      print "\nNumber of letters: #{phrase.size}\n"
      print "Number of words: #{phrase.split.size}\n"
    else
      print "\nInvalid User and/or password"
    end
  end

  print "User: "
  user=gets.chomp
  print "Password: "
  pas=gets.chomp
  print "\n"
  pass(user,pas)