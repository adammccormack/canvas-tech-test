def reset
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
        next
        # or break
      else
      end
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