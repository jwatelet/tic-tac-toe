class Grid
  def initialize(**hash)
    @grid = initialize_grid(hash)
  end

  def to_s
    @grid.map { |line| line.join(' | ') }
         .join("\n--+---+---\n")
  end

  def take_a_box(box_number, symbol)
    @grid.each do |line|
      line[line.index(box_number)] = symbol if line.include?(box_number)
    end
  end

  def draw?
    @grid.flatten.all? { |box| box.is_a? String }
  end

  def horizontal_line?(symbol)
    @grid.any? do |line|
      line.all? { |box| box == symbol }
    end
  end

  def vertical_line?(symbol)
    @grid.transpose.any? do |line|
      line.all? { |box| box == symbol }
    end
  end

  def diagonal_line?(symbol)
    (@grid[0][0] == symbol && @grid[1][1] == symbol && @grid[2][2] == symbol) ||
      (@grid[0][2] == symbol && @grid[1][1] == symbol && @grid[2][0] == symbol)
  end

  private

  def initialize_grid(hash)
    if hash[:grid].nil?
      [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    else
      hash[:grid]
    end
  end
end