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

  define_method(:ai_turn) do

    insertIndex = -1

    compareX = ["", "X", "X"]
    compareO = ["", "O", "O"]

    possibles = []
    #horizontal
    possibles.push([0, 1, 2])
    possibles.push([3, 4, 5])
    possibles.push([6, 7, 8])
    #vertical
    possibles.push([0, 3, 6])
    possibles.push([1, 4, 7])
    possibles.push([2, 5, 8])
    #diagonal
    possibles.push([0, 4, 8])
    possibles.push([2, 4, 6])

    # rule 1 - if you can complete 3 in a row, do it

    possibles.each() do |possible|
      line = []
      possible.each() do |board_index|
        player = @board.spaces[board_index].marked_by
        if player == nil
          line.push("")
        else
          line.push(player.mark)
        end
      end
      if(line.sort() == compareO)
        x = possible[line.index("")]%3
        y = (possible[line.index("")]/3).floor()
        return take_turn(x, y)
      end
    end

    # rule 2 - if the opponent had 2 in a row, block it

    possibles.each() do |possible|
      line = []
      possible.each() do |board_index|
        player = @board.spaces[board_index].marked_by
        if player == nil
          line.push("")
        else
          line.push(player.mark)
        end
      end
      if(line.sort() == compareX)
        x = possible[line.index("")]%3
        y = (possible[line.index("")]/3).floor()
        return take_turn(x, y)
      end
    end

    # rule 3 - add a mark where you are not blocked from making 3

    @board.spaces.each_index() do |index|
      if(@board.spaces[index].marked_by == nil)
        x = index%3
        y = (index/3).floor()
        return take_turn(x, y)
      end
    end

    #take_turn(,)
  end

  define_method(:take_turn) do |x, y|
    if @board.find(x, y).marked_by == nil && @board.check_winner == ""
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
