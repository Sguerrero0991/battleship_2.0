require './lib/ship'
require 'rspec'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_a(Ship)
  end

  xit 'has attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)

  end

  xit 'can sink' do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)

  end

  xit 'can hit the ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end


end