; Pokemon2Species: ; wPartyMon2, $DA5A.
; 	jp, formatTMs	; wPCItems, $D617.

SECTION "Simple Bootstrap", ROM0
formatTMs:	; (wPCItems + $01), $D617.
	ld a, $FF
	ld b, 50 	;Loop counter.
	ld hl, wTMsHMs
.mainLoop
	ld [hl+], a	;Set this TM to 255 and move the pointer to the next TM.
	dec b
	jr nz, .mainLoop
	ret