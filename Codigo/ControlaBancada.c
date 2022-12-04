#define BOTAO GP0_bit
#define LUZES GP1_bit
#define BANCADA GP2_bit
#define IN 0x01      //PINOS DE ENTRADA E LIGADO
#define OUT 0X00     //PINOS DE SAIDA E DESLIGADO

long tempo=0;

void iniciarPortas(){
    CMCON = 7; //Desabilita o comparador de tensão
    ANSEL = 0; //Desabilita entradas analogicas
    TRISIO.GP0 = IN; //Definido como entrada
    TRISIO.GP1 = OUT; //Definido como saida
    TRISIO.GP2 = OUT; //Definido como saida
    BOTAO = IN; //GP0 BOTAO
    LUZES = OUT; //GP1 LUZES
    BANCADA = OUT;
}


void delay(int espera){
      VDelay_Advanced_ms(espera,Get_Fosc_kHz());
}

int timer(){
     tempo=0;
     while(!BOTAO){
     delay(1);
     tempo++; 
         if(tempo>500){
                 BANCADA=!BANCADA;
                 return 1;
         }
     }
     return 0;
}


void main(){
     iniciarPortas();
     while(1){
              if(!BOTAO){
                 if(timer()){
                   delay(500);
                   continue;
                 }else{
                      LUZES=!LUZES;
                 }

              }

      }
}
