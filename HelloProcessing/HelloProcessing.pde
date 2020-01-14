float x = 150;
float y = 150;
float xspeed = 2;
float yspeed = 2.5;
int xdirection = 1;
int ydirection = 1;

void setup(){
  size(300, 300);
}

void draw(){
  background(160);
  noStroke();
    x = x + ( xspeed * xdirection );
  y = y + ( yspeed * ydirection );
   if (x > width-30 || x < 30) {
    xdirection *= -1;
  }
  if (y > height-30 || y < 30) {
    ydirection *= -1;
  }
  fill(255, 200, 200);
  ellipse(x, y, 30, 30);
  println("Hello world.");
}
