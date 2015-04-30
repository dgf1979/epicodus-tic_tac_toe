require('pry')

class Game
  @@game = nil
  attr_reader(:player1, :player2, :board, :player1_turn, :message)

  define_method(:initialize) do
    @player1 = Player.new({:mark => "X"})
    @player2 = Player.new({:mark => "O"})
    @board = Board.new()
    @message = "Welcome to Tic Tac Toe!"
    @player1_turn = true
  end

  define_method(:save) do
    @@game = self
  end

  define_singleton_method(:load) do
    @@game
  end

  define_method(:take_turn) do |x, y|
    if @board.find(x, y).marked_by == nil
      if(@player1_turn)
        @message = "O's Turn"
        @board.find(x, y).mark_by(@player1)
      else
        @message = "X's Turn"
        @board.find(x, y).mark_by(@player2)
      end

      @player1_turn = !@player1_turn

      if @board.check_winner != ""
        @message = "The winner is: #{@board.check_winner()}!" 
      end
    end
  end

end
