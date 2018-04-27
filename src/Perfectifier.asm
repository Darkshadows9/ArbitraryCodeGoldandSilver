; Make all Pokemon in the current box "perfect".

; Pokemon2Species: ; wPartyMon2, $DA5A.
; 	jp, perfectifier ; wTMsHMs, $D57E.

SECTION "Perfectifier Payload", ROM0 ; Make all the Pokémon in the current box "perfect".
perfectifier: ; wTMsHMs, $D57E.
	xor a
	ld h, a
	ld l, a ; ld hl, $0000
	ld [hl], $0A	;Unlock SRAM. Standard is writing $0A to $0000.
	
	ld h, $40 ; ld hl, $4000
	ld [hl], $01	; Switch SRAM bank. Write desired bank to $4000.
	

	ld hl, (sBox + $21)	; Pointer for first EV of first boxed Pokémon.
	ld d, $00			; Zero out d, so we can use de as an offset later.
	ld b, $14			; Counter for how many Pokémon to change. Decimal 20.
	dec a ; ld a, $FF

.mainLoop
	ld c, $0A 			; Counter for how many EV's we need to set to $FF. Decimal 10.
.EVLoop
	ld [hl+], a			; Write max EV and move to next address.
	dec c
	jr nz, .EVLoop

	ld [hl], $FA		; Write value to Attack/Defense IV. Male shiny value.
	inc hl
	ld [hl], $AA		; Write value to Speed/Special IV. Shiny value.
	ld e, $05 ; ld de $0005
	add hl, de			; Skip move PP.
	ld [hl+], a			; Give maximum friendship.
	ld [hl], $15		; Give strain D Pokérus.
	
	ld e, $0F ; ld de $000F
	add hl, de			; Increment the pointer to the next Pokémon.
	dec b				; Check if it's the last Pokémon,
	jr nz, .mainLoop	; and if it is, fall through.
	xor a
	ld e, a
	ld [de], a			; Relock SRAM.
	ret
