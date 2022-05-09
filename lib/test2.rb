
# I M N - Create a new M x N canvas with all pixels coloured white (O).
# C - Clears the canvas, setting all pixels to white (O).
  def reset(y = 6, x = 5)
    x = 5
    y = 6
    
    size = x*y
    
    numbers = (1..size).map {|i| i
    }
    #convert to numbers
    @grid = numbers.each_slice(x).to_a
    
    # Convert to white
    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(x).to_a # OR grid = Array.new(6) { Array.new(5, ' ') }
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
  
  # V X Y1 Y2 C 
  # need to adjust fill_up to only fill between Y1 to Y2 going vertically along X.
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
        next
        # or break
      else
      end
    end
  end
  
  # HX1 X2 YC
  # need to adjust to only fill X1 to X2 going horizontally along Y.
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