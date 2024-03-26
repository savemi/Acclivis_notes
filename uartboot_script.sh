#!/usr/bin/kermit

set port /dev/ttyACM0
set speed 115200
set carrier-watch off
set flow-control none
set prefixing all

echo {loading uImage}
PAUSE 1

OUTPUT loadb ${loadaddr} 115200\{13}
send rootfs.uImage
INPUT 180 {\{13}\{10}=> }
IF FAIL STOP 1 INPUT timeout

echo {running kernel}
PAUSE 1
OUTPUT run addip; bootm\{13}
c
