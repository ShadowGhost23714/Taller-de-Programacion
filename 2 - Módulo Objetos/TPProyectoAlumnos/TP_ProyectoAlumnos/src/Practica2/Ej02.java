/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author ajmd0
 */
public class Ej02 {

    public static void main(String[] args) {
         /*Declaración del vector*/
        final int DF = 15;
        Persona[] vector=new Persona[DF];
        int diml=0;
        
        /*Carga del vector*/
        GeneradorAleatorio.iniciar();
        String nombre;
        int edad,dni;
        edad=GeneradorAleatorio.generarInt(100); //0..99
        while((edad!=0)&&(diml<DF)){
            nombre=GeneradorAleatorio.generarString(10);
            dni=GeneradorAleatorio.generarInt(150000);
            vector[diml]= new Persona(nombre,dni,edad); //instacio el objeto y agrego atrás
            diml++;
            edad=GeneradorAleatorio.generarInt(100); //0..99
        }
        
        /*Calculo sobre el vector*/
        int cantMayor65=0;
        Persona pmin=null; int dnimin  =999999;
        
        for(int i=0; i<diml; i++){
            System.out.println(vector[i].toString());   // Descomente para ver la info en el vector
            if(vector[i].getEdad()>65){      //Inciso a
                cantMayor65++;
            } 
            if(vector[i].getDNI()< dnimin){  //Inciso b
               dnimin= vector[i].getDNI();
               pmin  = vector[i];
            }
        }
        System.out.println("La cantidad de personas mayores a 65 son: "+cantMayor65);
        if (pmin != null) System.out.println(pmin.toString());
        else  System.out.println("El vector estaba vacio");
    } 
}
