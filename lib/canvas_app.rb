require 'byebug'
require_relative 'help'
require 'simplecov'

class CanvasApp
  attr_reader :size
  WHITE = 'O'

  def initialize(help = Help.new, row: 0, col: 0, size: 0, grid: [])
    @row = row
    @col = col
    @size = size
    @grid = grid
    @help = help
  end
  # in IRB, use canvas.start to begin the app.
  def start
    loop do
      menu
      if @input == 'exit'
        break
      else
      end
    end
  end
  
  def menu
      @help.print_menu
      @input = (STDIN.gets.chomp)
      if @input == 'exit'
        return
      elsif @input != 'exit'
        @help.print_menu
      else
      end
  end
  
# I M N - Create a new M x N canvas with all pixels coloured white (O).
  def create(row = 250, col = 250)
    @row = row
    @col = col
    @size = row*col
    to_numbers_array
    to_white_array
    to_grid
  end

# C - Clears the canvas, setting all pixels to white (O).
  def clear
    to_numbers_array
    to_grid
    to_white_array
    to_grid
  end

  # W F - Scales the canvas with the given factor F(in percentage).
  def scale(percentage = 0)
    new_size = @size*percentage/100
    @size = new_size
    to_numbers_array
    to_white_array
    to_grid
  end

  # S - Show the contents of the current canvas.
  def show
    show_grid
  end


# L X Y C - Colours the pixel (X,Y) with colour C.
  def colour_pixel(row, col, colour = 'X')
    new_colour = colour
    @grid[row][col] = new_colour
  end

# F X Y C - Fill the region R with the colour C, start at given X,Y position.
  def fill(row, col, colour = 'X')
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

# V X Y1 Y2 C
# Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
  def vert_paint(row1, row2, col, colour = 'X')
    @v_row1 = row1
    @v_row2 = row2
    @v_col = col
    @new_colour = colour
    @grid[@v_row1][col] = @new_colour
    begin_paint_v
  end

  # H X1 X2 Y C
  # Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
  def horiz_paint(col1, col2, row, colour)
    @h_col1 = col1
    @h_col2 = col2
    @h_row = row
    @h_new_colour = colour
    @grid[row][@h_col1] = @h_new_colour
    begin_paint_h
  end

  # ?
  #Shows in program help
  def instructions
    @help.text
  end

  # X
  # Terminate the session
  def X
    exit
  end

  private

  attr_reader :row, :col, :grid

  def to_numbers_array
    @to_numbers_array = (1..@size).map {|i| i}
  end

  def to_white_array
    @white = @to_numbers_array.map {|i| i = 'O'}
  end

  def to_grid
    @grid = to_white_array.each_slice(col).to_a
  end

  def show_grid
    @grid.each { |r|
      puts r.each { |p| p }.join(" ")
     }
  end

  def current_canvas_colour
    @grid[row1][col]
  end

  def begin_paint_v
    if @v_row1 <= @v_row2
      paint_down
    elsif @v_row1 >= @v_row2
      paint_up
    else
    end
  end

  def begin_paint_h
    if @h_col1 >= @h_col2
      paint_left
    elsif @h_col1 <= @h_col2
      paint_right
    else
    end
  end

  def v_original_colour
    @grid[@v_row1][@v_col]
  end

  def paint_down
    while @v_row1 >= 0 && @v_row1 < @grid.length-1
      @v_row1 += 1
      if @v_row1 == @v_row2
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif v_original_colour != WHITE
        break
      elsif @v_row1 >= @grid.length-1
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif v_original_colour == WHITE
          @grid[@v_row1][@v_col] = @new_colour
      else
      end
    end
  end

  def paint_up
    while @v_row1 > 0
      @v_row1 -= 1
      if @v_row1 == @v_row2
        v_original_colour = @new_colour
        break
      elsif v_original_colour == WHITE
         v_original_colour = @new_colour
      elsif v_original_colour != WHITE
        next
      else
      end
    end
  end

  def h_original_colour
    @grid[row][col1]
  end

  def paint_left
    while col1 >= 0
      col1 -= 1
      if col1 == col2
        h_original_colour = @h_new_colour
        break
      elsif h_original_colour == WHITE
        h_original_colour = @h_new_colour
      elsif h_original_colour != WHITE
        break
      else
      end
    end
  end

  def paint_right
    while @h_col1 >= 0
      @h_col1 += 1
      current_canvas_colour = @grid[@h_row][@h_col1]
      if @h_col1 == @h_col2
        @grid[@h_row][@h_col1] = @h_new_colour
        break
      elsif current_canvas_colour == WHITE
        @grid[@h_row][@h_col1] = @h_new_colour
      elsif current_canvas_colour != WHITE
        break
      else
      end
    end
  end


  def move_left_fill(row, col, colour = 'X')
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      col -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
       break
      end
    end
  end

  def move_right_fill(row, col, colour) 
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      col += 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
       break
      end
    end
  end 

  def fill_up(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
    while row > 0
      row -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour == WHITE
         @grid[row][col] = new_colour
      elsif current_canvas_colour != WHITE
        break
      else
      end
    end
  end

  def fill_down(row, col, colour)
    new_colour = colour
    current_canvas_colour = new_colour
    while row >= 0 && row < @grid.length-1
      row = row+1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length-1
        @grid[row][col] = new_colour
        break
      elsif current_canvas_colour == WHITE
          @grid[row][col] = new_colour
      else
      end
    end
  end
  
  def move_up(row, col)
    while row > 0
      @row = row-1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      else
      end
    end
  end
  
  def move_down(row, col)
    while row >= 0
      row = row+1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length-1
        break
      else
      end
    end
  end
end