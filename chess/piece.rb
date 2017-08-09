

require 'singleton'

class Piece

  attr_accessor :color, :symbol, :position, :board

  def initialize(color, symbol, position, board)
    @color = color
    @symbol = symbol
    @position = position
    @board = board
  end

  def to_s
    @symbol.to_s
  end

end

# module SlidingPiece
#
#   def moves(direction)
#     if direction == :ortho
#
#     elsif direction == :diag
#
#
#     else
#
#
#   end
#
#
# end


module SteppingPiece

  #we need valid moves for (type, position )

  def moves(relative_pos)

    maybes = []
    relative_pos.each do |relative|
      maybes << [@position, relative].transpose.map { |x| x.reduce(:+) }
    end
    # knock out positions that arent possible
    in_bounds = maybes.select {|coor| @board.valid_pos?(coor)}
    #out of bounds, occupied by own color

    possible = in_bounds.reject {|coor| @board[coor].color == @color}
  end


end



class King < Piece

  include SteppingPiece

  def initialize(color, _symbol, position, board)
    @color = color
    @symbol = :K
    @positon = position
    @board = board
  end

  def moves
    # get array of relative positions
    relative_pos = [1, 0, -1].product([1, 0, -1])
    # get the grid coordinates of each relative position
    super(relative_pos)

  end


end


class Knight < Piece

  include SteppingPiece

  def initialize(color, _symbol, position, board)
    @color = color
    @symbol = :N
    @positon = position
    @board = board
  end

  def moves
    # get array of relative positions
    relative_pos = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    # get the grid coordinates of each relative position
    super(relative_pos)

  end


end



class NullPiece < Piece

  # attr_accessor wasn't inherited - needed to be added to access :color
  attr_accessor :color

  include Singleton

  def initialize
    @color = :orange
    @symbol = nil
  end

  def to_s
    ' '
  end

end
