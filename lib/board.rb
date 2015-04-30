#require('space')

class Board

  attr_reader(:spaces)

  define_method(:initialize) do
      @spaces = []
      x = 0
      y = 0
      3.times() do
        3.times() do
          @spaces.push(Space.new({:x => x, :y => y}))
          x += 1
        end
        x = 0
        y += 1
      end
  end

end
