/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

import PaqueteLectura.Lector;
/**
 *
 * @author ajmd0
 */
public class Ej01 {

    public static void main(String[] args) {
        Triangulo dato = new Triangulo();
        System.out.println("Ingrese las medidas de los tres lados del triángulo.");
        dato.setLado1(Lector.leerDouble());
        dato.setLado2(Lector.leerDouble());
        dato.setLado3(Lector.leerDouble());
        System.out.println("Ahora ingrese el color del relleno");
        dato.setColorRelleno(Lector.leerString());
        System.out.println("Ingrese el color de la línea");
        dato.setColorLinea(Lector.leerString());
        System.out.println("El perímetro del triángulo es "+dato.perimetro()+" cm");
        System.out.println("El área del triángulo es "+dato.area()+" cm");
    }
    
}
