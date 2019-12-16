import board #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
import busio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)

dial = AnalogIn(board.A2)
#dial.direction = Direction.INPUT
#dial.pull = Pull.UP 

def get_voltage(pin):
    return(pin.value*180)/65536


while True:
    time.sleep(.1)
    myDial = get_voltage(dial)
    #newVal = map_range(myDial, 0, 65536, 0, 255)  ---I didn't have the library needed to map, and I decided it would be easier to
                                                      #scale the number using the math at the top
    #data = uart.read(32)  ---Took this line out because I never used data, and it was slowing down my code a  ton
    uart.write(bytes([int(myDial)]))
    print(myDial)