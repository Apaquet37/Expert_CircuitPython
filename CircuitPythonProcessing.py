import board #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
import busio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)

dial = AnalogIn(board.A2)
#dial.direction = Direction.INPUT
#dial.pull = Pull.UP 

while True:
    time.sleep(.25)
    uart.write(bytes([dial.value]))