#solucion CarDealer con inventory modelado como un Hash

class CarDealer
  def initialize(inventory)
    @inventory = inventory
  end
​
  def cars(brand)
    @inventory[brand.downcase.to_sym]
  end
​
  def pretty_print_inventory
     @inventory.each do |brand, models|
      puts "#{brand}: #{models.join(", ")}"
    end
​
  end
​
end
​
​
inventory = {
  ford: [
    { model: "fiesta",  year: 2010,  license: "ASD123" },
    { model: "mustang", year: 2011,  license: "OKD123" },
    { model: "fiesta",  year: 2012,  license: "HYD123" },
  ],
  tesla: [
    { model: "S",       year: 2014,  license: "FYS123" }
  ],
  mini: [
    { model: "Cooper",  year: 2011,  license: "WQA123" }
  ]
}
​
​
​
car_dealer = CarDealer.new(inventory)
puts car_dealer.cars("Ford").inspect
puts "-------------"
puts car_dealer.pretty_print_inventory