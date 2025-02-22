@ /0000          ; inicio do programa
SC /010          ; chama a subrotina para calcular os quadrados perfeitos
HM /000          ; fim do programa (halt)

@ /010           ; subrotina para calcular os quadrados perfeitos
K /0000          ; inicializa variaveis
LD /090          ; carrega o valor inicial de i (0)
MM /092          ; armazena i na memoria
LD /094          ; carrega o valor inicial da soma (0)
MM /096          ; armazena a soma na memoria

@ /020           ; loop principal
LD /092          ; carrega o valor de i
ML /098          ; multiplica i por 2 (2i)
AD /09A          ; soma 1 (2i + 1)
AD /096          ; atualiza a soma (soma += 2i + 1)
MM /096          ; armazena a soma atualizada
LD /096          ; carrega a soma (n²)
MM /100          ; armazena o quadrado na memoria (posicao 0x100 + 2i)
LD /092          ; carrega i
AD /09A          ; incrementa i (i += 1)
MM /092          ; armazena o novo valor de i
SB /09C          ; subtrai 64 de i (i - 64)
JZ /040          ; se i == 64, termina o loop
JP /020          ; caso contrario, continua o loop

@ /040           ; fim da subrotina
RS /010          ; retorna da subrotina

@ /090           ; variaveis e constantes
K /0000          ; i (inicializado com 0)
K /0000          ; soma (inicializado com 0)
K /0002          ; constante 2 (para multiplicacao)
K /0001          ; constante 1 (para incremento)
K /0040          ; constante 64 (limite do loop)
K /0100          ; endereco inicial para armazenar os quadrados
