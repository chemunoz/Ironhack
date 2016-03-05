require 'pry'
#binding.pry


class Board
  attr_reader :squares
  def initialize(file_board)
    @file_board=file_board
    @squares=Array.new(8) { Array.new(8) } #it's trully necesary to specify the dimensions?!?
  end

  def load
    file=File.open(@file_board,"r")
    @squares=file.readlines
    file.close
    @squares.map! {|item| item.split(" ")}
    @squares.reverse!
  end
end



class Movements
  def initialize(file_moves)
    @file_moves=file_moves
    @movements=[]
  end

  def load
    file=File.open(@file_moves,"r")
    @movements=file.readlines
    file.close
    @movements
  end
end



class ChessValidator  
  def initialize(board, movements)
    @board4check=board.load
    @movements2check=movements.load
    @alphabet= {"a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
  end

  def busy_square(coordinate)
    puts @board4check[coordinate[3]][coordinate[2]]!="--" ? " (Destination BUSY SQUARE)" : " (Destination EMPTY SQUARE!)"
  end

  def check_pieces_movements
    @movements2check.each do |movs|
        aux=convert_coordinates(movs)
        print "#{movs} - (#{aux[1]}, #{aux[0]}) => #{@board4check[aux[1]][aux[0]]}  |  (#{aux[3]}, #{aux[2]}) => #{@board4check[aux[3]][aux[2]]}  |  "
        case @board4check[aux[1]][aux[0]].to_s[1].upcase
          when "P"
            role=Pawn.new
            role.move(aux, @board4check[aux[1]][aux[0]].to_s[0])
          when "N"
            role=Knight.new
            role.move(aux)
          when "K"
            role=King.new
            role.move(aux)
          when "Q"
            role=Queen.new
            role.move(aux)
          when "B"
            role=Bishop.new
            role.move(aux)
          when "R"
            role=Rook.new
            role.move(aux)
          when "-"
            print "Error: ORIGIN EMPTY SQUARE" 
          else
            print "Unknow kind of piece"
        end     
        busy_square(aux)
    end
  end

  def convert_coordinates(string)
    string.gsub!(/\n/, '')
    string.gsub!(/\s+/, '')
    result=string.split(//)

    result.each_with_index do |item, index|
      is_number?(item)===false ? result[index] = @alphabet[item] : result[index] = item.to_i-1
    end
    result
  end

  def is_number?(string)
    true if Float(string) rescue false
  end

end





class Piece
  #Empty? WTF?!
end



class Rook < Piece
  def move(action)  
    if action[3]==action[1] || action[2]==action[0]
      print "ROOK == MOVEMENT OK"
      #busy_square(@coordinate2)
    else
      print "ROOK == FORBIDDEN MOVEMENT"
    end
  end
end

class Bishop < Piece
  def move(action)
    if (action[3]-action[1]).abs==(action[2]-action[0]).abs
      print "BISHOP == MOVEMENT OK"
      #busy_square(@coordinate2)
    else
      print "BISHOP == FORBIDDEN MOVEMENT"
    end
  end
end

class Queen < Piece
  def move(action)
    if ((action[3]-action[1]).abs==(action[2]-action[0]).abs) || (action[3]==action[1] || action[2]==action[0])
      print "QUEEN == MOVEMENT OK"
      #busy_square(@coordinate2)
    else
      print "QUEEN == FORBIDDEN MOVEMENT"
    end
  end
end

class Knight < Piece
  def move(action)
    if ((action[3]-action[1]).abs==2 && (action[2]-action[0]).abs==1) || ((action[3]-action[1]).abs==1 && (action[2]-action[0]).abs==2)
      print "KNIGHT == MOVEMENT OK"
      #busy_square(@coordinate2)
    else
      print "KNIGHT == FORBIDDEN MOVEMENT"
    end
  end
end

class King < Piece
  def move(action)
    if ((action[3]-action[1]).abs==1 && (action[2]-action[0]).abs==0) || ((action[2]-action[0]).abs==1 && (action[3]-action[1]).abs==0) || ((action[2]-action[0]).abs==0 && (action[3]-action[1]).abs==0) || ((action[2]-action[0]).abs==1 && (action[3]-action[1]).abs==1)
      print "KING == MOVEMENT OK"
      #busy_square(@coordinate2)
    else
      print "KING == FORBIDDEN MOVEMENT"
    end
  end
end

class Pawn < Piece
  def move(action, color)
    #Pending to validate if it's the openning move
    if (action[3]-action[1]).abs==1 && (action[2]-action[0])==0
      if color.downcase==="w" && (action[3]-action[1])>0
        print "whitePAWN == MOVEMENT OK"
      else
        if color.downcase==="b"
          if (action[3]-action[1])<0
            print "blackPAWN == MOVEMENT OK"
          else
            print "blackPAWN == FORBIDDEN MOVEMENT for BLACK"
          end
        else
          print "whitePAWN == FORBIDDEN MOVEMENT for WHITE"
        end
      end
      #busy_square([action[2],action[3]])
    else
      print "PAWN == FORBIDDEN MOVEMENT"
    end  
  end
end


def logo
  system("clear")
  puts "@@@@@@@@@@@@@@@@@@@@ CHEss MENU @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  puts '                                                       .::.'
  puts '                                            _()_       _::_'
  puts '                                  _O      _/____\_   _/____\_'
  puts '           _  _  _     ^^__      / //\    \      /   \      /'
  puts '          | || || |   /  - \_   {     }    \____/     \____/'
  puts '          |_______| <|    __<    \___/     (____)     (____)'
  puts '    _     \__ ___ / <|    \      (___)      |  |       |  |'
  puts '   (_)     |___|_|  <|     \      |_|       |__|       |__|'
  puts '  (___)    |_|___|  <|______\    /   \     /    \     /    \ '
  puts '  _|_|_    |___|_|   _|____|_   (_____)   (______)   (______)'
  puts ' (_____)  (_______) (________) (_______) (________) (________)'
  puts ' /_____\  /_______\ /________\ /_______\ /________\ /________\ '
  puts ""
end

def menu
  puts "1.- SIMPLE BOARD and SIMPLE MOVEMENTS"
  puts "2.- COMPLEX BOARD and COMPLEX MOVEMENTS"
  print "Please choose an option: "
  answer=gets.chomp
  puts ""
  if answer.downcase==="exit" 
    puts "> Sayonara"
  elsif answer==="1"
    #SIMPLE
    tablero=Board.new("simple_board.txt")
    movimientos=Movements.new("simple_moves.txt")
    deep_blue=ChessValidator.new(tablero, movimientos)
    deep_blue.check_pieces_movements
  elsif answer ==="2"
    #COMPLEX
    tablero=Board.new("complex_board.txt")
    movimientos=Movements.new("complex_moves.txt")
    deep_blue=ChessValidator.new(tablero, movimientos)
    deep_blue.check_pieces_movements
  else
    puts "WRONG OPTION"
  end

end





#King (rey), Queen (reina), Rook (torre), Bishop (alfil), Knight (caballo), Pawn (peon)


logo
menu

