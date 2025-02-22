@ =0000   ; Início do programa principal
    LD N   ; Carrega N no AC
    JZ FIM ; Se N for 0, vai para o final
    SC FAT ; Chama a sub-rotina do fatorial
    HM /0006  ; Finaliza o programa

@ =0200  ; Início da sub-rotina FAT
FAT LD N       ; Carrega N no AC
    MM NTEMP   ; Salva N em NTEMP
    MM FACTEMP ; Salva N em FACTEMP

LOOP LD NTEMP  ; Carrega NTEMP no AC
    SB UM      ; Subtrai 1
    JZ FIMFAT  ; Se NTEMP - 1 = 0, termina o cálculo
    MM NTEMP   ; Atualiza NTEMP
    LD FACTEMP ; Carrega FACTEMP no AC
    ML NTEMP   ; Multiplica por NTEMP
    MM FACTEMP ; Atualiza FACTEMP
    JP LOOP    ; Volta para o loop

FIMFAT LD FACTEMP ; Carrega resultado final
    MM RES       ; Salva em RES
    RS FAT       ; Retorna da sub-rotina

FIM LD UM    ; Caso N seja 0, RES = 1
    MM RES  
    HM /0304 ; Finaliza

@ =0008
UM      K =1     ; Constante para decrementar
FACTEMP K =1     ; Variável para armazenar o fatorial
NTEMP   K =1     ; Variável temporária para N durante o loop

@ =0100
N  K =0  ; Argumento do fatorial
RES K =0 ; Resultado do fatorial

