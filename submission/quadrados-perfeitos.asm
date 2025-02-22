@ /0000
K /0000     ; inicializa acumulador
MM /0100    ; armazena 0² na posição 0x100
LD /0000    ; zera acumulador
MM /0102    ; armazena espaço para próximo valor
K /0001     ; inicializa n = 1
MM /0090    ; armazena contador

@ /0010
LD /0090    ; carrega n
MM /0092    ; armazena temporário
AD /0090    ; soma n + n
SB /0001    ; subtrai 1 para obter 2n-1
MM /0094    ; armazena 2n-1

LD /0100    ; carrega valor acumulado
AD /0094    ; soma (2n-1)
MM /0102    ; armazena novo quadrado na posição de memória

LD /0090    ; incrementa n
AD /0001
MM /0090

LD /0102    ; atualiza ponteiro de memória
AD /0002
MM /0100

SB /0080    ; verifica se chegou a 64 (0x40)
JN /0010    ; se não, continua iterando

HM /FFFF    ; fim do programa

@ /0080
K /0040     ; constante 64

@ /0090
K /0000     ; contador n inicial
K /0000     ; temporário para n
K /0000     ; temporário para 2n-1

@ /0100
K /0000     ; armazena resultado de n²
