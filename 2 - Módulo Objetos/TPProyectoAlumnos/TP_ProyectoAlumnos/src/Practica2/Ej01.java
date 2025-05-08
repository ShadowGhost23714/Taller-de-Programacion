/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import PaqueteLectura.Lector;
/**
 *
 * @author ajmd0
 */
public class Ej01 {
    
    public static void main(String[] args) {
        
        System.out.println("Ingrese nombre, dni y edad");
        String nombre = Lector.leerString();
        int dni = Lector.leerInt();
        int edad= Lector.leerInt();
        
        //Opcion 1
        Persona p1 = new Persona(); //Instancio el objeto sin valores iniciales
        p1.setNombre(nombre);       //Luego, seteo los datos enviando mensajes set
        p1.setDNI(dni);
        p1.setEdad(edad);
        System.out.println(p1.toString());
        
        //Opcion 2
        Persona p2 = new Persona(nombre, dni, edad); //Instancio el objeto enviando valores iniciales
        System.out.println(p2.toString());
    }
}