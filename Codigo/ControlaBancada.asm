
_main:

;ControlaBancada.c,10 :: 		void main() {
;ControlaBancada.c,11 :: 		CMCON = 7; //Desabilita o comparador de tensão
	MOVLW      7
	MOVWF      CMCON+0
;ControlaBancada.c,12 :: 		ANSEL = 0; //Desabilita entradas analogicas
	CLRF       ANSEL+0
;ControlaBancada.c,14 :: 		TRISIO.GP0 = entrada; //Definido como entrada
	BSF        TRISIO+0, 0
;ControlaBancada.c,15 :: 		TRISIO.GP1 = saida; //Definido como saida
	BCF        TRISIO+0, 1
;ControlaBancada.c,16 :: 		TRISIO.GP2 = saida; //Definido como saida
	BCF        TRISIO+0, 2
;ControlaBancada.c,22 :: 		GP0_bit = Alta; //GP0 inicia em nível lógico alto
	BSF        GP0_bit+0, BitPos(GP0_bit+0)
;ControlaBancada.c,23 :: 		GP1_bit = Baixa; //Todos os demais pinos iniciarão em nível lógico baixo
	BCF        GP1_bit+0, BitPos(GP1_bit+0)
;ControlaBancada.c,24 :: 		GP2_bit = Baixa;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;ControlaBancada.c,29 :: 		do {
L_main0:
;ControlaBancada.c,30 :: 		while (GP0_bit == Baixa) {
L_main3:
	BTFSC      GP0_bit+0, BitPos(GP0_bit+0)
	GOTO       L_main4
;ControlaBancada.c,31 :: 		tempo += delay;
	MOVLW      200
	ADDWF      _tempo+0, 1
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _tempo+1, 1
;ControlaBancada.c,32 :: 		delay_ms(delay);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;ControlaBancada.c,33 :: 		if (tempo <= DelayLuzes && GP0_bit == Alta) {
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tempo+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _tempo+0, 0
	SUBLW      244
L__main20:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
	BTFSS      GP0_bit+0, BitPos(GP0_bit+0)
	GOTO       L_main8
L__main18:
;ControlaBancada.c,34 :: 		if (GP1_bit == Baixa) {
	BTFSC      GP1_bit+0, BitPos(GP1_bit+0)
	GOTO       L_main9
;ControlaBancada.c,35 :: 		GP1_bit = Alta;
	BSF        GP1_bit+0, BitPos(GP1_bit+0)
;ControlaBancada.c,36 :: 		tempo = 0;
	CLRF       _tempo+0
	CLRF       _tempo+1
;ControlaBancada.c,37 :: 		} else {
	GOTO       L_main10
L_main9:
;ControlaBancada.c,38 :: 		if (GP1_bit == Alta) {
	BTFSS      GP1_bit+0, BitPos(GP1_bit+0)
	GOTO       L_main11
;ControlaBancada.c,39 :: 		GP1_bit = Baixa;
	BCF        GP1_bit+0, BitPos(GP1_bit+0)
;ControlaBancada.c,40 :: 		tempo = 0;
	CLRF       _tempo+0
	CLRF       _tempo+1
;ControlaBancada.c,41 :: 		}
L_main11:
;ControlaBancada.c,42 :: 		}
L_main10:
;ControlaBancada.c,43 :: 		} else {
	GOTO       L_main12
L_main8:
;ControlaBancada.c,44 :: 		if (tempo >= delayBancada) {
	MOVLW      128
	XORWF      _tempo+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      232
	SUBWF      _tempo+0, 0
L__main21:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
;ControlaBancada.c,45 :: 		if (GP2_bit == Baixa) {
	BTFSC      GP2_bit+0, BitPos(GP2_bit+0)
	GOTO       L_main14
;ControlaBancada.c,46 :: 		GP2_bit = Alta;
	BSF        GP2_bit+0, BitPos(GP2_bit+0)
;ControlaBancada.c,47 :: 		tempo = 0;
	CLRF       _tempo+0
	CLRF       _tempo+1
;ControlaBancada.c,48 :: 		} else {
	GOTO       L_main15
L_main14:
;ControlaBancada.c,49 :: 		if (GP2_bit == Alta) {
	BTFSS      GP2_bit+0, BitPos(GP2_bit+0)
	GOTO       L_main16
;ControlaBancada.c,50 :: 		GP2_bit = Baixa;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;ControlaBancada.c,51 :: 		tempo = 0;
	CLRF       _tempo+0
	CLRF       _tempo+1
;ControlaBancada.c,52 :: 		}
L_main16:
;ControlaBancada.c,53 :: 		}
L_main15:
;ControlaBancada.c,54 :: 		delay_ms(delayTroca);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;ControlaBancada.c,56 :: 		}
L_main13:
;ControlaBancada.c,58 :: 		}
L_main12:
;ControlaBancada.c,60 :: 		}
	GOTO       L_main3
L_main4:
;ControlaBancada.c,61 :: 		tempo = 0;
	CLRF       _tempo+0
	CLRF       _tempo+1
;ControlaBancada.c,63 :: 		} while (1);
	GOTO       L_main0
;ControlaBancada.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
