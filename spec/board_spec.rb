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

  it 'can check if number of coordinates are the same as length of ship' do
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)   

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'check if coordinates are consecutive' do
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)   

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'checks that coordinates are not diagnol' do
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)   

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it 're-checks if placements are valid' do
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)   

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'can place a ship in a cell' do
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["A4", "A5"])

    cell_1 = board.cells["A1"]    
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_4 = board.cells["A4"]
    cell_5 = board.cells["A5"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)

    expect(cell_4.ship).to eq(nil)
  end

  it "checks that ships don't overlap" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)  

    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end
end

