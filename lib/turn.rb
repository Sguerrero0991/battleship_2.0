require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/turn'
require 'pry'

class Turn

  def initialize(game)
    @game = game

    @player_ships = 2
    @computer_ships = 2

  end


 

  def start
    # binding.pry
    loop do
      print "============== COMPUTER BOARD ============\n"
      puts @game.computer_board.render(false)
      print "=============== PLAYER BOARD =============\n"
      puts @game.player_board.render(true)

      # 0
      player_shots
      break if game_over?
    end

  end

  def boards
    #4

  end

  def player_shots
    puts "Enter coordinate for your shot\n"
    @coordinate = gets.chomp.upcase
    until @game.computer_board.valid_coordinate?(@coordinate) && !@game.computer_board.cells[@coordinate].fired_upon
      puts "Please enter a valid coordinate"
      @coordinate = gets.chomp.upcase
    end
    # binding.pry
    @game.computer_board.cells[@coordinate].fire_upon
    @player_shot = @game.computer_board.cells[@coordinate].render

    #puts @game.computer_board.render(false)

    computer_shots
      
      


  end

  def computer_shots
    keys = @game.computer_board.cells.keys
    fired = false
    until fired
      @coordinates = keys.sample
      if !@game.player_board.cells[@coordinates].fired_upon?
        @game.player_board.cells[@coordinates].fire_upon
        fired = true
      end

    end
      # @game.player_board.cells[@coordinates].fired_upon?
      @computer_shot = @game.player_board.cells[@coordinates].render

      results

  end

  def results

    case @player_shot
    when "M"
      print "Your shot on #{@coordinate} missed.\n"
    when "H"
      print "Your shot on #{@coordinate} hit.\n"
    when "X"
      print "Your shot on #{@coordinate} sunk a ship\n"  
      @computer_ships -= 1
    end

    case @computer_shot
    when "M"
      print "My shot on #{@coordinates} missed.\n"
    when "H"
      print "My shot on #{@coordinates} hit.\n"
    when "X"
      print "My shot on #{@coordinates} sunk a ship\n"  
      @player_ships -= 1
    end
    #2
    

  end

  def game_over?

    if @player_ships == 0 && @computer_ships == 0
      print "Tie Game"
      true
    elsif @player_ships == 0
      print "Computer Wins"
      true
    elsif @computer_ships == 0
      print "Player Wins"
      true
    else
      false
      
    end
  end

  
end