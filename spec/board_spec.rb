require("rspec")
require('board')

describe(Board) do
  describe('#initialize') do
    it("creates 9 spaces when it is initialized") do
      board = Board.new()
      expect(board.spaces.length()).to(eq(9))
    end
  end
end
