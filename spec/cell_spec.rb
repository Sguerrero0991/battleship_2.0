require './lib/ship'
require './lib/cell'
require 'rspec'
require 'pry'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end

  it 'has attributes' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
  end

  it 'can check if a cell is empty' do
    cell = Cell.new("B4")
    
    expect(cell.empty?).to eq(true)
  end

  it 'can place a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
  end

  it 'can re-check if a cell is empty after a ship has been placed' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it 'can check if a cell has been fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)
  end

  it 'can fire upon a cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it 'can re-check if a cell has been fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to eq(true)
  end

  it 'can render a cell' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    expect(cell_1.render).to eq(".")

    cell_1.fire_upon
    expect(cell_1.render).to eq("M")

    cell_2.place_ship(cruiser)
    expect(cell_2.render).to eq(".")

    expect(cell_2.render(true)).to eq("S")

    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end
end 