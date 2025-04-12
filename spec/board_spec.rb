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

  it 'generates cells' do
    board = Board.new
    board.cells
    
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to eq(16)
  end

  it 'can check if a coordinate is valid or not' do
    board = Board.new
    board.cells
    
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end
end