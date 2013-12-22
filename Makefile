all: text.asm
	asmsx text.asm

clean:
	$(RM) text.rom
	$(RM) text.sym
	$(RM) ~tmppre.*


