import processing.serial.*;
Serial myPort;

int x = 0;
int y = 0;
String message = "";

void setup() {
  size(300, 430); //The window size is a rectangle this time
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
  text("Servo 1:", 50, 350); //Text at the bottom of the window
  text("Servo 2:", 50, 400); //More text at the bottom of the window
  x = (mouseX*180)/300; //Scaling how the mouse values read
  y = (mouseY*180)/300; //Scaling how the mouse values read
  text(x, 180, 350) ;//Putting the x-value of my mouse at the bottom of the screen
  text(y, 180, 400); //Putting the y-value of my mouse at the bottom of the screen
  makeString(); //My function that makes the string that then gets sent over UART
}

void makeString(){ 
  if (x<=180 && y <=180){
    message = x+"$"+y+"%";
    println(message);
    myPort.write(message);
    delay(100);
  }
}
