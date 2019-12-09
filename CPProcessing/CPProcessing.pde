import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);
float x = 75;
float y = 200;

void setup() {
  //println("Available serial ports:");
  //println(Serial.list());
  size(300, 300);
}

void draw() {
  if (myPort.available() > 0) {
    background(162);
    int myNum = myPort.read();
    println(myNum);
    x = -150*cos(.017*myNum)+150;
    y = -150*sin(.017*myNum)+300;
    ellipse(150, 300, 300, 300);
    //text("0", 0, 300);
    //text("45", 75, 225);
    //text("90", 150, 150);
    //text("180", 300, 300);
    line(150, 300, x, y);
  }
}
