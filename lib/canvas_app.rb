# frozen_string_literal: true

require 'byebug'
require_relative 'help'
require_relative 'paint'
require 'simplecov'

class CanvasApp
  attr_reader :row, :col, :grid, :size

  def initialize(paint = Paint.new, help = Help.new, row: 0, col: 0, size: 0, grid: [])
    @row = row
    @col = col
    @size = size
    @grid = grid
    @paint = paint
    @help = help
  end

  def start
    loop do
      menu
      break if @input == 'exit'
    end
  end

  def menu
    @help.print_menu
    @input = gets.chomp
    if @input == 'exit'
      nil
    elsif @input != 'exit'
      @help.print_menu
    end
  end

  def create(row = 250, col = 250)
    @row = row
    @col = col
    @size = (row * col)
    to_numbers_array
    to_white_array
    to_grid
  end

  def fill(row, col, colour)
    grid = @grid
    @paint.pour(grid, row, col, colour)
  end

  def clear
    to_numbers_array
    to_grid
    to_white_array
    to_grid
  end

  def scale(percentage = 0)
    new_size = @size * percentage / 100
    @size = new_size
    to_numbers_array
    to_white_array
    to_grid
  end

  def show
    show_grid
  end

  def colour_pixel(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
  end

  def vert_paint(row1, row2, col, colour)
    @grid[row1][col] = colour
    grid = @grid
    @paint.begin_paint_v(grid, row1, row2, col, colour)
  end

  def horiz_paint(col1, col2, row, colour)
    @grid[row][col1] = colour
    grid = @grid
    @paint.begin_paint_h(grid, col1, col2, row, colour)
  end

  def instructions
    @help.text
  end

  def X
    exit
  end

  private

  def to_numbers_array
    @to_numbers_array = (1..@size).map { |i| i }
  end

  def to_white_array
    @white = @to_numbers_array.map { |_i| i = 'O' }
  end

  def to_grid
    @grid = to_white_array.each_slice(col).to_a
  end

  def show_grid
    @grid.each do |r|
      puts r.each { |p| p }.join(' ')
    end
  end

  def set_size=(size)
    @size = size
  end

  def move_up(row, col)
    while row.positive?
      @row = row - 1
      col = col
      current_canvas_colour = @grid[row][col]
      break if current_canvas_colour != WHITE
    end
  end

  def move_down(row, col)
    while row >= 0
      row += 1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length - 1
        break
      end
    end
  end
end
