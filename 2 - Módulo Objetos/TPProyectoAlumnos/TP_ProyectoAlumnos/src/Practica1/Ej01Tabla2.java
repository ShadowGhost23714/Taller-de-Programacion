/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF = 11;
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        int dl = 0;
        int num;
        for (i=0;i<DF;i++) {
            num = GeneradorAleatorio.generarInt(20);
            if (num != 11) {
                tabla2[i]=2*num;
                dl++;
            }
        }
        for (i=0;i<dl;i++)
            System.out.println("2 x " + tabla2[i]/2 + " = "+ tabla2[i]);
    } 
}
