; To bootstrap this in Pokémon Gold and Silver, first, follow these instructions by Crystal_ until you obtain have a functional memory editor:
; https://www.youtube.com/watch?v=PsIb3OZaYAs&t=430s

; Then, edit your stored inventory memory by using the following Quagsire and box 1 names with out of pocket TM17, as inspired by Spamviech:
; Quagsire = C3
; Held item = TM09 = $C8
; First move = Return = $D8
; Pokémon2Species: ; Pokémon 2 species, $DA5A.
; 	jp, writeMemory ; $D8C8.

; Pk♀LM]]	ld $D617, $3E
; Pk♀MM A	ld $D618, $FF
; Pk♀MNDD	ld $D619, $06
; Pk♀NNZZ	ld $D61A, $32
; Pk♀NOQR	ld $D61B, $21
; Pk♀OO?Y	ld $D61C, $7E
; Pk♀OPPk,	ld $D61D, $D5
; Pk♀PPRR	ld $D61E, $22
; Pk♀PQCD	ld $D61F, $05
; Pk♀QQQQ	ld $D620, $20
; Pk♀QR88	ld $D621, $FC
; Pk♀RR-?	ld $D622, $C9

; After that, your stored inventory should be as follows:
; PP Up				x255	; 3E FF
; Teru-Sama($06)	x50		; 06 32
; X Accuracy		x126	; 21 7E
; TM22				x34		; D5 22
; Poké Ball			x32		; 05 20
; Glitch Item($FC)	x201	; FC C9

; which translates to the following code in memory, executed with this Quagsire:
; Quagsire = C3
; Held item = Thunderstone = $17
; First move = Sleep Talk = $D6
; Pokémon2Species: ; Pokémon 2 species, $DA5A.
; 	jp, formatTMs	; $D617.

SECTION "Format TM's", ROM0[$0000]
formatTMs:	; First stored item ID. $D617.
	ld a, $FF
	ld b, $32		;Loop counter. Decimal 50.
	ld hl, $D57E
.mainLoop
	ld [hl+], a		;Set this TM to 255 and move the pointer to the next TM.
	dec b
	jr nz, .mainLoop
	ret