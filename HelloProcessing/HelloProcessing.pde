int x = 150;
int y = 150;

void setup(){
  size(300, 300);
}

void draw(){
  background(160);
  noStroke();
  fill(255, 200, 200);
  ellipse(x, y, 30, 30);
  println("Hello world.");
}
