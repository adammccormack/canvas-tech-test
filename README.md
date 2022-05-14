# Canvas Simulator

A small app that simulates a canvas which can be painted on via the command line : )

## Installation and Setup 

Ruby version: 3.1.2


1. Clone the repo on Github at: https://github.com/alldigits/canvas, Github cloning instructions: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository.

2. Open your terminal and navigate to the folder where you cloned and downloaded canvas_app to.

3. Type 'bundle install' to install the dependencies including the test suite Rspec.

4. From the terminal enter the following:

- irb -r './lib/canvas_app'

5. Once irb is running type:

- canvas = CanvasApp.new

6. Then type:

- canvas.start

7. Then follow the instruction menu from there : )

If you need to exit the menu type 'exit' then enter


## User Stories


```
As a user,
So I can use a simulated canvas,
I want to be able to create a blank canvas from the terminal

As a user,
So I can start over,
I want to be able to clear the current canvas

As a user,
So I can paint a location on the canvas,
I want to be able to select a location and colour and paint it

As a user,
So I can paint a line,
I want to be able to select two points on the canvas and paint a line between them vertically

As a user,
So I can paint a line,
I want to be able to select two points on the canvas and paint a line between them horizontally

As a user,
So I can fill the canvas with one colour and also fill shapes
I want to be able to select a location and fill it

As a user,
So I can change the size of my canvas
I want to be able to scale it

As a user,
So I can see my canvas's state
I want to be able to show it

As a user,
So I exit the program
I want to be able to terminate the session

As a user,
So I can get further instructions on the app,
I want to be able to read instructions
```


# Creating a Canvas#

![Creating the Canvas](create-canvas.png)

