/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author ajmd0
 */
public class Ej03 {

    public static void main(String[] args) {
        Persona casting [][] = new Persona [5][8];
        int i,j;
        int dimL[] = new int [5];
        for (i=0; i< 5; i++)
            dimL[i] = -1;
        
        i = 0;
        j = 0;
        Persona dato = new Persona();
        dato.setNombre(Lector.leerString());
        if(!dato.getNombre().equals("ZZZ")){
            GeneradorAleatorio.iniciar();
            dato.setDNI(GeneradorAleatorio.generarInt(47000001));
            dato.setEdad(GeneradorAleatorio.generarInt(20) + 20);
        }
        while((i < 5)&&(!dato.getNombre().equals("ZZZ"))){
            while((j < 8)&& (!dato.getNombre().equals("ZZZ"))){
                casting[i][j] = dato;
                dimL[i]++;
                j++;
                dato = new Persona();
                dato.setNombre(Lector.leerString());
                dato.setDNI(GeneradorAleatorio.generarInt(99999999));
                dato.setEdad(GeneradorAleatorio.generarInt(20) + 20);
            }
            j=0;
            i++;
        }
        
        i= 0;
        j= 0;
        while((i < 5) && (dimL[i] != -1)){
            while(j <= dimL[i]){
                System.out.println(casting[i][j].toString());
                j++;
            }
            i++;
            j=0;
        }
    }
}
