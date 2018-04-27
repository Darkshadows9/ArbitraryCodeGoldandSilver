; Make all Pokémon in the currently active box shiny.

; Pokemon2Species: ; wPartyMon2, $DA5A.
; 	jp, shinifier ; wTMsHMs, $D57E.

SECTION "Shinifier Payload", ROM0 ; Make all Pokémon in the current box shiny.
shinifier: ; wTMsHMs, $D57E.
	xor a
	ld h, a
	ld l, a ; ld hl, $0000
	ld [hl], $0A		; Unlock SRAM. Standard is writing $0A to $0000.
	
	ld h, $40 ; ld hl, $4000
	ld [hl], $01		; Switch SRAM bank. Write desired bank to $4000.

	ld hl, (sBox + $2B)	; Pointer for first IV of first boxed Pokémon.
	ld de, $001F		; Offset to increment to next Pokémon's data.
	ld b, $14			; Counter for how many Pokémon to change. Decimal 20.

.mainLoop
	ld [hl], $FA		; Write value to Attack/Defense IV. Male shiny value.
	inc hl
	ld [hl], $AA		; Write value to Speed/Special IV. Shiny value.
	
	add hl, de			; Increment the pointer to the next Pokémon.
	dec b				; If it's the last Pokémon,
	jr nz, .mainLoop	; fall through.
	ld e, a ; ld hl, $0000
	ld [de], a			; Relock SRAM.
	ret
