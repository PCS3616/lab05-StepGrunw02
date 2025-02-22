; programa principal
K/ 8100 ; carrega N no AC
K/ 1300 ; desvio se N for 0
K/ A200 ; desvio para sub-rotina
K/ C006 ; finaliza o programa

; sub-rotina
K/ 0006 ; inicio da subrotina
K/ 8100 ; armazena N no AC
K/ 900C ; N no NTemp
K/ 900A ; N no FatTemp

K/ 800C ; NTemp no AC
K/ 5008 ; subtrai 1 do AC
K/ 1218 ; desvio para finalizar quando NTemp - 1 = 0
K/ 900C ; salva novo NTemp
K/ 800A ; carrega FatTemp no AC
K/ 600C ; multiplica novo NTemp por FatTemp
K/ 900A ; salva novo FatTemp
K/ 0208 ; volta para o inicio do loop
K/ 800A ; FatTemp no AC
K/ 9102 ; resultado em 0x102
K/ B200 ; retorna da subrotina


; desvio se N for zero
K/ 3001 ; carrega 1 no AC
K/ 9102 ; AC para memo 0x102
K/ C304 ; finaliza


; dados
K/ 0001 ; constante para decrementar (1)
K/ 0001 ; variavel para armazenar o fatorial (FatTemp)
K/ 0001 ; variavel temporaria para N durante o loop (NTemp)
