require 'byebug'

class CanvasApp
# I M N - Create a new M x N canvas with all pixels coloured white (O).
# C - Clears the canvas, setting all pixels to white (O).
  def create(row = 6, col = 5)
    row = 6
    @col = 5

    @size = row*@col
    
    numbers = (1..@size).map {|i| i
    }
    #convert to numbers
    @grid = numbers.each_slice(@col).to_a
    
    # Convert to white
    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a # OR grid = Array.new(6) { Array.new(5, ' ') }
  end

# C - Clears the canvas, setting all pixels to white (O).
  def clear
    numbers = (1..@size).map {|i| i
    }
    #convert to numbers
    @grid = numbers.each_slice(@col).to_a
    
    # Convert to white
    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a
  end

  # W F
  # Method 1, grab a snapshot of current canvas data, reset it, then add the saved data onto the new canvas.
  # Method 2, add literal extra spaces to the existing canvas.
  # limitations are that you won't be able to scale by halves or .5.
  def scale(percentage = 0 )

    new_size = @size*percentage/100

    numbers = (1..new_size).map {|i| i
    }

    @grid = numbers.each_slice(@col).to_a

    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a # OR grid = Array.new(6) { Array.new(5, ' ') }

  end

  # S
  def show
    @grid
  end
# L X Y C

  def colour_pixel(row, col, colour)
    new_value = colour
    @grid[row][col] = new_value
  end

# F X Y C
  def fill(row,col)
    move_right(row,col)
    move_left(row,col-1)
  end

  def move_left(row, col)
    while col >= 0
      fill_up(row, col, @grid) unless col < 0
      fill_down(row, col, @grid) unless col < 0
      row = row
      col = col-1
      pos_value = @grid[row][col]
      # p "row_index: #{row}, col_index: #{col}"
      # p "position_value: #{pos_value}"
      if pos_value != "O"
       break
      end
    end
  end
  
  def fill_up(row, col, grid = '@grid')
    grid = grid
    new_value = "N"
    @grid[row][col] = new_value
    while row > 0
      row = row-1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value == "O"
         @grid[row][col] = new_value
      elsif pos_value != "O"
        break
        # or break
      else
      end
    end
  end

  # V X Y1 Y2 C
  # need to adjust fill_up to only fill between Y1 to Y2 going vertically along X.
  def vert_draw(row1, row2, col, colour = '', grid = '@grid')
    grid = grid
    new_value = "N"
    @grid[row1][col] = new_value
    #draw_down
    if row1 <= row2
      while row1 >= 0 && row1 < @grid.length-1
        row1 = row1+1
        col = col
        pos_value = @grid[row1][col]
        p "row_index: #{row1}, col_index: #{col}"
        p "position_value: #{pos_value}"
        if row1 == row2
          @grid[row1][col] = new_value
          break
        elsif pos_value != "O"
          break
        elsif row1 >= @grid.length-1
          @grid[row1][col] = new_value
          break
        elsif pos_value == "O"
            @grid[row1][col] = new_value
        else
        end
      end
    
    # draw_up
    elsif row1 >= row2
      # if row2 < row1, fill_up to row2
      while row1 > 0
        row1 = row1-1
        col = col
        pos_value = @grid[row1][col]
        p "row_index: #{row1}, col_index: #{col}"
        p "position_value: #{pos_value}"
        if row1 == row2
          @grid[row1][col] = new_value
          break
        elsif pos_value == "O"
           @grid[row1][col] = new_value
        elsif pos_value != "O"
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
    new_value = "N"
    @grid[row][col1] = new_value
    # draw left
    if col1 >= col2
      while col1 >= 0
        row = row
        col1 = col1-1
        pos_value = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col}"
        # p "position_value: #{pos_value}"
        if col1 == col2
          @grid[row][col1] = new_value
          break
        elsif pos_value == "O"
           @grid[row][col1] = new_value
        elsif pos_value != "O"
          break
        else
        end
      end
    # draw right
    elsif col1 <= col2
      while col1 >= 0
        row = row
        col1 = col1+1
        pos_value = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col1}"
        # p "position_value: #{pos_value}"
        if col1 == col2
          @grid[row][col1] = new_value
          break
        elsif pos_value == "O"
          @grid[row][col1] = new_value
        elsif pos_value != "O"
          break
        else
        end
      end
    else
    end
  end
  

  
  def fill_down(row, col, grid = '@grid')
    grid = grid
    new_value = "N"
    @grid[row][col] = new_value
    while row >= 0 && row < @grid.length-1
      row = row+1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
      elsif row >= @grid.length-1
        @grid[row][col] = new_value
        break
      elsif pos_value == "O"
          @grid[row][col] = new_value
      else
      end
    end
  end

  def move_right(row, col) 
    while col >= 0
      fill_up(row, col, @grid) unless col < 0
      fill_down(row, col, @grid) unless col < 0
      row = row
      col = col+1
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
       break
      end
    end
  end
  
  def move_up(row, col)
    while row >= 0
      row = row-1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
       end
    end
  end
  
  def move_down(row, col)
    while row >= 0
      row = row+1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
      elsif row >= @grid.length-1
        break
      else
      end
    end
  end

  # ?
  # Add program help here
  def help
    'Hello this is where all the help WILL be : )'
  end

  # X 
  def exit
    begin
      exit
    rescue SystemExit
      p 123
    end
  end

end