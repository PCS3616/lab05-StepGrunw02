@ /0000          ; inicio do programa
SC /010          ; chama subrotina de calculo
HM /000          ; encerra programa

@ /010           ; subrotina principal
K /0000          ; inicializacao
LD /090          ; carrega endereco base (0100)
MM /092          ; armazena endereco atual
LD /094          ; carrega contador n=0
MM /096          ; armazena n
LD /098          ; carrega soma=0
MM /09A          ; armazena soma

@ /020           ; loop de calculo
LD /09A          ; carrega soma atual
MM (092)         ; armazena no endereco atual
LD /092          ; carrega endereco
AD /09C          ; soma +2
MM /092          ; atualiza endereco
LD /096          ; carrega n
AD /09E          ; n+1
MM /096          ; atualiza n
LD /09A          ; carrega soma
AD /096          ; soma += 2n+1 (parte 1/2)
AD /096          ; soma += 2n+1 (parte 2/2)
AD /0A0          ; soma += 1
MM /09A          ; atualiza soma
LD /096          ; carrega n
SB /0A2          ; n-63
JZ /040          ; termina se n=63
JP /020          ; repete loop

@ /040           ; finalizacao
RS /010          ; retorna

@ /090           ; dados
K /0100          ; endereco inicial
K /0000          ; endereco atual
K /0000          ; n (0-63)
K /0000          ; soma (n²)
K /0002          ; passo de endereco
K /0001          ; incremento
K /003F          ; limite (63)
K /0001          ; constante 1
