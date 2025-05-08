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
public class Ej05Matrices {
    
    public static void main(String[] args) {
        int [][] notas = new int [5][4];
        int i,j;
        int total = 0;
        double prom;
        for (i=0;i<5;i++)
            for (j=0;j<4;j++)
                notas[i][j] = Lector.leerInt();
        for (i=0;i<5;i++){
            for (j=0;j<4;j++)
                total = total + notas[i][j];
            prom = (double) total / 4;
            System.out.println("El promedio de las calificaciones del cliente N°"+(i+1)+" es "+prom);
            total = 0;
        }
    }
}
