require 'pry' 
#binding.pry

def solve_cipher(input, shift)

 	print "#{input} ==> "

	#Convierto el String que nos pasa el usuario a un Array para poder convertir letra a letra
	salida=input.split(//)
 
	#recorro cada letra en el Array
	salida.each do |item|
		#Si es el " " lo sustituyo por su ASCII correspondiente para que mantega los espacios  	 
		if item.ord==32
			letra=32
		else
			item=item.ord+shift.to_i
			#Sustituyo el caracter anterior a la "a" por el de la "z"
			if item==96
			 	letra=122
			#Sustituyo el caracter anterior a la "A" por el de la Z"
			elsif item==64
				letra=90
			#Si es cualquier otro símbolo lo 
			else
				letra=item
			end
		end
	  	print letra.chr
	end
	puts""
end

puts "@@@@@@@@@@@@ AVE CESAR @@@@@@@@@@@@@@@"
puts "|                                    |"
print "Escribe una frase: "
frase = gets.chomp
print "Y ahora el desplazamiento (si no pones nada se entenderá -3): "
desplaza = gets.chomp
if desplaza==""
	desplaza=-3
end
#solve_cipher("ifmmp",-1)		#should return "hello"
#solve_cipher("p| uhdo qdph lv grqdog gxfn", -3)
solve_cipher(frase, desplaza)