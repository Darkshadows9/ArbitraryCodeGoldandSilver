; Execute TM17 out of pocket with the following Quagsire and TM setup:

; Quagsire = C3
; Held item = Lucky Egg = $7E
; First move = Attract = $D5

; Pokemon2Species: ; $DA5A.
; 	jp, givePokemonCustom ; $D57E.

; TM01 x38	; 26
; TM02 x‭‬208	; D0
; TM03 x‭46‬	; 2E
; TM04 x‭4	; 04
; TM05 x62	; 3E
; TM06 x‭1	; 01 ; Index of Pokémon you'll receive.
; TM07 x119‭‬	; 77
; TM08 x‭46‬	; 2E
; TM09 x64	; 40
; TM10 x‭62‬	; 3E
; TM11 x5	; 05 ; Level of Pokémon you'll receive.
; TM12 x119	; 77
; TM13 x46	; 2E
; TM14 x2	; 02
; TM15 x62	; 3E
; TM16 x0	; 00 ; Item Pokémon is holding.
; TM17 x119	; 77
; TM18 x62	; 3E
; TM19 x3	; 03
; TM20 x33	; 21
; TM21 x142	; 8E
; TM22 x98	; 62
; TM23 x205	; CD
; TM24 x39	; 27
; TM25 x46	; 2E
; TM26 x201	; C9

POKEMON_TO_GIVE	EQU	1 ; Decimal representation, since the TM amount is decimal. Default to Bulbasaur.
POKEMON_LEVEL	EQU	5 ; Assume level 5, like it's a baby Pokémon.
ITEM_TO_GIVE	EQU 0 ; Assume no item.

SECTION "Give Pokémon Custom", ROM0[$0000]
givePokemonCustom: ; First TM quantity. $D57E.
	ld h, $D0
	ld l, $04 ; ld hl, $D004
	ld a, POKEMON_TO_GIVE
	ld [hl], a
	ld l, $40 ; ld hl, $D040
	ld a, POKEMON_LEVEL
	ld [hl], a
	ld l, $02 ; ld hl, $D002
	ld a, ITEM_TO_GIVE
	ld [hl], a
	ld a, $03 ; Bank to call.
	ld hl, $628E ; Address to call.
	call $2E27 ; Farcall to subroutine in bank stored in a and address stored in hl.
	ret