
class Help

  def text
      
    <<~TEXT
    Hello, please read the instructions below on how to use CanvasApp below : )

    
    I M N - Create a New Blank Canvas
    Action_name: create(row,col)
    Description: Use this action to create a new canvas with the desired size
    given in height(row) and width(col), after this hit enter to create.
    
    C - Clear the Current Canvas
    Action_name: clear
    Description: Clears all the canvas : )
    
    W F - Scale the Canvas
    Action_name: scale
    Description: Scales the canvas up or down depending on percentage input.

    S - Show the Canvas
    Action_name: show
    Description: Shows the canvas in its current state.
  
    L X Y C - Colour a Pixel
    Action_name: colour_pixel(row, col, colour)
    Description: This action colours a specific area on the canvas, determined by
    the given height(row), width(col) and colour(colour), after this hit enter 
    to paint the pixel.
    
    F X Y C - Paint Fill
    Action_name: fill(row,col,colour)
    Description: This action fills an area/shape that is enclosed by a  
    one colour. 
    To use, enter the desired position to start filling given by height(row), 
    width(col) and colour(colour), after this hit enter to fill.
    
    V X Y1 Y2 C - Paint a Vertical Line
    Action_name: vert_paint(row1, row2, color, colour)
    Description: Paints a line between two given vertical points on, given by 
    height(row1) & (row2), and the horizontal location given by (col) and colour
    given by (colour), after entering the desired points and color, hit enter to
    paint the line.

    H X1 X2 Y C - Paint a Horizontal Line
    Action_name: horiz_draw(col1, col2, row, colour)
    Description: Paints a line between two given horizontal points on, given by 
    width(col1) & (col2), and the vertical location given by (row) and colour
    given by (colour), after entering the desired points and color, hit enter to
    paint the line.
    
    X - Exit Program
    Action_name: X
    Description: exits the program

    '? - Help'
    Action_name: help
    Description: We are right where we should be ; )
    TEXT
    
  end

end