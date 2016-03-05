class Car
  def initialize (engine)
    @engine_obj=engine
  end

  def car_sound
    puts @engine_obj.engine_sound + " " + "CAR-PURUMM"
  end
end


class Engine
  def initialize (type_soung)
    @sound=type_soung
  end

  def engine_sound
    @sound
  end
end


F1motor=Engine.new ("engine-BURUMM")
car1 = Car.new(F1motor)
car1.car_sound

TourismMotor=Engine.new("engine-cachapum")
car2 = Car.new(TourismMotor)
car2.car_sound