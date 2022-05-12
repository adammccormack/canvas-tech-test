require 'byebug'
require_relative 'help'

class CanvasApp
  WHITE = 'O'
  CANVAS_BORDER = 0

  attr_reader :row, :col, :size, :grid

  def initialize(help = Help.new)
    @row = 0
    @col = 0
    @size = 0
    @grid = []
    @help = help
  end

# I M N - Create a new M x N canvas with all pixels coloured white (O).
  def create(row = 6, col = 6)
    @row = row
    @col = col
    @size = row*col
    numbers_array
    white_array
    convert_to_grid
  end

# C - Clears the canvas, setting all pixels to white (O).
  def clear
    numbers_array
    convert_to_grid
    white_array
    convert_to_grid
  end

  # W F - Scales the canvas with the given factor F(in percentage).
  def scale(percentage = 0)
    new_size = @size*percentage/100
    @numbers_array = (1..new_size).map {|i| i}
    white_array
    convert_to_grid
  end

  # S - Show the contents of the current canvas.
  def show
    present_grid
  end


# L X Y C - Colours the pixel (X,Y) with colour C.
  def colour_pixel(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
  end

# F X Y C - Fill the region R with the colour C, start at given X,Y position.
  def fill(row, col, colour)
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

  
# V X Y1 Y2 C
# Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
  def vert_paint(row1, row2, col, colour)
    @v_row1 = row1
    @v_row2 = row2
    @v_col = col
    @new_colour = colour
    @grid[@v_row1][col] = @new_colour
    if @v_row1 <= @v_row2
      paint_down
    elsif @v_row1 >= @v_row2
      paint_up
    else
    end
  end

  

  # H X1 X2 Y C
  # Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
  def horiz_paint(col1, col2, row, colour)
    @h_col1 = col1
    @h_col2 = col2
    @h_row = row
    @h_new_colour = colour
    @grid[row][@h_col1] = @h_new_colour
    # paint left
    if @h_col1 >= @h_col2 
      paint_left
    # paint right
    elsif @h_col1 <= @h_col2
      paint_right
    else
    end
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

  def numbers_array
    @numbers_array = (1..@size).map {|i| i}
  end

  def white_array
    @white = @numbers_array.map {|i| i = 'O'}
  end

  def convert_to_grid
    @grid = white_array.each_slice(col).to_a
  end

  def present_grid
    @grid.each { |r|
      puts r.each { |p| p }.join(" ")
     }
  end

  def current_canvas_colour
    @grid[row1][col]
  end

  def paint_down
    while @v_row1 >= 0 && @v_row1 < @grid.length-1
      @v_row1 += 1
      original_colour = @grid[@v_row1][@v_col]
      if @v_row1 == @v_row2
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif original_colour != WHITE
        break
      elsif @v_row1 >= @grid.length-1
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif original_colour == WHITE
          @grid[@v_row1][@v_col] = @new_colour
      else
      end
    end
  end

  def paint_up
    while @v_row1 > 0
      @v_row1 -= 1
      original_colour = @grid[@v_row1][@v_col]
      if @v_row1 == @v_row2
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif original_colour == WHITE
         @grid[@v_row1][@v_col] = @new_colour
      elsif original_colour != WHITE
        next
        # or break
      else
      end
    end
  end

  def paint_left
    while col1 >= 0
      col1 -= 1
      current_canvas_colour = @grid[row][col1]
      if col1 == col2
        @grid[row][col1] = new_colour
        break
      elsif current_canvas_colour == WHITE
         @grid[row][col1] = new_colour
      elsif current_canvas_colour != WHITE
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

  def move_left_fill(row, col, colour)
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      row = row
      col = col-1
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
      row = row
      col = col+1
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
      row = row-1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour == WHITE
         @grid[row][col] = new_colour
      elsif current_canvas_colour != WHITE
        break
        # or break
      else
      end
    end
  end

  def fill_down(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
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