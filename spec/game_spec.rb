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

end
