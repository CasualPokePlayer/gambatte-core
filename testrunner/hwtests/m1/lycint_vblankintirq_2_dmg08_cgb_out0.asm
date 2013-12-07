.size 8000

.text@40
	ret
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	jp l1000

.text@100
	jp lbegin

.data@143
	80

.text@150
lbegin:
	xor a, a
	dec a
	ldff(45), a
	ld c, 44
	ld b, 8d
lbegin_waitly8d:
	ldff a, (c)
	cmp a, b
	jrnz lbegin_waitly8d
	ld a, 40
	ldff(41), a
	ld a, 02
	ldff(ff), a
	ei
	ld a, b
	inc a
	inc a
	ldff(45), a
	ld c, 0f
	xor a, a
	ldff(0f), a
	ld b, 03
	ld a, b
	ldff(ff), a

.text@1000
l1000:
	ei

.text@1069
	ldff a, (c)
	and a, b
	ld(ff80), a
	jp lprintff80

.text@7000
lprintff80:
	ld c, 44
	ld b, 91
lprintff80_waitvblank:
	ldff a, (c)
	cmp a, b
	jrnz lprintff80_waitvblank
	xor a, a
	ldff(40), a
	ld bc, 7a00
	ld hl, 8000
	ld d, a0
lprintff80_copytiles:
	ld a, (bc)
	inc bc
	ld(hl++), a
	dec d
	jrnz lprintff80_copytiles
	ld a, c0
	ldff(47), a
	ld a, 80
	ldff(68), a
	ld a, ff
	ldff(69), a
	ldff(69), a
	ldff(69), a
	ldff(69), a
	ldff(69), a
	ldff(69), a
	ld a, 00
	ldff(69), a
	ldff(69), a
	ldff a, (80)
	ld(9800), a
	xor a, a
	ldff(43), a
	ld a, 91
	ldff(40), a
lprintff80_limbo:
	jr lprintff80_limbo

.data@7a00
	00 00 7f 7f 41 41 41 41
	41 41 41 41 41 41 7f 7f
	00 00 08 08 08 08 08 08
	08 08 08 08 08 08 08 08
	00 00 7f 7f 01 01 01 01
	7f 7f 40 40 40 40 7f 7f
	00 00 7f 7f 01 01 01 01
	3f 3f 01 01 01 01 7f 7f
	00 00 41 41 41 41 41 41
	7f 7f 01 01 01 01 01 01
	00 00 7f 7f 40 40 40 40
	7e 7e 01 01 01 01 7e 7e
	00 00 7f 7f 40 40 40 40
	7f 7f 41 41 41 41 7f 7f
	00 00 7f 7f 01 01 02 02
	04 04 08 08 10 10 10 10
	00 00 3e 3e 41 41 41 41
	3e 3e 41 41 41 41 3e 3e
	00 00 7f 7f 41 41 41 41
	7f 7f 01 01 01 01 7f 7f

