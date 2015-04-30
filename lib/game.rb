class Game
  attr_reader(:player1, :player2, :board)

  define_method(:initialize) do
    @player1 = Player.new({:mark => "X"})
    @player2 = Player.new({:mark => "O"})
    @board = Board.new()
  end



end
