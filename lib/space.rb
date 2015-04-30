class Space
  attr_reader(:x, :y, :marked_by)

  define_method(:initialize) do |attributes|
    @x = attributes.fetch(:x)
    @y = attributes.fetch(:y)
    @marked_by = nil
  end

  define_method(:mark_by) do |player|
    @marked_by = player
  end

end
