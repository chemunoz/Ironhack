require 'pry' 
#binding.pry

class ShoppingCart
	def initialize
		@items = []
		@sum_total = 0
	end
  	
  	#Vamos añadiendo los articulos que nos pasen
	def item_add(item_4_cart)
		@items.push(item_4_cart)
	end

	#Método para generar el "ticket de caja" final
	def show_cart
		descuento=0
		puts "\n@@@@@@@@@@@@@@@@@ YOUR SHOPPING CART @@@@@@@@@@@@@@@@@@@"
		puts "|         	   	    	                       |"
		#Recorremos todos los articulos añadimos en el método "item_add" mostrando 
		#sus propiedades (nombre y precio) y la suma total de todos ellos
		@items.each do |arti|
			print "ARTICULO #{arti.class}: "<< arti.name << "  --->  "
			puts arti.price.to_s << "€"
			@sum_total += arti.price.to_i
		end
		if @items.length>5
			descuento=@sum_total*0.1
			@sum_total=@sum_total-descuento
		end
		print "|         	   	    	                       |\n"
		print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  Articulos: #{@items.length}\n"
		print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  Dto (más de 5): #{descuento}€\n"
		puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  TOTAL: #{@sum_total}€"
	end
end

#ARTICULO GENERICO
class Item 
	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end


end


#ARTICULO DEL HOGAR
class Houseware < Item
	def initialize (name, price)
		super(name,price)
	end

	def price
		#Si el precio es superior a 100€, le hacemos un descuento del 5%
		if @price>100
			@price=@price-(@price*0.05)
		end
		@price
	end
end


#ARTICULO DE FRUTERIA
class Fruit < Item
	def initialize (name, price)
		super(name,price)
	end

	def price
		fecha=Time.new
		#Linea para forzar una fecha en concreto
		#fecha=Time.new(2016,1,17) 
		
		#Si es fin de semana, le hacemos un descuento del 10%
		if fecha.wday==6 || fecha.wday==0
			@price=@price-(@price*0.1)
		end
		@price
	end
end






carrito = ShoppingCart.new

banana = Fruit.new("Banana", 10)
zumo_naranja = Fruit.new("Oranje Juice", 10)
rice = Fruit.new("Arroz", 1)
vacuum_cleaner = Houseware.new("Aspiradora", 150)
anchovies = Houseware.new("Anchoas", 2)

#Articulo sin categoria (ejemplo de como seria si no son Frutas o Articulos del Hogar)
cosa = Item.new("Cosa", 1500)

carrito.item_add(banana)
carrito.item_add(zumo_naranja)
carrito.item_add(rice)
carrito.item_add(vacuum_cleaner)
carrito.item_add(anchovies)

#Articulo sin categoria (ejemplo de como seria si no son Frutas o Articulos del Hogar)
carrito.item_add(cosa)

carrito.show_cart 