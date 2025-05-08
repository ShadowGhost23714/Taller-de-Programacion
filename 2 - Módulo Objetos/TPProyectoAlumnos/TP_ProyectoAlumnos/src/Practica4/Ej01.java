/*

1- Nos piden una aplicación estilo Paint, para ello necesitamos representar figuras
geométricas (cuadrados, rectángulos, círculos, triángulos). Todas las figuras tienen color
de relleno y color de línea. Además, los triángulos guardan el valor de sus tres lados, los
cuadrados el valor de su lado, los círculos el valor del radio, y los rectángulos el valor de la
base y de la altura.

Las figuras deben incluir funcionalidad para: crearla a partir de los datos necesarios
(constructor), modificar/obtener el valor de los atributos (métodos get y set), calcular el
área y devolverla (método calcularArea), calcular el perimetro y devolverlo (método
calcularPerimetro), y mostrar la representación String de la figura (método toString)
concatenando toda la información.


A- Analice la jerarquía de figuras (carpeta tema4).

B- Incluya la clase Triángulo a la jerarquía de figuras. Triángulo debe heredar de Figura
todo lo que es común y definir su constructor y sus atributos y métodos propios. Además
debe redefinir el método toString.

C- De igual manera, incluya la clase Círculo a la jerarquía de figuras.

D- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?

E- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?

F- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar

 */
package Practica4;

import PaqueteLectura.Lector;

public class Ej01 {
    
    public static void main(String[] args) {
        String CR,CL;
        double l1, l2, l3, radio;
        
        
        System.out.println("Haga un triángulo.");
        System.out.println("Ingrese el primer lado");
        l1 = Lector.leerDouble();
        System.out.println("Ingrese el segundo lado");
        l2 = Lector.leerDouble();
        System.out.println("Ingrese el tercer lado");
        l3 = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno");
        CR = Lector.leerString();
        System.out.println("Ingrese el color de línea");
        CL = Lector.leerString();
        System.out.println();
        Triangulo tri = new Triangulo(l1,l2,l3,CR,CL);
        System.out.println("Representación del Triángulo: " + tri.toString());
        System.out.println();
        System.out.println("Haga un círculo");
        System.out.println("Ingrese el radio");
        radio = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno");
        CR = Lector.leerString();
        System.out.println("Ingrese el color de línea");
        CL = Lector.leerString();
        Circulo circ = new Circulo(radio,CR,CL);
        System.out.println();
        System.out.println("Representación del Círculo: " + circ.toString());
        System.out.println();
        
        
        tri.despintarFigura();
        circ.despintarFigura();
        System.out.println("Representación del Triángulo despintado: " + tri.toString());
        System.out.println("Representación del Círculo despintado: " + circ.toString());
    }
}