class Game
  def initialize
    @grid = Grid.new
    @player1 = Player.new('X', 'John', @grid)
    @player2 = Player.new('O', 'Mark', @grid)
  end

  def start
    loop do
      turn(@player1)
      break if game_over?

      turn(@player2)
      break if game_over?
    end
    puts @grid
  end

  def turn(player)
    puts "#{player.name} turn, chose a box number"
    puts @grid
    puts ''
    box = gets.chomp.to_i
    player.take_a_box(box)

    puts "#{player.name} Wins" if player.win?
    puts "It's a draw!\n" if player.draw? && !player.win?
  end

  def game_over?
    @player1.win? || @player2.win? || @player1.draw?
  end
end

class Grid
  def initialize
    @grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def to_s
    @grid.map { |line| line.join(' | ') }
         .join("\n---+---+---\n")
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
end

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

game = Game.new
game.start

__END__

