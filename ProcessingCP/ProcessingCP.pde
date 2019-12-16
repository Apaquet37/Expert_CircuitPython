import processing.serial.*;
Serial myPort;

int x = 0;
int y = 0;
String message = "";

void setup() {
  size(300, 430);
  println("Available serial ports:");
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw() {
  background(190); //Setting my background color to a gray
  rect(0, 0, 300, 300); //drawing a white rectangle in the top part
  line(150, 0, 150, 300); //drawing a grid/cross
  line(0,150, 300, 150); //drawing a grid/cross
  ellipse(mouseX, mouseY, 5, 5); //making a small circle that follows the mouse
  textSize(30); //saying what size the text should be
  text("Servo 1:", 50, 350);
  text("Servo 2:", 50, 400);
  x = (mouseX*180)/300;
  y = (mouseY*180)/300;
  text(x, 180, 350);
  text(y, 180, 400);
  makeString();
}

void makeString(){
  if (x<=180 && y <=180){
    message = x+"$"+y+"%";
    println(message);
    myPort.write(message);
    delay(100);
  }
}
