class KnightPosition
  attr_reader :x, :y, :size

  def initialize(size: 1, x: 0, y: 0)
    @size = size
    @x = x
    @y = y
  end

  def next_positions
    pos1 = KnightPosition.new(size: @size, x: @x + 2, y: @y + 1)
    pos2 = KnightPosition.new(size: @size, x: @x + 1, y: @y + 2)
    pos3 = KnightPosition.new(size: @size, x: @x - 1, y: @y + 2)
    pos4 = KnightPosition.new(size: @size, x: @x - 2, y: @y + 1)
    pos5 = KnightPosition.new(size: @size, x: @x - 2, y: @y - 1)
    pos6 = KnightPosition.new(size: @size, x: @x - 1, y: @y - 2)
    pos7 = KnightPosition.new(size: @size, x: @x + 1, y: @y - 2)
    pos8 = KnightPosition.new(size: @size, x: @x + 2, y: @y - 1)

    [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8].select { |pos| !pos.fall_out? }
  end

  def equal?(other)
    @x == other.x && @y == other.y
  end

  def fall_out?
    @x.negative? || @x >= @size || @y.negative? || @y >= @size
  end

  def included_in?(list_of_positions)
    list_of_positions.any? { |position| equal? position }
  end

  def to_a
    [@x, @y]
  end

  def to_h
    { x: @x, y: @y }
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  alias inspect to_s
end
