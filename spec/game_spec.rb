require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'
require 'rspec'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    
    expect(game).to be_a(Game)
  end 
end 