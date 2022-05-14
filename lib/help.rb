
class Help

  def print_menu
    
    puts <<~TEXT


    ### Canvas App ###
                                 ///.                                       
                           ***////             ****,***                 
                          ,****///       ,,*.            ,,,*           
                          ****///     *,                      ,,        
                          **////    **                          **      
                          *///    ,,                              **    
                          ///    *,                                **   
                         ///     ,                                  ,   
                        *//     ,*                                  ,.  
                       *//      ,*   %##((((((((((((((((((((((***   *.  
                     .*///      ,* (%#########################****. *.  
          ,**///*****/////      ,* ((((((((((((((((((((.......   .. *.  
         ,,,,,,,,,///////////   ,//((((((((((((((((((((.         ..//.  
        ,****,,**,,,,,,,,,///////  ((((((((((((((((((((..        ..
        &&%,,,,,*****,***,,,,,,,,, ((((((((((((((((((#(....      ..     
       %&%%%&&&&&&&,,,,,****,,**,  (((((((((((((((((##(......    ..     
      .@@@&&&%&%%%&&&@&&&&%,,,,,   ((((##(((((((((((..*......... ..     
      &%&&@@@@@@&&&%%%%%&&@@@@&    #((#,,#(((((((((#...............     
     @&&&%%%&&&@@@@@@@&&&%%%&&.    ,#*,,,,(((((#(((................     
    @@@@@@@&&%%%%%&&@@@@@@@&&%     ,,,,,,,((((#,#(#................     
   (#%&%&&#((((((((%%%%&&&&@@      ,,,,,,,(#(#,,,#,,...............     
  .*,,,,,,,,(((((((,(&&&&%%%       ,,,,,,,,,,,,,,,,,,,,,...........     
  ((((((((((((((((((((((((@        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,....     
      *(((((((######((((((.    ####,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,     
              ############       #((**,,,,**,,,,,,,,,,,,,,,*****,*,     
                     ,###   ###((((((((((((((((((((((((((((             
                              *####%#/,.                                
                                                                        
                                                                        
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@          
    

     To exit this menu type 'exit', then hit enter.

     Hello and welcome to Canvas App! To start simulating a canvas in your very own terminal, after familiarising yourself with the
     please exit this menu with the above 'exit' command, and type any of the instructions from below.
     
     To come back to this menu, simply type 'canvas.start' from your IRB terminal : ).

     canvas (or whichever name you decided for this session) followed by a full stop '.', e.g. 'canvas.' then type in the 
     anyone of the commands beloow which are word commands (e.g. canvas.create(5,5) listed after each number, with a 
     little description on the right.
     
     If you would like a little more detail on the instructions, please follow step 1. to see more instructions!

     1. instructions - a more detailed instruction manual for this app : )

     2. create(row, col) - creates a canvas given number of rows/cols

     3. clear - clears the canvas

     4. scale(percentage) - changes the scale of the canvas given a percentage number

     5. show - displays the current canvas state

     6. colour_pixel(row, col, colour) - lets you colour a pixel given a row/column number and colour

     7. fill(row, col, colour) - fills the whole canvas or a shape with given roow/column number and colour

     8. vert_paint(row1, row2, col, colour) - paint a vertical line between two given row points, a column and a colour

     9. horiz_paint(col1, col2, row, colour) - paint a horizontal line between two given row points, a column and a colour
     
     10. X - Exit the program
    TEXT
  end

  def text
      
  puts <<~TEXT
    Hello! Please read the instructions below on how to use CanvasApp below : )

    
    I M N - Create a New Blank Canvas
    Action_name: create(row,col)
    Description: Use this action to create a new canvas with the desired size
    given in height(row) and width(col), after this hit enter to create.
    
    C - Clear the Current Canvas
    Action_name: clear
    Description: Clears all the canvas back to colour white.
    
    W F - Scale the Canvas
    Action_name: scale(percentage)
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
    Action_name: fill(row, col, colour)
    Description: This action fills an area/shape that is enclosed by a  
    one colour. 
    To use, enter the desired position to start filling given by height(row), 
    width(col) and colour(colour), after this hit enter to fill.
    
    V X Y1 Y2 C - Paint a Vertical Line
    Action_name: vert_paint(row1, row2, col, colour)
    Description: Paints a line between two given vertical points on, given by 
    height(row1) & (row2), and the horizontal location given by (col) and colour
    given by (colour), after entering the desired points and color, hit enter to
    paint the line.

    H X1 X2 Y C - Paint a Horizontal Line
    Action_name: horiz_paint(col1, col2, row, colour)
    Description: Paints a line between two given horizontal points on, given by 
    width(col1) & (col2), and the vertical location given by (row) and colour
    given by (colour), after entering the desired points and color, hit enter to
    paint the line.
    
    X - Exit Program
    Action_name: X
    Description: exits the program

    '? - Help'
    Action_name: instructions
    Description: We are right where we need to be ; )
    TEXT
    
  end

end