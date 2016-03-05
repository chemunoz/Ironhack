class ShoppingCart
	def initialize
		@items = []
	end
end


class Item 
	def initialize(name, price)
		@name = name
		@price = price
	end

	def price
		print "ARTICULO INDEFINIDO: Precio de #{@name} --> #{@price}€"
	end
end


class Houseware < Item
	def initialize (name, price)
		super(name,price)
		@descuento=0
	end

	def price
		if @price>100
			@price=@price-(@price*0.05)
		end
		print "ARTICULO DEL HOGAR: Precio de #{@name} --> #{@price}€"
	end
end


class Fruit < Item
	def initialize (name, price)
		super(name,price)
		@descuento=0
	end

	def price
		fecha=Time.new
		#Linea para forzar una fecha en concreto
		#fecha=Time.new(2016,1,17) 
		
		#puts "Dia de la semana: #{fecha.wday}"
		if fecha.wday==6 || fecha.wday==0
			@price=@price-(@price*0.1)
		end
		print "ARTICULO DE FRUTERIA: Precio de #{@name} --> #{@price-(@price*0.1)}€"
	end
end


banana = Fruit.new("Banana", 10)
zumo_naranja = Fruit.new("Oranje Juice", 10)
rice = Fruit.new("Arroz", 1)
vacuum_cleaner = Houseware.new("Aspiradora", 150)
anchovies = Houseware.new("Anchoas", 2)

cosa = Item.new("Cosa", 1500)

puts banana.price
puts zumo_naranja.price
puts rice.price
puts vacuum_cleaner.price
puts anchovies.price
puts cosa.price