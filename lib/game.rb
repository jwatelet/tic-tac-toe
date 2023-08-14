require_relative './grid'
require_relative './player'

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



game = Game.new
game.start

__END__

