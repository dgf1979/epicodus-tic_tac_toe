require('pry')

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

  define_method(:find) do |x, y|
    return @spaces[x + y*3]
  end

  define_method(:find_mark) do |x, y|
    if(@spaces[x + y*3].marked_by == nil)
      return ""
    else
      return @spaces[x + y*3].marked_by.mark
    end
  end

  define_method(:check_winner) do

    #check for horizontal victory
    xy = 0
    3.times() do
      if self.find_mark(0, xy) != "" && self.find_mark(0, xy) == self.find_mark(1, xy) && self.find_mark(1, xy) == self.find_mark(2, xy)
        return self.find_mark(0, xy)
      end

      #check for vertical victory

      if self.find_mark(xy, 0) != "" && self.find_mark(xy, 0) == self.find_mark(xy, 1) && self.find_mark(xy, 1) == self.find_mark(xy, 2)
        return self.find_mark(xy, 0)
      end
      xy += 1
    end

    #check for diagonal vitories
    if self.find_mark(1,1) != ""
      if self.find_mark(0, 0) == self.find_mark(1, 1) && self.find_mark(1, 1) == self.find_mark(2, 2)
        return self.find_mark(1, 1)
      elsif self.find_mark(2, 0) == self.find_mark(1, 1) && self.find_mark(1, 1) == self.find_mark(0, 2)
        self.find_mark(1, 1)
      end
    end

    return ""
  end

end
