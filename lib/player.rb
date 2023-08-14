class Player
  attr_reader :symbol, :name

  def initialize(symbol, name, grid)
    @symbol = symbol
    @name = name
    @grid = grid
  end

  def take_a_box(box_number)
    @grid.take_a_box(box_number, symbol)
  end

  def win?
    @grid.horizontal_line?(symbol) || @grid.vertical_line?(symbol) || @grid.diagonal_line?(symbol)
  end

  def draw?
    @grid.draw?
  end
end