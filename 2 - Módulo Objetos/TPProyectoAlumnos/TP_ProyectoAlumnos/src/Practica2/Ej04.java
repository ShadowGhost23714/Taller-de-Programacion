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
public class Ej04 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona casting [][] = new Persona [5][8];
        int i,j;
        int dia;
        int dl[] = new int [5];
        for (i=0; i< 5; i++)
            dl[i] = 0;
        
        Persona dato = new Persona();
        
        System.out.println ("Ingrese un día del 1 al 5 para el casting, más su nombre, dni y edad.");
        dia = Lector.leerInt();
        dato.setNombre(Lector.leerString());
        while (!dato.getNombre().equals("ZZZ")){   
            if ((dia<=5) && (dia>=1) && (dl[dia-1] < 8)) {
                dato.setDNI(GeneradorAleatorio.generarInt(47000001));
                dato.setEdad(GeneradorAleatorio.generarInt(20) + 20);
                casting[dia-1][dl[dia-1]] = dato;
                dl[dia-1]++;
                dato = new Persona();
            }
            else
                System.out.println ("No hay tunos disponibles para ese día o día inválido.");
            System.out.println ();
            System.out.println ("Ingrese un día del 1 al 5 para el casting, más su nombre, dni y edad.");
            dia = Lector.leerInt();
            dato.setNombre(Lector.leerString());
        }
        
        for (i=0;i<5;i++){
            System.out.println ("La cantidad de inscriptos para el día "+(i+1)+" es "+dl[i]);
            for (j=0;j<dl[i];j++)
                System.out.println (casting[i][j].getNombre()+" se anotó al turno "+(j+1));
        }
    }
}