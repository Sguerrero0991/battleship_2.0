require_relative './lib/cell'
require_relative './lib/ship'
require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/turn'

loop do
  game = Game.new
  game.setup 

  turn = Turn.new(game)
  turn.start

  puts "\nWould you like to play again? (Y/N)"
  input = gets.chomp.upcase
  break unless input == "Y"
end
