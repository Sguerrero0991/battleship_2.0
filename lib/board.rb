class Board
  attr_reader :cells, :height, :width

  def initialize
    @cells = {}
    @height = ["A", "B", "C", "D"]
    @width = ["1", "2", "3", "4"]

  end

  def cells
    
    @width.each do |width|
      
      @height.each do |index|
        coordinate = "#{index}#{width}"
        @cells[coordinate] = Cell.new(coordinate)
        
      end
    end

  end
end