class Player
  attr_reader(:mark)

  define_method(:initialize) do |attributes|
    @mark = attributes.fetch(:mark)
  end

end
