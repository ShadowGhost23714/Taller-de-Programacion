/*

A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:


- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)

- Calcular el perímetro y devolverlo (método calcularPerimetro)

- Calcular el área y devolverla (método calcularArea)


B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.


NOTA: la constante PI es Math.PI

 */
package Practica3;
import PaqueteLectura.Lector;
/**
 * @author ajmd0
 */
public class Ej05 {

    public static void main(String[] args) {
        Circulo circulo = new Circulo ();
        
        System.out.println("Siga los mensajes para hacer un circulo y conocer su perímetro y área.");
        System.out.println();
        System.out.println("Ingrese el radio.");
        circulo.setRadio(Lector.leerDouble());
        System.out.println("Ingrese el color del relleno.");
        circulo.setRelleno(Lector.leerString());
        System.out.println("Ingrese el color de la línea");
        circulo.setLinea(Lector.leerString());
        System.out.println();
        System.out.println("El circulo de color "+circulo.getRelleno()+" por dentro y bordeado de "+circulo.getLinea()+" tiene un perímetro de "+circulo.getPerimetro()+" y un área de "+circulo.getArea());
    }
}