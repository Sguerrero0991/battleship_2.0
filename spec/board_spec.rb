require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'
require 'rspec'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it ' generates cells' do
    board = Board.new
    board.cells
    
    expect(board.cells).to be_a(Hash)

    expect(board.cells.size).to eq(16)


  end
end