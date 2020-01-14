float x = 150; //Starting my circle in the center
float y = 150;
float xspeed = 2; //The speed I want it to move side to side
float yspeed = 2.5; //The speed I want it to move up and down, these two speeds need to be different so that
                    //the circle doesn't just bounce back and forth in a line.
int xdirection = 1; //Starting direction
int ydirection = 1;

void setup(){
  size(300, 300); //Changing the size of the window
}

void draw(){
  background(160); //Making my background gray
  noStroke(); //No stroke
  x = x + ( xspeed * xdirection ); //changing the location of the circle based on a bunch of variables
  y = y + ( yspeed * ydirection );
  if (x > width-30 || x < 30) { //If the circle touches the edge of the window, change direction
    xdirection *= -1;
  }
  if (y > height-30 || y < 30) { //If the circle touches the edge of the window, change direction
    ydirection *= -1;
  }
  fill(255, 200, 200); //Setting the circle color
  ellipse(x, y, 30, 30); //Setting the circle's size and location
  println("Hello world."); //Printing Hello World so that this is a proper intro to processing
}
