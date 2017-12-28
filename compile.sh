#!/bin/bash

cc65 -Oi lesson4.c --add-source
ca65 reset.s
ca65 lesson4.s

ld65 -C nes.cfg -o lesson4.nes reset.o lesson4.o nes.lib