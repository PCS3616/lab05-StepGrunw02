@ /0000          ; inicio do programa
SC /010          ; chama subrotina principal
HM /000          ; encerra execucao

@ /010           ; subrotina principal
K /0000          ; inicializa variaveis
LD /090          ; carrega endereco base (0100)
MM /092          ; armazena endereco atual
LD /094          ; inicializa contador n=0
MM /096          ; armazena contador
LD /098          ; inicializa soma=0
MM /09A          ; armazena soma

@ /020           ; loop de calculo
LD /09A          ; carrega soma atual
MM (092)         ; armazena na memoria
LD /092          ; carrega endereco
AD /09C          ; incrementa +2 bytes
MM /092          ; atualiza endereco
LD /096          ; carrega contador
AD /09E          ; incrementa n
MM /096          ; atualiza contador
LD /09A          ; carrega soma
AD /096          ; soma += 2n (parte 1)
AD /096          ; soma += 2n (parte 2)
AD /0A0          ; soma += 1 (2n+1)
MM /09A          ; atualiza soma
LD /096          ; carrega contador
SB /0A2          ; verifica se n=63
JZ /040          ; finaliza se n=63
JP /020          ; repete loop

@ /040           ; finalizacao
RS /010          ; retorna da subrotina

@ /090           ; dados/constantes
K /0100          ; endereco inicial
K /0000          ; endereco atual
K /0000          ; contador (n)
K /0000          ; soma acumulada
K /0002          ; passo de memoria (+2)
K /0001          ; incremento unitario
K /003F          ; limite (dec 63)
K /0001          ; constante 1
