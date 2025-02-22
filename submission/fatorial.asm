; programa principal
@ /0000
LD /100 ; carrega N no ac
JZ /300 ; desvio se N for 0
SC /200 ; desvio para sub-rotina
HM /006 ; finaliza o programa

; sub-rotina
@ /0200
K /0006 ; inicio da subrotina
LD /100 ; armazena N no ac
MM /00C ; N no NTemp
MM /00A ; N no FatTemp

@ /0208
LD /00C ; NTemp no ac
SB /008 ; subtrai 1 do ac
JZ /218 ; desvio para finalizar quando NTemp - 1 = 0
MM /00C ; salva novo NTemp
LD /00A ; carrega FatTemp no ac
ML /00C ; multiplica novo NTemp por FatTemp
MM /00A ; salva novo FatTemp
JP /208 ; volta para o inicio do loop

@ /0218
LD /00A ; FatTemp no ac
MM /102 ; resultado em 0x102
RS /200 ; retorna da subrotina


; desvio se N for zero
@ /0300
LV /001 ; carrega 1 no ac
MM /102 ; ac para memo 0x102
HM /304 ; finaliza


; dados
@ /0008
K /0001 ; constante para decrementar (1)
@ /000A
K /0001 ; variavel para armazenar o fatorial (FatTemp)
@ /000C
K /0001 ; variavel temporaria para N durante o loop (NTemp)
