; programa principal
K/ 0000 8100 ; carrega N no AC
K/ 0002 1300 ; desvio se N for 0
K/ 0004 A200 ; desvio para sub-rotina
K/ 0006 C006 ; finaliza o programa

; sub-rotina
K/ 0200 0006 ; inicio da subrotina
K/ 0202 8100 ; armazena N no AC
K/ 0204 900C ; N no NTemp
K/ 0206 900A ; N no FatTemp

K/ 0208 800C ; NTemp no AC
K/ 020A 5008 ; subtrai 1 do AC
K/ 020C 1218 ; desvio para finalizar quando NTemp - 1 = 0
K/ 020E 900C ; salva novo NTemp
K/ 0210 800A ; carrega FatTemp no AC
K/ 0212 600C ; multiplica novo NTemp por FatTemp
K/ 0214 900A ; salva novo FatTemp
K/ 0216 0208 ; volta para o inicio do loop
K/ 0218 800A ; FatTemp no AC
K/ 021A 9102 ; resultado em 0x102
K/ 021C B200 ; retorna da subrotina


; desvio se N for zero
K/ 0300 3001 ; carrega 1 no AC
K/ 0302 9102 ; AC para memo 0x102
K/ 0304 C304 ; finaliza


; dados
K/ 0008 0001 ; constante para decrementar (1)
K/ 000A 0001 ; variavel para armazenar o fatorial (FatTemp)
K/ 000C 0001 ; variavel temporaria para N durante o loop (NTemp)
