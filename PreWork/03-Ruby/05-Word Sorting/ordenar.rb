require 'pry' 

def ordena (frase_parametro)
#binding.pry
	
	frase_parametro.gsub!(/[.!¡¿?]/, '')
	#Quito lo caracteres de puntuación

	frase_array=frase_parametro.split (' ')
	#Lo convierto en un array
	
	frase_array.sort! {|a,b| a.upcase<=>b.upcase}
	#Lo ordeno respetando las mayuculas/minusculas

	print "FRASE ORDENADA: #{frase_array.join(" ")}\n"
	puts ""
	#Lo junto como un string y lo presento
end

print "Escribe una frase (separada por espacios): "
frase = gets.chomp
ordena(frase)