puts "WELCOME TO COPIA-ARCHIVO SOFT\n\n"

#PEDIMOS EL ORIGEN
puts "What is the source file?:"
source_file = gets.chomp

#PEDIMOS EL DESTINO
puts "What is the destination file?:"
destination_file = gets.chomp

#LEEMOS EL CONTENIDO DEL ORIGEN
source_file_contents = IO.read(source_file)

#ESCRIBIMOS EL CONTENIDO DEL ORIGEN EN EL DESTINO
IO.write(destination_file, source_file_contents) 

puts "\n\n@@@@@ ENHORABUENA@@@@@\n\nProcess ended. We write the content of "+source_file+" into "+destination_file 