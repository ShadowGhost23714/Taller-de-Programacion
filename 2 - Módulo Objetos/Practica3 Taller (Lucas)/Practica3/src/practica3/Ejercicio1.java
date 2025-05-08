/*
Nota: Trabajar sobre la carpeta “tema3” del proyecto
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y  𝑠 = . La función raíz cuadrada es Math.sqrt(#) 𝑎+𝑏+𝑐
 */
package practica3;

import PaqueteLectura.GeneradorAleatorio;

import PaqueteLectura.Lector;

public class Ejercicio1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Triangulo t1 = new Triangulo();
        
        System.out.println("Ingrese los 3 lados del triangulo ");
        t1.leerLados(GeneradorAleatorio.generarDouble(10),GeneradorAleatorio.generarDouble(10),GeneradorAleatorio.generarDouble(10));
        System.out.println("Ingrese el color de relleno y el color de linea");
        t1.leerColores(Lector.leerString(), Lector.leerString());
        System.out.println(t1.calcularArea());//tira el error not a number (NaN);
        System.out.println(t1.calcularPerimetro());
        System.out.println(t1.toString());
    }
}
