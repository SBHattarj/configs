import uinput
import time
import sys
print(sys.argv)
with uinput.Device([uinput.REL_X, uinput.REL_Y, uinput.BTN_LEFT, uinput.BTN_RIGHT]) as device:
    time.sleep(0.05)
    device.emit(uinput.REL_Y, -20)
