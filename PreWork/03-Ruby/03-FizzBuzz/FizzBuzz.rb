
require 'pry' 
#binding.pry

	#MENU
	puts "######## MENU ########"
	puts "1 = Iteración 1: Fizz y Buzz"
	puts "2 = Iteracion 2: (WHILE) Fizz y Buzz"
	puts "3 = Iteracion 3: Fizz, Buzz y Bang"
	puts "4 = Iteracion 4: Refactoring"
	puts "######################"
	print "RESPUESTA:"
	respuesta = gets.chomp
	print "Número de Iteraciones:"
	vueltas = gets.chomp

	#binding.pry
	case respuesta

		when "1" #FIZZ BUZZ
			puts ""
			for i in 1..vueltas.to_i
				
				if (i%3==0) && (i%5==0)
					puts "FizzBuzz"
				elsif (i%3==0)
					puts "Fizz"
				elsif (i%5==0)
					puts "Buzz"
				else
					puts "#{i}"
				end
			end

		when "2"
			contador=1
			while contador<(vueltas.to_i+1)
				if (contador%3==0) && (contador%5==0)
					puts "FizzBuzz"
				elsif (contador%3==0)
					puts "Fizz"
				elsif (contador%5==0)
					puts "Buzz"
				else
					puts "#{contador}"
				end

				contador += 1
			end

		when "3" #FIZZ BUZZ BANG
			puts ""
			for i in 1..vueltas.to_i
				#binding.pry
				literal=false
				if (i%3==0) && (i%5==0)
					print "FizzBuzz"
					literal=true
				elsif (i%3==0)
					print "Fizz"
					literal=true
				elsif (i%5==0)
					print "Buzz"
					literal=true
				end

				#Decidimos si añadimos Bang o no
				if i.to_s[0]=="1"
					puts "Bang"
				elsif literal==false
					puts "#{i}"
				else
					print "\n"
				end
			end

		when "4" #REFACTORING
			puts ""
			for i in 1..vueltas.to_i
				result=""

				if (i%3!=0) && (i%5!=0)
				  result = i
				end

				if (i%3==0) && (i%5==0)
					result = "FizzBuzz"
				else				
					if i % 3 == 0
					  result << "Fizz"
					end
					
					if i % 5 == 0
					  result << "Buzz"
					end
				end

				#Correccion @raulvv
				#if i.to_s[0] == "1"
				#  result << "Bang"
				#end
			
				puts result
			end

	end