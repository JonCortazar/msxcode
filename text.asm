;
; playing with text in console
;

    .bios
    .page 2
    .rom
    .start INICIO
    dw 0,0,0,0,0,0
    
; main program
INICIO:

	di
	im 1
	ld sp,0F380h
	ei     
      
	nop
	nop
	nop

	call INITXT ;screen 0

	ld hl,TEXTO_MUESTRA
	call MUESTRATEXTO

	ret

MUESTRATEXTO:
	; en hl viene la direccion inicio texto

	ld a,[hl] ;cargo en A el byte en adress HL
	cp $ff ; COMPRUEBA
	jp z, FIN_MUESTRATEXTO

	; ok, escribo la letra
	call CHPUT ;escribe A en la consola

	ld b,50 ; pausa 50 refrescos
	call PAUSA

	inc hl
	jp MUESTRATEXTO

	FIN_MUESTRATEXTO:

	ld a,13
	call CHPUT ; imprimo un RETURN antes de salir

	ret

	; -------------------------------------

PAUSA:
	; en B viene el numero de veces

	ld a,0
	call GTTRIG
	cp -1
	ret z

	halt
	jp nz,PAUSA ; goto PAUSA
	ret

	; -------------------------------------

	TEXTO_MUESTRA:
	db "Wake up, Neo",13
	db "The Matrix has you",13
	db "Follow the white rabbit",13
	db "Knock Knock",$ff
