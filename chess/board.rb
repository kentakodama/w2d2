require_relative 'piece'
# require 'colorize'
# require_relative 'cursor'


class NoPiece < StandardError
end
class PlaceOccupied < StandardError
end


class Board

  def initialize(grid = Board.setup)
    @grid = grid
  end

  def self.setup  #make sure to initialize correctly like so !!
    grid = Array.new(8) { Array.new(8) { NullPiece.instance } }

    (0..7).each do |y|
      (0..7).each do |x| #this should populate with two side and null in middle
        if y.between?(0, 1)
          grid[y][x] = King.new(:white, :K, [y, x], self)
        elsif y.between?(6, 7)
          grid[y][x] = King.new(:black, :K, [y, x], self)
        end
      end
    end
    grid
  end

  def move_piece(start, finish) #this is unfinished 
    raise NoPiece if start.nil?
    raise PlaceOccupied unless finish.nil?

  end

  def valid_pos?(pos)
    pos.all? {|num| num.between?(0, 7)}
  end

  def [](pos)
    y, x = pos
    @grid[y][x]
  end

  def []=(pos, val)
    y, x = pos
    @grid[y][x] = val
  end

end
