require './lib/cell'
class Board
  attr_reader :height, :width
  def initialize
    @height = ["A", "B", "C", "D"]
    @width = ["1", "2", "3", "4"]
    @cells = {}
  end

  def cells
    if @cells.empty?
      @height.each do |row|
        @width.each do |col|
          coordinate = "#{row}#{col}"
          @cells[coordinate] = Cell.new(coordinate)
        end
      end
    end
    @cells
  end

  def valid_coordinate?(coordinate)
    if @cells.keys.include?(coordinate)
    return true
    else false 
    end
  end

  def valid_placement?(ship, coordinates)
    return false unless ship.length == coordinates.length
  
    rows = coordinates.map do |coord|
      coord[0]
    end
  
    cols = coordinates.map do |coord|
      coord[1..-1].to_i
    end
  
    if rows.uniq.length == 1
      return cols.each_cons(2).all? do |a, b|
        b == a + 1
      end
    elsif cols.uniq.length == 1
      row_nums = rows.map do |r|
        r.ord
      end
      return row_nums.each_cons(2).all? do |a, b|
        b == a + 1
      end
    else
      return false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      binding.pry
      if valid_coordinate?(coordinate) 
        coordinates.each do |coordinate|
          valid_placement?(ship, coordinates)
        end
      end
    end
    
  end
end