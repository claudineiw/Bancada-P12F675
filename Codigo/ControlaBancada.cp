#line 1 "C:/Users/Claud/Desktop/Bancada/Codigo/ControlaBancada.c"
int tempo = 0;
const int entrada = 0x01;
const int saida = 0x00;
const int Alta = 0x01;
const int Baixa = 0x00;
const int delay = 200;
const int delayTroca = 500;
const int DelayLuzes = 500;
const int delayBancada = 1000;
void main() {
 CMCON = 7;
 ANSEL = 0;

 TRISIO.GP0 = entrada;
 TRISIO.GP1 = saida;
 TRISIO.GP2 = saida;





 GP0_bit = Alta;
 GP1_bit = Baixa;
 GP2_bit = Baixa;




 do {
 while (GP0_bit == Baixa) {
 tempo += delay;
 delay_ms(delay);
 if (tempo <= DelayLuzes && GP0_bit == Alta) {
 if (GP1_bit == Baixa) {
 GP1_bit = Alta;
 tempo = 0;
 } else {
 if (GP1_bit == Alta) {
 GP1_bit = Baixa;
 tempo = 0;
 }
 }
 } else {
 if (tempo >= delayBancada) {
 if (GP2_bit == Baixa) {
 GP2_bit = Alta;
 tempo = 0;
 } else {
 if (GP2_bit == Alta) {
 GP2_bit = Baixa;
 tempo = 0;
 }
 }
 delay_ms(delayTroca);

 }

 }

 }
 tempo = 0;

 } while (1);
}
