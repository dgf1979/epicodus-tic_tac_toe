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

end
