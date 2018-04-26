; Execute TM17 out of pocket with the following Quagsire and TM setup:

; Quagsire = C3
; Held item = Lucky Egg = $7E
; First move = Attract = $D5

; Pokemon2Species: ; $DA5A.
; 	jp, shinifier ; $D57E.

; TM01 x175	; AF
; TM02 x‭103‬	; 67
; TM03 x‭111‬	; 6F
; TM04 x‭54‬	; 36
; TM05 x10	; 0A
; TM06 x‭38‬	; 26
; TM07 x‭64‬	; 40
; TM08 x‭54‬	; 36
; TM09 x1	; 01
; TM10 x‭33‬	; 21
; TM11 x151	; 97
; TM12 x173	; AD
; TM13 x17	; 11
; TM14 x31	; 1F
; TM15 x0	; 00
; TM16 x6	; 06
; TM17 x20	; 14
; TM18 x54	; 36
; TM19 x250	; FA
; TM20 x35	; 23
; TM21 x54	; 36
; TM22 x170	; AA
; TM23 x25	; 19
; TM24 x5	; 05
; TM25 x32	; 20
; TM26 x247	; F7
; TM27 x95	; 5F
; TM28 x18	; 12
; TM29 x201	; C9
SECTION "Shinifier Payload", ROM0[$0000] ; Make all Pokémon in the box shiny.
shinifier: 	; First TM quantity. $D57E.
	xor a
	ld h, a
	ld l, a ; ld hl, $0000
	ld [hl], $0A	;Unlock SRAM. Standard is writing $0A to $0000.
	
	ld h, $40 ; ld hl, $4000
	ld [hl], $01	; Switch SRAM bank. Write desired bank to $4000.

	ld hl, $AD97	; Pointer for first IV of first boxed Pokémon.
	ld de, $001F	; Offset to increment to next Pokémon's data.
	ld b, $14		; Counter for how many Pokémon to change. Decimal 20.

.mainLoop
	ld [hl], $FA	; Write value to Attack/Defense IV. Male shiny value.
	inc hl
	ld [hl], $AA	; Write value to Speed/Special IV. Shiny value.
	
	add hl, de		; Increment the pointer to the next Pokémon.
	dec b			; If it's the last Pokémon,
	jr nz, .mainLoop; fall through.
	ld e, a ; ld hl, $0000
	ld [de], a		; Relock SRAM.
	ret