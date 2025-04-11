require './lib/ship'
require './lib/cell'
require 'rspec'

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
end 