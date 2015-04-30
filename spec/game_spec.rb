require('rspec')
require('game')

describe(Game) do

  describe("#initialize") do
    it('sets up a new game state') do
      new_game = Game.new()
      expect(new_game.player1.mark).to(eq("X"))
      expect(new_game.player2.mark).to(eq("O"))
      expect(new_game.board.class).to(eq(Board))
    end
  end

  describe("#take_turn") do
    it('takes a turn') do
      new_game = Game.new()
      new_game.take_turn(0, 2)
      new_game.take_turn(1, 0)
      new_game.take_turn(1, 1)
      new_game.take_turn(2, 2)
      new_game.take_turn(2, 0)
      expect(new_game.board.check_winner()).to(eq("X"))
    end
  end

  describe('#message') do
    it('returns a message about the game state') do
      new_game = Game.new()
      expect(new_game.message()).to(eq("Welcome to Tic Tac Toe!"))
      new_game.take_turn(0, 2)
      expect(new_game.message()).to(eq("O's Turn"))
      new_game.take_turn(1, 0)
      expect(new_game.message()).to(eq("X's Turn"))
      new_game.take_turn(1, 1)
      new_game.take_turn(2, 2)
      new_game.take_turn(2, 0)
      expect(new_game.message()).to(eq("The winner is: X!"))
    end

  end

  describe('#ai_turn') do
    it('makes a winning move given the opportunity (X wins)') do
      new_game = Game.new()
      new_game.take_turn(1, 1)
      new_game.take_turn(1, 0)
      new_game.take_turn(0, 1)
      new_game.take_turn(0, 0)
      new_game.take_turn(1, 2)
      new_game.ai_turn()
      expect(new_game.message()).to(eq("The winner is: O!"))
    end

    it('blocks a potential win by the other player') do
      new_game = Game.new()
      new_game.take_turn(1, 1)
      new_game.take_turn(2, 0)
      new_game.take_turn(2, 1)
      new_game.ai_turn()
      expect(new_game.board.find_mark(0, 1)).to(eq("O"))
    end
  end

end
