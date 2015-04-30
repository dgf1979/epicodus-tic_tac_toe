require('pry')

class Game
  attr_reader(:player1, :player2, :board, :player1_turn)

  define_method(:initialize) do
    @player1 = Player.new({:mark => "X"})
    @player2 = Player.new({:mark => "O"})
    @board = Board.new()
    @player1_turn = true
  end

  define_method(:take_turn) do |x, y|

    if(@player1_turn)
      @board.find(x, y).mark_by(@player1)
    else
      @board.find(x, y).mark_by(@player2)
    end

    @player1_turn = !@player1_turn
    #binding.pry
  end

end
