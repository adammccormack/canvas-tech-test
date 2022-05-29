# frozen_string_literal: true

class Paint
  WHITE = 'O'

  def pour(grid, row, col, colour)
    @grid = grid
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

  def current_canvas_colour
    @grid[row][col]
  end

  def move_left_fill(row, col, colour)
    while col >= 0
      fill_up(row, col, colour) unless col.negative?
      fill_down(row, col, colour) unless col.negative?
      col -= 1
      current_canvas_colour = @grid[row][col]
      break if current_canvas_colour != WHITE
    end
  end

  def move_right_fill(row, col, colour)
    while col >= 0
      fill_up(row, col, colour) unless col.negative?
      fill_down(row, col, colour) unless col.negative?
      col += 1
      current_canvas_colour = @grid[row][col]
      break if current_canvas_colour != WHITE
    end
  end

  def fill_up(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
    while row.positive?
      row -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour == WHITE
        @grid[row][col] = new_colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end

  def fill_down(row, col, colour)
    new_colour = colour
    current_canvas_colour = new_colour
    while row >= 0 && row < @grid.length - 1
      row += 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length - 1
        @grid[row][col] = new_colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row][col] = new_colour
      end
    end
  end

  def begin_paint_v(grid, row1, row2, col, colour)
    v_row1 = row1
    v_row2 = row2
    @grid = grid
    if v_row1 <= v_row2
      paint_down(row1, col, colour)
    elsif v_row1 >= v_row2
      paint_up(row1, col, colour)
    end
  end

  def paint_down(row1, col, colour)
    row = row1
    new_colour = colour
    current_canvas_colour = new_colour
    while row >= 0 && row < @grid.length - 1
      row += 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length - 1
        @grid[row][col] = new_colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row][col] = new_colour
      end
    end
  end

  def paint_up(row1, col, colour)
    row = row1
    new_colour = colour
    @grid[row][col] = new_colour
    while row.positive?
      row -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour == WHITE
        @grid[row][col] = new_colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end
  
  def begin_paint_h(grid, col1, col2, row, colour)
    @grid = grid
    if col1 >= col2
      paint_left
    elsif col1 <= col2
      paint_right(grid, col1, col2, row, colour)
    end
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
      end
    end
  end

  def paint_right(grid, col1, col2, row, colour)
    h_new_colour = colour
    @grid = grid
    while col1 >= 0
      col1 += 1
      current_canvas_colour = grid[row][col1]
      if col1 == col2
        @grid[row][col1] = h_new_colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row][col1] = h_new_colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end

end
