import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600); //choosing the port for UART
float x = 75;
float y = 200; //x and y start in certain places

void setup() {
  //println("Available serial ports:");
  //println(Serial.list());
  size(300, 300); //Setting window size
}

void draw() {
  if (myPort.available() > 0) {
    background(162); //Making the background gray
    int myNum = myPort.read();
    println(myNum); //Printing the value
    x = -150*cos(.017*myNum)+150;
    y = -150*sin(.017*myNum)+300; //Math to make my line accurately depict the potentiometer values
    ellipse(150, 300, 300, 300); //making the body of the spedometer
    //text("0", 0, 300);
    //text("45", 75, 225);
    //text("90", 150, 150);
    //text("180", 300, 300);
    line(150, 300, x, y); //The line on the spedometer starts in the bottom middle and moves according to the potentiometer
  }
}
