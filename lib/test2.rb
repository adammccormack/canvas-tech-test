require 'byebug'

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

# to get move_left working in IRB, you need to run all teh above code first, to create a grid
# then you need to pass that grid into the instance variable grid method below
# then move_left can call @grid when calculating the values

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

#now I want it to move left and fill_up as it goes along

# fill_up(5,2,@grid)
# fill_up(5,1,@grid)
# fill_up(5,0,@grid)


def fill_up(row, col, grid = '@grid')
  grid = grid
  new_value = "N"
  @grid[row][col] = new_value
  while row >= 0
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


# fill_down = @grid[0][4] = 'X'
#             @grid[1][4] = 'X'
#             @grid[2][4] = 'X'

def fill_down(row, col, grid = '@grid')
  grid = grid
  new_value = "N"
  @grid[row][col] = new_value
  while row >= 0
    row = row+1
    col = col
    pos_value = @grid[row][col]
    p "row_index: #{row}, col_index: #{col}"
    p "position_value: #{pos_value}"
  if pos_value != "O"
    next
  elsif row >= @grid.length-1
    break
  elsif pos_value == "O"
      @grid[row][col] = new_value
  elsif row > @grid.length-1
    break
  else
    end
  end
end

if pos_value != "O"
  next
elsif row >= @grid.length-1
  break
else
end

def move_right(row, col) 
  while col >= 0
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
  
# how I could use recursion to solve the fill problem is when moving left and right and have it row+1 all the way as it moves left so that it converts every space that it can along the way, 
# then have another left and right that does row-1 all the way so that it covers every space until it has to stop. 



# new_grid = grid.transpose

# goal is to move left until [column] = [0] || the value of the position is not the target color
# then move to next array and repeat the fill


# @new_grid[3][3] = position_value 19
# @new_grid[2][3] = position_value 14
# @new_grid[1][3] = position_value 9
# @new_grid[0][3] = position_value 4

# starting_pos = grid[row][col]

# position_color = "O"

# move_left until grid[3][0] || position_color = false




# nice way to print the grid
# each do |r|
#   puts r.each { |p| p }.join(" ")
# end



# to be this
# I need to state the position[0][1] somewhere else

# then state which direction I'm moving in
# then move in that direction and change the counter on the position
# and feed that back into the movements

# result = grid.map {|i| 
#   if i == "O"
#     i = "J"
#   else
#     i
#  end      
# }
