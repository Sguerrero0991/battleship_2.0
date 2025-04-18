require 'pry'

class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    @health -= 1 unless @health == 0
  end

  def sunk?
    if @health > 0
      false
    else
      true 
    end
  end

end