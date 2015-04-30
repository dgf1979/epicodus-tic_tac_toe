require("rspec")
require('board')

describe(Board) do

  describe('#initialize') do
    it("creates 9 spaces when it is initialized") do
      board = Board.new()
      expect(board.spaces.length()).to(eq(9))
    end
  end

  describe('#find') do
    it('returns the space at the given coordinates') do
      board = Board.new()
      expect(board.find(1, 2).x).to(eq(1))
      expect(board.find(1, 2).y).to(eq(2))
    end
  end

  describe('#check_winner') do

    it('returns winning mark for horizontal victory') do
      board = Board.new()
      player1 = Player.new({:mark => "X"})
      board.find(0, 2).mark_by(player1)
      board.find(1, 2).mark_by(player1)
      board.find(2, 2).mark_by(player1)
      expect(board.check_winner()).to(eq("X"))
    end

    it('returns winning mark for vertical victory') do
      board = Board.new()
      player1 = Player.new({:mark => "O"})
      board.find(0, 0).mark_by(player1)
      board.find(0, 1).mark_by(player1)
      board.find(0, 2).mark_by(player1)
      expect(board.check_winner()).to(eq("O"))
    end

    it('returns winning mark for diagonal victory') do
      board = Board.new()
      player1 = Player.new({:mark => "O"})
      board.find(0, 0).mark_by(player1)
      board.find(1, 1).mark_by(player1)
      board.find(2, 2).mark_by(player1)
      expect(board.check_winner()).to(eq("O"))
    end

    it('returns empty string for NO victory') do
      board = Board.new()
      player1 = Player.new({:mark => "O"})
      player2 = Player.new({:mark => "X"})
      board.find(0, 0).mark_by(player1)
      board.find(1, 1).mark_by(player2)
      board.find(2, 2).mark_by(player1)
      expect(board.check_winner()).to(eq(""))
    end

  end

end
