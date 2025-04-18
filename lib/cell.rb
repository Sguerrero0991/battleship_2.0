class Cell 
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false 
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship = ship
      @ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end 
  end

  def render(reveal = false)
    if !@fired_upon  
      return "S" if reveal && @ship
     "."
    elsif @ship == nil
     "M"
    elsif @ship.sunk? 
     "X"
    else 
      "H" 
    end 
  end
end