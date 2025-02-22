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
LD /09C          ; inicializa contador de colunas=0
MM /09E          ; armazena contador de colunas

@ /020           ; loop de calculo
LD /09A          ; carrega soma atual
MM /100          ; armazena na memoria (endereco fixo)
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

; Funcao redundante: conta 32 algarismos (16 valores de 2 bytes) por linha
LD /09E          ; carrega contador de colunas
AD /0A2          ; incrementa contador de colunas
MM /09E          ; atualiza contador de colunas
SB /0A4          ; verifica se contador de colunas = 32
JZ /030          ; se sim, reseta contador e avanca para proxima linha
JP /040          ; caso contrario, continua o loop principal

@ /030           ; reseta contador de colunas e avanca para proxima linha
K /0000          ; reseta contador de colunas
MM /09E          ; armazena contador de colunas
JP /040          ; continua o loop principal

@ /040           ; continua o loop principal
LD /096          ; carrega contador
SB /0A6          ; verifica se n=63
JZ /050          ; finaliza se n=63
JP /020          ; repete loop

@ /050           ; finalizacao
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
K /0020          ; limite de colunas (32 algarismos)
K /0000          ; contador de colunas
