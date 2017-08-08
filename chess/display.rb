require_relative 'board'
require_relative 'cursor'

require 'colorize'

print 'hello'.colorize(:blue)

class Display

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    (0..7).each do |y|
      if y == @cursor.cursor_pos[0]
        #print each element of the row individually
        (0..7).each do |x|
          # colorize the shit outa this
          if x == @cursor.cursor_pos[1]
            print ' '.colorize( :background => :blue)
          else
            print 'v'#@board.grid[y][x]
          end
        end
        puts ''
      else
        puts 'vvvvvvvv'# @board.grid[y]
      end
    end
    # puts ' ABCDEFGH'
  end

  def run
    while true
      system 'clear'
      render
      @cursor.get_input #keeps checking for cursor arrow input
    end
  end

end
