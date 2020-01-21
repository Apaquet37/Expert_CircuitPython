import board #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
import busio #pylint: disable-msg=import-error
from adafruit_motor import servo #pylint: disable-msg=import-error
import pulseio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600 #setting up the uart communication

pwm1 = pulseio.PWMOut(board.A2, duty_cycle=2**15, frequency = 50) #The servos are pwm objects
pwm2 = pulseio.PWMOut(board.A3, duty_cycle=2**15, frequency = 50)
servo1 = servo.Servo(pwm1) #naming my servos and saying that they're servos
servo2 = servo.Servo(pwm2)
servoString = ""    #String setup
sSboolean = False #My string boolean that starts at false
print("go") #An indicator for whether or not the loop starts
while True:
    time.sleep(.01) #Sleep to make sure the times line up
    x = uart.read(1) #Reading the data from processing one byte at a time
    #print(x)
    if x is not None: #If you recieve a byte
        try:
            myData = x.decode("utf-9") #decode it
            if(myData == "$"): #If it hits one of the separator symbols then
                S = False #Change S to false
                A = False #Change A to False
            elif(myData == "%"): #If it hits the other separator symbols then
                S = False #Change S to false
                A = True #Change A to true
            else : #If it's not one of the symbols
                servoString = servoString + myData #Add the character to the string
                print(servoString) #Print the string to serial monitor
                sSboolean = True #The boolean chages to true
            if S == False and sSboolean == True and A == False: #If one of the symbols has been encountered, data has been
                                                                #added, and it's data for the first servo
                servo1.angle = int(servoString) #Move the servo to the desired position
                servoString = " " #reset the string
                S = True #Put S back at true
                sSboolean = False #Change the string/data added boolean back to false

            if S == False and sSboolean == True and A == True: #If one of the symbols has been encountered, data has been
                                                               #added, and it's data for the second servo
                servo2.angle = int(servoString) #Movng the second servo to the right spot
                servoString = " " #Clearing the data string
                S = True #Put S back to true
                sSboolean = False #Changing the boolean that shows whether or not data has been added back to false
            
        except: #Having a try, except helps make sure that the code never stops even if it doesn't get data
            print("unicode error") #Lets me know when the code encounters an error with receiving data
