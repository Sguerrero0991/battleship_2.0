require './lib/cell'
class Board
  attr_reader :height, :width, :cells
  def initialize
    @height = ["A", "B", "C", "D"]
    @width = ["1", "2", "3", "4"]
    @cells = generate_cells
  end

  def generate_cells
    @cells = {}
      @height.each do |row|
        @width.each do |col|
          coordinate = "#{row}#{col}"
          @cells[coordinate] = Cell.new(coordinate)
        end
      end
    @cells
  end

  def valid_coordinate?(coordinate)
    if @cells.keys.include?(coordinate)
    return true
    else 
      false 
    end
  end

  def valid_placement?(ship, coordinates)

    # checks if coordinates passed are all valid returns false if not
    return false unless coordinates.all? do |coord|
      valid_coordinate?(coord) 
    end

    # checks if coordinates passed collide with placed ships returns false if true
    return false if coordinates.any? do |coord| 
      cells[coord].ship 
    end
    
    # checks if coordinates passed are equal in number to length of ship
    return false unless ship.length == coordinates.length
    
    # sets "row" to new array for comparison
    rows = coordinates.map do |coord|
      coord[0]
    end
    
    # sets "col" to new array for comparison
    cols = coordinates.map do |coord|
      coord[1..-1].to_i
    end
    
    # checks all coords are in a line horizontally or vertically
    if rows.uniq.length == 1  # horizontal check
      return cols.each_cons(2).all? do |a, b| #collumns increasing consecutively
        b == a + 1
      end
    elsif cols.uniq.length == 1  # vertical check
      row_nums = rows.map do |r|
        r.ord
      end
      return row_nums.each_cons(2).all? do |a, b| #rows increasing consenutively
        b == a + 1
      end
    else
      return false
    end
  end

  def place(ship, coordinates)
    return unless valid_placement?(ship, coordinates)

    coordinates.each do |coordinate|
      cells[coordinate].place_ship(ship)
    end
  end

  def render(reveal_ships = false)
    output = "  " + @width.join(" ") + " \n"
    @height.each do |row|
      output += row + " "
      @width.each do |col|
        coordinate = row + col
        output += cells[coordinate].render(reveal_ships) + " "
      end
      output += "\n"
    end
  output
  end
end
