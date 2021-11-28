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
    CMCON = 7; //Desabilita o comparador de tensão
    ANSEL = 0; //Desabilita entradas analogicas

    TRISIO.GP0 = entrada; //Definido como entrada
    TRISIO.GP1 = saida; //Definido como saida
    TRISIO.GP2 = saida; //Definido como saida
    // TRISIO.GP3  = saida;         //Definido como saida
    //TRISIO.GP4  = saida;         //Definido como saida
    //  TRISIO.GP5  = saida;         //Definido como saida


    GP0_bit = Alta; //GP0 inicia em nível lógico alto
    GP1_bit = Baixa; //Todos os demais pinos iniciarão em nível lógico baixo
    GP2_bit = Baixa;
    //GP3_bit    = Baixa;
    //GP4_bit    = Baixa;
    // GP5_bit    = Baixa;

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