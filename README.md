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


## Creating a Canvas ##

<img width="424" alt="Screenshot 2022-05-14 at 11 54 06" src="https://user-images.githubusercontent.com/79875785/168424010-51484dbc-83d8-4293-8407-ae95dad10d1b.png">

## Showing the Canvas ##

<img width="242" alt="showing-the-canvas" src="https://user-images.githubusercontent.com/79875785/168424463-fd453dfa-6e3b-485c-b097-5a300f5c8c22.png">

## Drawing a Shape ##
<img width="237" alt="drawing-shape" src="https://user-images.githubusercontent.com/79875785/168424479-e0348d99-ce54-49fc-947a-9bf4aff34efa.png">


## Filling the Canvas ##
<img width="305" alt="filling-canvas" src="https://user-images.githubusercontent.com/79875785/168424483-0b2c365f-0f07-4588-bb05-013bb03f0df6.png">


## Clearing the Canvas ##
<img width="441" alt="clearing-canvas" src="https://user-images.githubusercontent.com/79875785/168424489-0324d7fc-7382-4401-9b49-080769723d52.png">


## Scaling the Canvas ##
<img width="442" alt="scaling-canvas" src="https://user-images.githubusercontent.com/79875785/168424494-e89f4a25-b991-4abb-8ef1-56f8ec793181.png">

