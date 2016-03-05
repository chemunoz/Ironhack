#solucion CarDealer con inventory modelado como un Array

class CarDealer
  def initialize(inventory)
    @inventory = inventory
  end
​
  def cars(brand)
    @inventory.select { |car| car[:brand].downcase == brand.downcase }
  end
​
  def pretty_print_inventory
    pretty_print_inventory = {}
    @inventory.each do |car|
      brand = car[:brand].downcase
      pretty_print_inventory[brand] ||= []
      pretty_print_inventory[brand] << car[:model].downcase.capitalize
    end
​
    pretty_print_inventory.each do |brand, models|
      puts "#{brand}: #{models.join(", ")}"
    end
  end
​
end
​
​
inventory = [
  { brand: "Ford",  model: "fiesta",  year: 2010,  license: "ASD123" },
  { brand: "Ford",  model: "mustang", year: 2011,  license: "OKD123" },
  { brand: "Tesla", model: "S",       year: 2014,  license: "FYS123" },
  { brand: "Mini",  model: "Cooper",  year: 2011,  license: "WQA123" },
]
​
car_dealer = CarDealer.new(inventory)
puts car_dealer.cars("Ford").inspect
puts car_dealer.pretty_print_inventory