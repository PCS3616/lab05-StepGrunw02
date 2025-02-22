@ /0000          ; inicio do programa
SC /010          ; chama a subrotina para calcular os quadrados perfeitos
HM /000          ; fim do programa

@ /010           ; subrotina para calcular os quadrados perfeitos
K /0000          ; inicializa variaveis
LD /090          ; carrega o endereco inicial (0x100)
MM /092          ; armazena o endereco atual
LD /094          ; carrega n (0)
MM /096          ; armazena n
LD /098          ; carrega soma (0)
MM /09A          ; armazena soma

@ /020           ; loop principal
LD /09A          ; carrega a soma
MM /100          ; armazena a soma no endereco 0x100 + 2*n
LD /092          ; carrega o endereco atual
AD /09C          ; soma 2 para proxima posicao
MM /092          ; atualiza o endereco
LD /096          ; carrega n
AD /09E          ; incrementa n em 1
MM /096          ; armazena n
LD /09A          ; carrega a soma
AD /096          ; soma n (para calcular 2n + 1)
AD /096          ; soma n novamente (total: soma += 2n + 1)
AD /0A0          ; soma 1 (completa 2n + 1)
MM /09A          ; armazena a nova soma
LD /096          ; carrega n
SB /0A2          ; subtrai 63 (verifica se n chegou a 63)
JZ /040          ; se sim, termina
JP /020          ; repete o loop

@ /040           ; fim da subrotina
RS /010          ; retorna da subrotina

@ /090           ; variaveis e constantes
K /0100          ; endereco inicial (0x100)
K /0000          ; endereco atual
K /0000          ; n (0 a 63)
K /0000          ; soma (acumula n²)
K /0002          ; constante 2 (incremento de endereco)
K /0001          ; constante 1 (incremento de n)
K /003F          ; constante 63 (limite do loop)
K /0001          ; constante 1 (para 2n + 1)
