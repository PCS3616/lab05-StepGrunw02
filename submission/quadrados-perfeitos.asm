@ /0000
LV /000 ; inicializa ac com 0
MM /102 ; armazena 0 na posicao 0x102
MM /104 ; inicializa o acumulador de somas
LV /001 ; inicializa o contador n com 1
MM /106

@ /0010
LD /104 ; carrega sn
AD /106 ; soma n
MM /104 ; atualiza sn
LD /104 ; carrega quadrado perfeito
MM /102 ; armazena na posicao correta
LD /106 ; carrega n
AD /108 ; incrementa n
MM /106 
SB /10A ; verifica se n chegou em 64
JZ /030 ; se sim, finaliza
JP /010 ; repete loop

@ /0030
HM /000 ; fim

@ /0108
K /0002 ; cte 2

@ /010A
K /0040 ; limite 64
