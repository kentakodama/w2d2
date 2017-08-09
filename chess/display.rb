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

        (0..7).each do |x|
          if x == @cursor.cursor_pos[1]  #this line sets the cursor
            print @board[[y, x]].to_s.colorize(:color => @board[[y, x]].color, :background => :blue)
          else #this prints all other objects by calling the to_s method IN THE ROW with the cursor
            print @board[[y, x]].to_s.colorize(:color => @board[[y, x]].color)
          end
        end
        puts '' #create a line break so rows are separate
      else
        (0..7).each do |x|
          print @board[[y, x]].to_s.colorize(:color => @board[[y, x]].color)
        end #this prints all pieces in non-cursor rows by calling the to_s method
        puts ''
      end
    end
  end

  def run
    while true
      system 'clear' # auto clears terminal 
      render
      @cursor.get_input #keeps checking for cursor arrow input
    end
  end

end
