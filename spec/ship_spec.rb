require './lib/ship'
require 'rspec'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_a(Ship)
  end

  it 'has attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
  end

  it 'can sink' do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end

  it 'can hit the ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end
end