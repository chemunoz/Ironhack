require 'pry' 
#binding.pry


class MilkShake
	attr_reader :client_name, :total_price_of_milkshake, :ingredient_price

	def initialize (client_name)
		@base_price = 3					#Precio base de los batidos
		@ingredients = [ ]				#Array donde almacenaremos los ingrediente a usar en el batido
		@ingredient_price=0				#Precio de los ingredientes
		@ingredient_name_list=""		#Listado de los nombre de todos los ingredientes usados (mostrar por pantalla)
		@total_price_of_milkshake = 0	#Precio final del batido
		@client_name = client_name		#Nombre del cliente que solicita el batido		
	end

	def add_ingredient(ingredient)
		#Añado el ingrediente
		@ingredients.push(ingredient)	
	end

	def price_of_milkshake
		#Let's establish what our counter should be before we start adding ingredients into the mix
		@total_price_of_milkshake = @base_price
	
		#Add each ingredients price to our total
		@ingredients.each do |ingredient|
			#Va sumando precios de los ingredientes
			@total_price_of_milkshake += ingredient.price
			#Voy recopilando todos los nombres de ingredientes para listarlos al final
			@ingredient_name_list << ingredient.name
			#Controlo que si es el último elemento del array NO ponga la coma
			if ingredient.name!=@ingredients.last.name
				@ingredient_name_list << ", "
			end
		end
  
		#Calculo el precio del total de ingredientes (restandole al total la base)
		@ingredient_price = @total_price_of_milkshake-3
		
		#Muestro el nombre del cliente que encarga el helado y los ingredientes que ha pedido
		puts "Helado de #{client_name} (con #{@ingredient_name_list})"
		puts "En proceso ..."
	end
end


class Ingredient
	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end
end


class Shopping_List
	#Creo e inicializo las variables para el listado de batidos y el precio final
	def initialize
		@milksakes_list = [ ]
		@list_total_price = 0
	end

	#Vamos añadiendo los batidos que nos pasen
	def milksake_list_add(milkShake_unit)
		@milksakes_list.push(milkShake_unit)
	end

	#Emitimos el "ticket" de todos ellos con los precios
	def milksake_list_checkout
		puts "\n@@@@@@@@@@@ LISTA DE BATIDOS PEDIDOS @@@@@@@@@@@@@@"
		@milksakes_list.each do |batido|
			puts "Batido de #{batido.client_name}, PRECIO: #{batido.total_price_of_milkshake}€  (Base: 3 + Ingrediente/s: #{batido.ingredient_price})"
			#binding.pry
			@list_total_price += batido.total_price_of_milkshake
		end
		
				
		puts "TOTAL TICKET: #{@list_total_price}"
	end
end



#BATIDO 1
nizars_milkshake = MilkShake.new ("Nizar")

banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)

nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

puts nizars_milkshake.price_of_milkshake


#BATIDO 2
che_milkshake = MilkShake.new("Chema")

vainilla = Ingredient.new("Vainilla", 3)
cafe = Ingredient.new("Café", 1)

che_milkshake.add_ingredient(vainilla)
che_milkshake.add_ingredient(cafe)

puts che_milkshake.price_of_milkshake


#LISTA DE BATIDOS
lista=Shopping_List.new
lista.milksake_list_add(nizars_milkshake)
lista.milksake_list_add(che_milkshake)

lista.milksake_list_checkout