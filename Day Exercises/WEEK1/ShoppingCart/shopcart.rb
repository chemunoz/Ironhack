require 'pry'

class ShoppingCart
  def initialize(season)
    @items_season_cost=
    {
      spring: {apples: 10,oranges: 5, grapes: 15, bananas: 20, watermelon: 50},
      summer: {apples: 10,oranges: 2, grapes: 15, bananas: 20, watermelon: 50},
      autumn: {apples: 15,oranges: 5, grapes: 15, bananas: 20, watermelon: 50},
      winter: {apples: 12,oranges: 5, grapes: 15, bananas: 21, watermelon: 50}
    }
    @season=season
    @items_units={}
    @items_discount={}
    @weekday=Time.now.strftime("%A")
  end

  def add_item_to_cart(item)
    @items_units[item]===nil ? @items_units[item]=1 : @items_units[item]=@items_units[item]+1
  end

  def show
    system("clear")
    puts "@@@@@@@@@@ SHOPPING CART @@@@@@@@@@\n"
    puts "(We are in #{@season})"

    discount

    list_number=0
    @items_units.each do |key, unit|
      print (list_number+=1).to_s + ". "
      puts key.to_s << ": " << (@items_season_cost[@season][key]*unit).to_s + "€ (#{unit} items)"
    end
    puts "Precio total: " << cost.to_s << "€ (discounts has been apllied)"
  end

  def cost
    total=0
    @items_units.each do |key, unit|
      if @weekday==="Sunday" && key===:watermelon
        @items_discount[key]!=nil ? total+=(@items_season_cost[@season][key]*2)*(unit-@items_discount[key]) : total+=(@items_season_cost[@season][key]*2)*unit
      else
        @items_discount[key]!=nil ? total+=@items_season_cost[@season][key]*(unit-@items_discount[key]) : total+=@items_season_cost[@season][key]*unit
      end
    end
    total
  end

  def discount
    @items_units.each do |key, unit|
      # Buy 2 apples and pay just one!
      if key===:apples && unit>=2
        @items_discount[key]=unit/2
      # Buy 3 oranges and pay just 2!  
      elsif key===:oranges && unit>=3
        @items_discount[key]=unit/3
      # Buy 4 grapes you get one banana for free if you want!
      elsif key===:grapes && unit>=4
          print "Ey! You buy #{@items_units[key]} Grapes, so Would you like #{unit/4} bananas? (y=YES, n=NO)"
          answer=gets.chomp
          if answer.downcase==="y"
            @items_units[:bananas]=@items_units[:bananas]+unit/4
          end
      end
    end
  end


end







cart = ShoppingCart.new(:summer)

cart.add_item_to_cart :apples
cart.add_item_to_cart :bananas
cart.add_item_to_cart :bananas
cart.add_item_to_cart :grapes
cart.add_item_to_cart :apples
cart.add_item_to_cart :oranges
cart.add_item_to_cart :oranges
cart.add_item_to_cart :oranges
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes


cart.show

cart.cost

#            Spring Summer Autumn Winter
# apples        10$    10$    15$    12$
# oranges        5$     2$     5$     5$
# grapes        15$    15$    15$    15$
# banana        20$    20$    20$    21$
# Watermelon costs the same though all the year (50$) excepting on Sunday when its price is doubled.

