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
end


#ARTICULO GENERICO
class Item 
	def initialize(name, price)
		@name = name
		@price = price
	end

	#No sólo devolvemos el precio del artículo, sino tambien el nombre
	def price
		print "ARTICULO INDEFINIDO: Precio de #{@name} --> #{@price}€"
	end
end

#ARTICULO DEL HOGAR
class Houseware < Item
	def initialize (name, price)
		super(name,price)
		@descuento=0
	end

	#No sólo devolvemos el precio del artículo, sino tambien el nombre y el descuento hecho
	def price
		if @price>100
			print "ARTICULO DEL HOGAR: Precio de #{@name} --> #{@price-(@price*0.05)}€ (Dto: #{@price*0.05}€)"
			#@price=@price-(@price*0.05)
		else
			print "ARTICULO DEL HOGAR: Precio de #{@name} --> #{@price}€"	
		end
		
	end
end


#ARTICULO DE FRUTERIA
class Fruit < Item
	def initialize (name, price)
		super(name,price)
		@descuento=0
	end

	#No sólo devolvemos el precio del artículo, sino tambien el nombre y el descuento hecho
	def price
		fecha=Time.new
		#Linea para forzar una fecha en concreto
		#fecha=Time.new(2016,1,17) 
		
		#puts "Dia de la semana: #{fecha.wday}"
		if fecha.wday==6 || fecha.wday==0
			print "ARTICULO DE FRUTERIA: Precio de #{@name} --> #{@price-(@price*0.1)}€ (Dto: #{@price*0.1}€)"
			#@price=@price-(@price*0.1)
		else
			print "ARTICULO DE FRUTERIA: Precio de #{@name} --> #{@price}€"
		end
		
	end
end




#Creamos el carrito
carrito = ShoppingCart.new

#Creamos los articulos
banana = Fruit.new("Banana", 10)
zumo_naranja = Fruit.new("Oranje Juice", 10)
rice = Fruit.new("Arroz", 1)
vacuum_cleaner = Houseware.new("Aspiradora", 150)
anchovies = Houseware.new("Anchoas", 2)

#Articulo sin categoria (ejemplo de como seria si no son Frutas o Articulos del Hogar)
cosa = Item.new("Cosa", 1500)

#Mostramos por pantalla los precios de cada articulo
puts banana.price
puts zumo_naranja.price
puts rice.price
puts vacuum_cleaner.price
puts anchovies.price
puts cosa.price