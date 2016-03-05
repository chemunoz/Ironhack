require 'pry' 
#binding.pry


class ShakeShope
  def initialize
		@carta_milkshakes = []


	end
	def add_milkshakes(milkshake)
		@carta_milkshakes.push(milkshake)
	end
	def milkshakes_list
		@carta_milkshakes.each do |milkshaker|
			#milkshaker


			#milkshake.price_of_milkshake
			#la anterior linea da como error un undefined mehod for sring (normal)
		end
    puts "HOLA"
	end
end
​
class MilkShake
  
  def initialize 
    @base_price = 3
    @total_price = 0
    @ingredients = []
  end
  def add_ingredient(ingredient)
  	@ingredients.push(ingredient)
  end
  def price_of_milkshake
  	@total_price= @base_price
  	@ingredients.each do |ingredient|
  	@total_price += ingredient.price
  	end
   	@total_price
  end
end


class Ingredient
	attr_reader :name, :price 
  def initialize(name, price)
    @name = name
    @price = price
  end
end
​


banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
mint = Ingredient.new("Mint",1)
cookies = Ingredient.new("Cookies",2)
vainilla = Ingredient.new("Vainilla",2)
crunch = Ingredient.new("Crunchs",3)
​
nizars_milkshake = MilkShake.new
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)
nizars_milkshake.add_ingredient(mint)
​
chris_milkshake = MilkShake.new 
chris_milkshake.add_ingredient(vainilla)
chris_milkshake.add_ingredient(cookies)
chris_milkshake.add_ingredient(crunch)
#esto imprime bien los precios
#puts nizars_milkshake.price_of_milkshake
#puts chris_milkshake.price_of_milkshake
​
josh_shop = ShakeShope.new
josh_shop.add_milkshakes(nizars_milkshake)
josh_shop.add_milkshakes(chris_milkshake)
​
#La siguiente linea imprime los nombres de los batidos
puts josh_shop.milkshakes_list