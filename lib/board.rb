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

  # def valid_placement?(ship, coordinates)
  #   if ship.length == coordinates.length
  #     length = true
  #     return true
  #   else false 
  #   end

  #   if coordinates.split()


  # end
  def valid_placement?(ship, coordinates)
    return false unless ship.length == coordinates.length
  
    rows = coordinates.map { |coord| coord[0] } # e.g., ["A", "A", "A"]
    cols = coordinates.map { |coord| coord[1..-1].to_i } # e.g., [1, 2, 3]
  
    if rows.uniq.length == 1
      # All in same row → check if columns are consecutive
      return cols.each_cons(2).all? { |a, b| b == a + 1 }
    elsif cols.uniq.length == 1
      # All in same column → check if rows are consecutive
      row_numbers = rows.map { |r| r.ord } # Convert letters to ASCII
      return row_numbers.each_cons(2).all? { |a, b| b == a + 1 }
    else
      # Diagonal or random
      return false
    end
  end

end