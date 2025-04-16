require_relative './lib/cell'
require_relative './lib/ship'
require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/turn'


game = Game.new
turn = Turn.new(game)

game.start
turn.start

