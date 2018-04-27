; Give a single Pokémon at any level holding any item to the player.

; Pokemon2Species: ; wPartyMon2, $DA5A.
; 	jp, givePokemonACE ; wTMsHMs, $D57E.

POKEMON_TO_GIVE	EQU	1 ; Decimal representation, since the TM amount is decimal. Default to Bulbasaur.
POKEMON_LEVEL	EQU	5 ; Assume level 5, like it's a baby Pokémon.
ITEM_HELD		EQU 0 ; $00 ; Assume no item.

SECTION "Give Pokémon Payload", ROM0
givePokemonACE: ; wTMsHMs, $D57E.
	ld h, $D0
	ld l, $04			; ld hl, wCurPartySpecies
	ld a, POKEMON_TO_GIVE
	ld [hl], a
	ld l, $40			; ld hl, wCurPartyLevel
	ld a, POKEMON_LEVEL
	ld [hl], a
	ld l, $02			; ld hl, wCurItem
	ld a, ITEM_HELD
	ld [hl], a
	ld a, $03			; Bank to call.
	ld hl, GivePoke		; Address to call.
	call farcall		; Pass a and hl.
	ret
