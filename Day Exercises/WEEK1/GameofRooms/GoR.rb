require 'pry'
load 'logo.rb'

class Map
  include Logo  

  def initialize(rooms_array)
    @current_room=0
    @rooms_array=rooms_array
    @actions=
    {
      room1: {look: "No ves nada", dance: "En serio? Aqui?"},
      room2: {look: "Ves el cielo", dance: "Creyéndote Toni Manero te arrancas a hacer tus movimientos"},
      room3: {look: "Ayyy lo que ves", dance: "Lo intentas, resbalas y te pegas un buen cacharrazo"},
      room4: {look: "Juas!", dance: "Oh yeah baby!"}
    }
    @current_action=""
  end

  def action(action)
    draw_room(@rooms_array[@current_room])
  end

  def move(coordinate)
    room2move=0
    @current_action=""
    result=@rooms_array[@current_room].available_directions.find {|room| room==coordinate.downcase}
    if result==nil
      system("clear")
      puts "DIRECCION NO PERMITIDA"
      draw_room(@rooms_array[@current_room])
    else
      puts "OK"
      case coordinate.downcase
      when "n"
        room2move=@rooms_array.find {|room| room.id==@rooms_array[@current_room].contiguous_rooms[:north]}
      when "s"
        room2move=@rooms_array.find {|room| room.id==@rooms_array[@current_room].contiguous_rooms[:south]}
      when "e"
        room2move=@rooms_array.find {|room| room.id==@rooms_array[@current_room].contiguous_rooms[:east]}
      when "w"
        room2move=@rooms_array.find {|room| room.id==@rooms_array[@current_room].contiguous_rooms[:west]}
      end
      @current_room=@rooms_array.index(room2move)
      draw_room(@rooms_array[@current_room])
    end
    
  end

  def draw_room(room)
    system("clear")
    load_logo
    puts "@@@@@@@@@@ CHEGAME MENU @@@@@@@@@@"
    puts "Navigation Menu (N=North, S=South, E=East, W=West)"
    puts "Ahora estás en: "+room.id.upcase
    puts "Description: " << room.description
    puts "--------------------------------"
    puts  @actions[@rooms_array[@current_room].id.intern][@current_action.intern].to_s
    puts "\nAvailable Directions: #{@rooms_array[@current_room].available_directions}"
    #binding.pry
    puts "Available Actions: #{@actions[@rooms_array[@current_room].id.intern].keys}"
    print "> "
    answer=gets.chomp
    
    if answer.downcase==="look" || answer.downcase==="dance"   ##PUENTEADO PORQUE SOLO TENGO UNA ACCION, CORREGIR
      @current_action=answer.downcase
      draw_room(@rooms_array[@current_room])
    elsif answer.downcase==="exit"
      exit
    else
      move(answer)
    end
  end

  

  def menu
      draw_room(@rooms_array[@current_room])
  end
end


class Room
  attr_reader :id, :available_directions, :contiguous_rooms, :description
  def initialize(id, available_directions, contiguous_rooms, description)
    @id=id
    @available_directions=available_directions  #return array
    @contiguous_rooms=contiguous_rooms          #return hash
    @description=description                    #return string
  end
end


room1=Room.new("room1",["s","e"], {north: nil, east:"room2", south:"room3", west: nil},"Estás en la sede de Ironhack")
room2=Room.new("room2",["s","w"], {north: nil, east:nil, south:"room4", west: "room1"},"Estás en Goiko Grill y estás dispuesto a comerte una megaironburguesa. Cuando hayas terminado, sal a dar un paseo.")
room3=Room.new("room3",["n","e"], {north: "room1", east:"room4", south:nil, west: nil},"Estás en medio de HackShow, PANIC TIME!!")
room4=Room.new("room4",["n","w"], {north: "room2", east:nil, south:nil, west: "room3"},"Estás en el los Hiring Days, ANIMO!")
rooms_array=[room1, room2, room3, room4]
inicio=Map.new(rooms_array)

system("clear")
inicio.menu


