; Execute TM17 out of pocket with the following Quagsire and TM setup:

; Quagsire = C3
; Held item = Lucky Egg = $7E
; First move = Attract = $D5

; Pokemon2Species: ; $DA5A.
; 	jp, perfectifier ; $D57E.

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
; TM11 x‭141‬	; 8D
; TM12 x‭173‬	; AD
; TM13 x22	; 16
; TM14 x0	; 00
; TM15 x6	; 06
; TM16 x20	; 14
; TM17 x61	; 3D
; TM18 x14	; 0E
; TM19 x10	; 0A
; TM20 x34	; 22
; TM21 x13	; 0D
; TM22 x32	; 20
; TM23 x‭252‬	; FC
; TM24 x‭54‬	; 36
; TM25 x250	; FA
; TM26 x35	; 23
; TM27 x‭54‬	; 36
; TM28 x170	; AA
; TM29 x30	; 1E
; TM30 x5	; 05
; TM31 x25	; 19
; TM32 x34	; 22
; TM33 x‭54‬	; 36
; TM34 x21	; 15
; TM35 x30	; 1E
; TM36 x15	; 0F
; TM37 x25	; 19
; TM38 x5	; 05
; TM39 x32	; 20
; TM40 x233	; E9
; TM41 x175	; AF
; TM42 x95	; 5F
; TM43 x18	; 12
; TM44 x201	; C9
SECTION "Perfectifier Payload", ROM0[$0000]	; Make all the Pokémon in the box perfect.
perfectifier: 	; First TM quantity. At $D57E.
	xor a
	ld h, a
	ld l, a ; ld hl, $0000
	ld [hl], $0A	;Unlock SRAM. Standard is writing $0A to $0000.
	
	ld h, $40 ; ld hl, $4000
	ld [hl], $01	; Switch SRAM bank. Write desired bank to $4000.
	

	ld hl, $AD8D	; Pointer for first EV of first boxed Pokémon.
	ld d, $00		; Zero out d, so we can use de as an offset later.
	ld b, $14		; Counter for how many Pokémon to change. Decimal 20.
	dec a ; ld a, $FF

.mainLoop
	ld c, $0A 		; Counter for how many EV's we need to set to $FF. Decimal 10.
.EVLoop
	ld [hl+], a		; Write max EV and move to next address.
	dec c
	jr nz, .EVLoop

	ld [hl], $FA	; Write value to Attack/Defense IV. Male shiny value.
	inc hl
	ld [hl], $AA	; Write value to Speed/Special IV. Shiny value.
	ld e, $05 ; ld de $0005
	add hl, de		; Skip move PP.
	ld [hl+], a		; Give maximum friendship.
	ld [hl], $15	; Give strain D Pokérus.
	
	ld e, $0F ; ld de $000F
	add hl, de		; Increment the pointer to the next Pokémon.
	dec b			; Check if it's the last Pokémon,
	jr nz, .mainLoop; and if it is, fall through.
	xor a
	ld e, a
	ld [de], a		; Relock SRAM.
	ret