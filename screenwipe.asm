define pL $00
define pH $01

define trail $1
define color $2

lda #$0
sta pL

lda #$02
sta pH

loop:
  jsr draw
  jsr sleep
  jmp loop

draw:
  ldy #0
  lda #trail
  sta (pL),y

  ldx pL
  inx
  stx pL

  ldy #0
  lda #color
  sta (pL),y

  cpx #$FF
  beq nextDown

  rts

nextDown:
  ldx pH
  inx
  stx pH
  rts

sleep:
  ldy #8
spinloop:
  nop
  dey
  bne spinloop
  rts
