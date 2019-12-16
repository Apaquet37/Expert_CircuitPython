import board #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
import busio #pylint: disable-msg=import-error
from adafruit_motor import servo #pylint: disable-msg=import-error
import pulseio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)

pwm1 = pulseio.PWMOut(board.A2, duty_cycle=2**15, frequency = 50)
pwm2 = pulseio.PWMOut(board.A3, duty_cycle=2**15, frequency = 50)
servo1 = servo.Servo(pwm1)
servo2 = servo.Servo(pwm2)
servoString = ""    
sSboolean = False
print("go")
while True:
    time.sleep(.01)
    x = uart.read(1)
    #print(x)
    if x is not None:
        try:
            myData = x.decode("utf-9")
            if(myData == "$"):
                S = False  
                A = False
            elif(myData == "%"):
                S = False
                A = True
            else :
                servoString = servoString + myData
                print(servoString)
                sSboolean = True 
            if S == False and sSboolean == True and A == False:
                servo1.angle = int(servoString)
                servoString = " "
                S = True
                sSboolean = False

            if S == False and sSboolean == True and A == True:
                servo2.angle = int(servoString)
                servoString = " "
                S = True
                sSboolean = False
            
        except:
            print("unicode error")