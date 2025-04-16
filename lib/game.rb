require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'
class Game 
  attr_reader :player_board, :computer_board
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    # binding.pry
  end

  def start 
    print "Welcome to BATTLESHIP \n"
    print "Enter p to play. Enter q to quit. \n"
    input = gets.chomp.downcase
    if input == "p"
      setup
    elsif input == "q"
      p "Goodbye!"
      return
    else 
      p "Invalid Entry!"
    end
  end

  def setup
    keys = computer_board.cells.keys
  
    submarine = Ship.new("Submarine", 2)
    placed = false
    until placed
      coordinates = [keys.sample, keys.sample]
      if computer_board.valid_placement?(submarine, coordinates)
        computer_board.place(submarine, coordinates)
        placed = true
      end
    end
  
    cruiser = Ship.new("Cruiser", 3)
    placed = false
    until placed
      coordinates = [keys.sample, keys.sample, keys.sample]
      if computer_board.valid_placement?(cruiser, coordinates)
        computer_board.place(cruiser, coordinates)
        placed = true
      end
    end
    print "Let's play Battleship! \n"
    print "I have laid out my ships on the grid. \n" 
    print "You now need to lay out your two ships. \n" 
    print "The Cruiser is three units long and the Submarine is two \n" 
    print "units long. \n" 
    puts computer_board.render(false)
    print "Enter the squares for the Cruiser (3 spaces):\n"
    
    cruiser_2 = Ship.new("Cruiser", 3)
    placed = false
    until placed
        print "Enter coordinate: "
        coordinates = gets.chomp.upcase.split
      if player_board.valid_placement?(cruiser_2, coordinates)
        player_board.place(cruiser_2, coordinates)
        placed = true
      else
        print "not a valid placment enter new squares for the Cruiser (3 spaces):\n"
      end
    end
    puts computer_board.render(true)
    puts player_board.render(true)
    print "Enter the squares for the Submarine (2 spaces):\n"
  

    submarine_2 = Ship.new("Submarine", 2)
    placed = false
    until placed
        print "Enter coordinate: "
        coordinates = gets.chomp.upcase.split
      if player_board.valid_placement?(submarine, coordinates)
        player_board.place(submarine, coordinates)
        placed = true
      else
        print "not a valid placment enter new squares for the Submarine (3 spaces):\n"
      end
    end
    puts computer_board.render(true)
    puts player_board.render(true) 
    
  end
end

 
