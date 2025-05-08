package parcial02;

import PaqueteLectura.GeneradorAleatorio;

public class CodigoPrincipal {

    public static void main(String[] args) {
        Funcion funcion = new Funcion ("Romeo y Julieta", "12/9", 9, 3, 4);
        
        for (int i = 0; i < 8; i++) {
            funcion.ocuparButaca(GeneradorAleatorio.generarInt(3) + 1, GeneradorAleatorio.generarInt(4) + 1);
        }
        System.out.println(funcion.toString());
        
        
        funcion.desocuparFila (2);
        System.out.println(funcion.toString());
    }
}