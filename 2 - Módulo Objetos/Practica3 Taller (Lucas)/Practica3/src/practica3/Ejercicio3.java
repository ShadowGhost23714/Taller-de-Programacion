/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.

C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?

 */
package practica3;

import PaqueteLectura.Lector;

public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro li;
        Estante e = new Estante();
        
        for (int i = 0; i<4; i++){
            li = new Libro();
            li.setTitulo(Lector.leerString());
            e.agregarLibro(li);
        }
        
        System.out.println("Hay " + e.contarLibros() + " Libros en la estanteria");
        System.out.println(e.espacioEstanteria());
        if(e.buscarTitulo( "Mujercitas", e.contarLibros()))
            System.out.println("El titulo se encuentra en la estanteria ");
        else
            System.out.println("El titulo NO se encuentra en la estanteria ");
    }
    
}
