@ =0000
    LV /0001   ; Inicializa AC com 1
    MM RES     ; Define RES = 1
    SC FATORIAL ; Chama a sub-rotina
FIM HM /0006   ; Finaliza o programa

@ =0F00  ; Início da sub-rotina FATORIAL
FATORIAL JP FIM  ; Salta para o fim (caso necessário)

    LD N  ; Carrega N no AC
    JZ FIM_ZERO  ; Se N for 0, vai para o caso especial

LOOP ML RES  ; Multiplica N pelo resultado parcial
    MM RES  ; Atualiza RES com o novo valor
    LD N  ; Carrega N no AC
    SB UM  ; Subtrai 1 de N
    MM N  ; Salva o novo valor de N
    LD N  ; Carrega o novo N no AC
    JZ FIM_SUBROTINA  ; Se N for 0, encerra a sub-rotina
    JP LOOP  ; Volta para o loop

FIM_SUBROTINA RS FATORIAL  ; Retorna da sub-rotina

FIM_ZERO LD UM  ; Se N = 0, coloca 1 no AC
    MM RES  ; Armazena 1 como resultado final
FIM_SUBROTINA_ZERO RS FATORIAL  ; Retorna da sub-rotina

@ =0100
N  K =0  ; Argumento do fatorial
RES K =0 ; Resultado do fatorial
UM  K =1 ; Constante para decrementar
