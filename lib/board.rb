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
    else
      return false 
    end
  end

  
end