# frozen_string_literal: true

class Paint
  WHITE = 'O'

  def pour(grid, row, col, colour)
    @grid = grid
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

  def paint_vertically(grid, row1, row2, col, colour)
    begin_paint_v(grid, row1, row2, col, colour)
  end

  def paint_horizontally(grid, col1, col2, row, colour)
    begin_paint_h(grid, col1, col2, row, colour)
  end

  private
  
  
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
    @grid = grid
    if row1 <= row2
      paint_down(grid, row1, row2, col, colour)
    elsif row1 >= row2
      paint_up(grid, row1, row2, col, colour)
    end
  end

  def paint_down(grid, row1, row2, col, colour)
    
    while row1.positive? && row1 < @grid.length - 1
      row1 += 1
      current_canvas_colour = @grid[row1][col]
      if row1 == row2
        @grid[row1][col] = colour
        break
      elsif row1 >= @grid.length - 1
        @grid[row1][col] = colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row1][col] = colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end

  def paint_up(grid, row1, row2, col, colour)
    @grid[row1][col] = colour
    while row1.positive?
      row1 -= 1
      current_canvas_colour = @grid[row1][col]
      if row1 == row2
        @grid[row1][col] = colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row1][col] = colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end
  
  def begin_paint_h(grid, col1, col2, row, colour)
    if col1 >= col2
      paint_left(grid, col1, col2, row, colour)
    elsif col1 <= col2
      paint_right(grid, col1, col2, row, colour)
    end
  end

  def paint_left(grid, col1, col2, row, colour)
    @grid = grid
    while col1.positive?
      col1 -= 1
      current_canvas_colour = grid[row][col1]
      if col1 == col2
        @grid[row][col1] = colour
        break
      elsif current_canvas_colour == WHITE
        @grid[row][col1] = colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end

  def paint_right(grid, col1, col2, row, colour)
    @grid = grid
    while col1.positive?
      col1 += 1
      current_canvas_colour = grid[row][col1]
      if col1 == col2
        @grid[row][col1] = colour 
        break
      elsif current_canvas_colour == WHITE
        @grid[row][col1] = colour
      elsif current_canvas_colour != WHITE
        break
      end
    end
  end

end
