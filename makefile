CC65 = ../bin/cc65
CA65 = ../bin/ca65
LD65 = ../bin/ld65
NAME = lesson4


All: $(NAME).nes $(NAME)b.nes
# if linux uncomment the next line
#	rm *.o
# windows	
	del *.o	

$(NAME).nes: $(NAME).o reset.o nes.cfg
	$(LD65) -C nes.cfg -o $(NAME).nes reset.o $(NAME).o nes.lib
	@echo $(NAME).nes created

#
$(NAME)b.nes: $(NAME)b.o reset.o nes.cfg
	$(LD65) -C nes.cfg -o $(NAME)b.nes reset.o $(NAME)b.o nes.lib
	@echo $(NAME)b.nes created

reset.o: reset.s
	$(CA65) reset.s

$(NAME).o: $(NAME).s
	$(CA65) $(NAME).s

$(NAME).s: $(NAME).c
	$(CC65) -Oi $(NAME).c --add-source

#
$(NAME)b.o: $(NAME)b.s
	$(CA65) $(NAME)b.s

$(NAME)b.s: $(NAME)b.c
	$(CC65) -Oi $(NAME)b.c --add-source

clean:
# if linux uncomment the next line
#	rm *.nes
# windows
	del *.nes

