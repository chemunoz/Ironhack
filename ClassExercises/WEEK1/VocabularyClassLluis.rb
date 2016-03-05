#Aquí va la clase de ejemplo, con todo lo que he podido meter de Programación Orientada a Objetos.


# this is the class dog
class Dog
  attr_accessor :name # you can buy a dog in the Pet shop, and if you don't like the name, you can change it. So, you can read and write this property. attr_accessor
  attr_reader :speed # you can tell to your dog to walk or to run, but you can't choose the speed of the dog. So, you can just read this property. attr_reader

  @@seller = "Tienda de Animales Ironhack" # all the dogs are sold by the same Pet Shop. This is a class attribute (or variable)

  # This method will be called when you instantiate the class Dog. name and chip_number are the parameters of the method
  def initialize name, chip_number
    @number_of_legs = 4 # you can't choose how many legs has a dog. This is an instance attribute (or variable), and you cannot modify it.
    @number_of_eyes = 2 # you can't choose how many eyes has a dog. This is an instance attribute (or variable), and you cannot modify it.
    @name = name # you can change your dog name all the times you want (poor dog!). This is an instance attribute (or variable), and it can be accessed from other methods of the class. Because of the attr_accessor, it can be accessed from outside the class.
    @chip_number = chip_number # you need the chip number to track the dog if it's lost. This is an instance attribute (or variable), and it can be accessed from other methods of the class.
    @speed = 0 # you need to access the dog speed to see how faster is he/she going. This is an instance attribute (or variable)
  end

  # This is an instance method. It can be invoked just from an instance of the object
  def walk
    @speed = 2
  end

  # This is an instance method. It can be invoked just from an instance of the object
  def run
    @speed = 5
  end

  # This is an instance method. It can be invoked just from an instance of the object
  def bark
    puts "woof woof!"
  end

  # This is an object method. It can be invoked without having an instance of the object
  def self.be_tracked_by_chip chip_number
    FBIDatabase.search_by_chip(chip_number)
  end
end

scooby_doo = Dog.new("Scooby", "GH05TS") # scooby_doo is an instance of the class Dog
santas_little_helper = Dog.new("Santa's Little Helper", "EL84RT0") # santas_little_helper is another instance of the class Dog

if(ghost?)
  scooby_doo.run # we can call this method through the instance, because it's an instance method
end

if(bart_is_attacked?)
  santas_little_helper.bark # we can call this method through the instance, because it's an instance method
  santas_little_helper.run # we can call this method through the instance, because it's an instance method
end

lost_dog_on_christmas = Dog.be_tracked_by_chip("EL84RT0") # we can call this method because it's a class method
lost_dog_on_christmas == santas_little_helper # true
