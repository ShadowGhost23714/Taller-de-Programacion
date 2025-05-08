/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1;

import PaqueteLectura.Lector;

/**
 *
 * @author ajmd0
 */
public class Ej04Matrices {

    public static void main(String[] args) {
        int piso, oficina, i, j;
        int [][] edificio = new int [8][4];
        piso = Lector.leerInt();
        while (piso != 9){
            oficina = Lector.leerInt();
            edificio[piso-1][oficina-1]++;
            piso = Lector.leerInt();
        }
        for (i=0;i<8;i++)
            for (j=0;j<4;j++)
                System.out.println("En piso "+(i+1)+" concurrieron en la oficina "+(j+1)+" un total de "+edificio [i][j]+" personas.");
    }
}