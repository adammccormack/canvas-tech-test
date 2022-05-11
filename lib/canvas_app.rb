require 'byebug'

class CanvasApp

  attr_reader :row, :col, :size, :grid

  def initialize
    @row = 0
    @col = 0
    @size = 0
    @grid = []
  end


# I M N - Create a new M x N canvas with all pixels coloured white (O).
  # convert @size to array
  # convert numbers_array to white i.e. 'O'
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

  # W F
  def scale(percentage = 0)
    new_size = @size*percentage/100
    @numbers_array = (1..new_size).map {|i| i}
    white_array
    convert_to_grid
  end

  # S
  # presents grid without arrays showing
  def show
    present_grid
  end


# L X Y C
  def colour_pixel(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
  end

# F X Y C
  def fill(row, col, colour)
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

# V X Y1 Y2 C
  def vert_draw(row1, row2, col, colour = 'X')
    new_colour = colour
    @grid[row1][col] = new_colour
    #draw_down
    if row1 <= row2
      while row1 >= 0 && row1 < @grid.length-1
        row1 = row1+1
        current_canvas_colour = @grid[row1][col]
        if row1 == row2
          @grid[row1][col] = new_colour
          break
        elsif current_canvas_colour != "O"
          break
        elsif row1 >= @grid.length-1
          @grid[row1][col] = new_colour
          break
        elsif current_canvas_colour == "O"
            @grid[row1][col] = new_colour
        else
        end
      end
    
    # draw_up
    elsif row1 >= row2
      # if row2 < row1, fill_up to row2
      while row1 > 0
        row1 = row1-1
        current_canvas_colour = @grid[row1][col]

        if row1 == row2
          @grid[row1][col] = new_colour
          break
        elsif current_canvas_colour == "O"
           @grid[row1][col] = new_colour
        elsif current_canvas_colour != "O"
          next
          # or break
        else
        end
      end
    else
    end
  end

  # H X1 X2 Y C
  # Horizontal draw
  def horiz_draw(col1, col2, row, colour = '', grid = '@grid')
    grid = grid
    new_colour = "X"
    @grid[row][col1] = new_colour
    # draw left
    if col1 >= col2
      while col1 >= 0
        col1 = col1-1
        current_canvas_colour = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col}"
        # p "position_value: #{current_canvas_colour}"
        if col1 == col2
          @grid[row][col1] = new_colour
          break
        elsif current_canvas_colour == "O"
           @grid[row][col1] = new_colour
        elsif current_canvas_colour != "O"
          break
        else
        end
      end
    # draw right
    elsif col1 <= col2
      while col1 >= 0
        col1 = col1+1
        current_canvas_colour = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col1}"
        # p "position_value: #{current_canvas_colour}"
        if col1 == col2
          @grid[row][col1] = new_colour
          break
        elsif current_canvas_colour == "O"
          @grid[row][col1] = new_colour
        elsif current_canvas_colour != "O"
          break
        else
        end
      end
    else
    end
  end
  
  
  

  # ?
  # Add program help here
  def help
    'Hello this is where all the help WILL be : )'
    
    'I M N - Create a New Blank Canvas'
    'Action_name: create(row,col)'
    'Description: Use this action to create a new canvas with the desired size
     given in height(row) and width(col), after this hit enter to create.'
    
    'C - Clear the Current Canvas'
    'Action_name: clear'
    'Description: Clears all the canvas : )'
    
    'W F - Scale the Canvas'
    'Action_name: scale'
    'Description: Scales the canvas up or down depending on percentage input.'
  
    'S - Show the Canvas'
    'Action_name: show'
    'Description: Shows the canvas and its current state.'
    
    'L X Y C - Colour a Pixel'  
    'Action_name: colour_pixel(row, col, colour)'
    'Description: This action colours a specific area on the canvas, determined by
     the given height(row), width(col) and colour(colour), after this hit enter 
     to paint the pixel.'
    
    'F X Y C - Paint Fill'
    'Action_name: fill(row,col,colour)'
    'Description: This action fills an area/shape that is enclosed by a  
     one colour. 
     To use, enter the desired position to start filling given by height(row), 
     width(col) and colour(colour), after this hit enter to fill.'
    
    'V X Y1 Y2 C - Paint a Vertical Line'
    'Action_name: vert_draw(row1, row2, color, colour)'
    'Description: Paints a line between two given vertical points on, given by 
     height(row1) & (row2), and the horizontal location given by (col) and colour
     given by (colour), after entering the desired points and color, hit enter to
     paint the line.'

    'H X1 X2 Y C - Paint a Horizontal Line
     Action_name: horiz_draw(col1, col2, row, colour)
     Description: Paints a line between two given horizontal points on, given by 
     width(col1) & (col2), and the vertical location given by (row) and colour
     given by (colour), after entering the desired points and color, hit enter to
     paint the line.'
    
    'X - Exit Program'
    'Action_name: X)'
    'Description: exits the program : )'

    '? - Help'
    'Action_name: help)'
    'Description: We\'re here : )'
  end

  # X 
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

  def move_left_fill(row, col, colour)
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      row = row
      col = col-1
      current_canvas_colour = @grid[row][col]
      # p "row_index: #{row}, col_index: #{col}"
      # p "position_value: #{current_canvas_colour}"
      if current_canvas_colour != "O"
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
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{current_canvas_colour}"
      if current_canvas_colour != "O"
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
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{current_canvas_colour}"
      if current_canvas_colour == "O"
         @grid[row][col] = new_colour
      elsif current_canvas_colour != "O"
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
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{current_canvas_colour}"
      if current_canvas_colour != "O"
        break
      elsif row >= @grid.length-1
        @grid[row][col] = new_colour
        break
      elsif current_canvas_colour == "O"
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
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{current_canvas_colour}"
      if current_canvas_colour != "O"
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
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{current_canvas_colour}"
      if current_canvas_colour != "O"
        break
      elsif row >= @grid.length-1
        break
      else
      end
    end
  end
end