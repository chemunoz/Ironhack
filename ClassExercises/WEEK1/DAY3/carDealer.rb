class CardDealer
  def initialize
    @cars=[]
  end

  def add_car(coche)
    @cars.push(coche)
  end

  def cars(brand_out)
    result=[]
    result=@cars.select{|key| key.brand==brand_out}
    print_cars(result)
  end

  def print_cars(array)
    print "#{array[0].brand}: "
    array.each do | item |
      print "#{item.model} "
    end
    puts ""
  end
end



class Car
  attr_reader :brand, :model
  def initialize(brand, model)
    @brand=brand
    @model=model
  end
end 



#Creo los coches
car1=Car.new("Ford", "Fiesta")
car2=Car.new("Opel", "Corsa")
car3=Car.new("Ford", "Focus")

#cars_array=[car1,car2]

#Creo carDealer
car_dealer = CardDealer.new

#Añado los coches
car_dealer.add_car(car1)
car_dealer.add_car(car2)
car_dealer.add_car(car3)

#Muestro una marca
car_dealer.cars("Ford")




