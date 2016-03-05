require 'pry'


class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end




class Operations
  def initialize(homes)
    @homes=homes
    @title=""
  end
  
  def menu
    puts "\nMENU"
    puts "1. Sort PRICE DOWN"
    puts "2. Sort PRICE UP"
    puts "3. Sort CAPACITY DOWN"
    puts "4. Sort CAPACITY UP"
    puts "5. FILTER by CITY"
    puts "6. Price Average"
    puts "7. FILTER by PRICE"
    puts "\n(Press 1-7 to choice an option)"
    answer=gets.chomp
    if answer.downcase!="exit"
      order(@homes, answer)
    end
  end

  def order(array, type)
    ordered_array=[]

    case type
    when "1"
      @title="sort by price down"
      ordered_array=array.sort_by{ |hm| hm.price}
    when "2"
      @title="sort by price up"
      ordered_array=array.sort_by{ |hm| hm.price}.reverse
    when "3"
      @title="sort by capacity down"
      ordered_array=array.sort_by{ |hm| hm.capacity}
    when "4"
      @title="sort by capacity up"
      ordered_array=array.sort_by{ |hm| hm.capacity}.reverse
    when "5"
      print "Please input a city: "
      city_selected = gets.chomp
      @title="filtered by #{city_selected}"
      ordered_array=array.select{ |hm| hm.city.downcase==city_selected.downcase}
    when "6"
      price_array=[]
      average=0
      @title="price average"
      price_array=array.reduce(0){|sum, homy| sum+homy.price}
      average=price_array.to_f/array.length.to_f
    when "7"
      print "Please input a price: "
      price_selected = gets.chomp
      @title="filtered by price"
      home_price_selected=array.find{|homy| homy.price==price_selected.to_i}
    end

    if type.to_i<6
      print_homes(ordered_array)
    elsif type.to_i==6
      system("clear")
      puts "$$$$$$$$$$$$$$$$ TEXTBNB $$$$$$$$$$$$$$$$"
      puts @title.upcase + "\n\n"
      print "Flats average: "
      puts average.to_s
      menu
    elsif type.to_i==7
      system("clear")
      puts "$$$$$$$$$$$$$$$$ TEXTBNB $$$$$$$$$$$$$$$$"
      puts @title.upcase + "\n\n"
      if home_price_selected!=nil
        puts "Flats with price #{price_selected}: #{home_price_selected.name} - #{home_price_selected.price}€ (#{home_price_selected.city})"
      else
        puts "There no results for #{price_selected}"
      end
      menu
    end
  end

  def print_homes(array)
      system("clear")
      puts "$$$$$$$$$$$$$$$$ TEXTBNB $$$$$$$$$$$$$$$$"
      puts @title.upcase + "\n\n"
      array.each do |hm|
        puts hm.name
        puts "Price: $#{hm.price} per night - Capacity: #{hm.capacity} - City: #{hm.city}\n\n"
      end
      menu
  end
end


#cities = []
#prices = []
homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Adrian's place", "San Adrian", 4, 49),
  Home.new("Lucas's place", "San Lucas", 3, 39),
  Home.new("Manuel's place", "San Manuel", 2, 99),
  Home.new("Eli's place", "Santa Eli", 1, 89),
  Home.new("Ruben's place", "San Ruben", 5, 59),
  Home.new("Juan's place", "San Juan", 8, 69)
]

operation=Operations.new(homes)

operation.menu











#ARRAY with EACH
# homes.each do |hm|
#   cities.push(hm.city)
# end
# puts cities

#ARRAY with MAP
# cities = homes.map do |hm|
#   hm.city
# end
# puts cities

#ARRAY of Prices
# prices = homes.map do |hm|
#   hm.price
# end
# puts prices
# puts "-----------"
# puts (prices.inject(:+).to_f/prices.length.to_f)

