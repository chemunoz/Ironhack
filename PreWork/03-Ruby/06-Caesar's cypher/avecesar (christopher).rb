require 'pry' 
#binding.pry


def solve_cipher2(texto, codec)
 puts texto
 arr_text =texto.chars.map { |item| item.ord}
 trad = arr_text.map { |item| codec.to_i+item.ord }
 puts trad.map { |item| item.chr  }.join
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
solve_cipher2(frase, desplaza)
