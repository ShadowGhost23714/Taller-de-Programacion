/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package Practica3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, new Autor ("Herbert Schildt", "quien se comia los mocos", "Bosnia"), "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games", "CreateSpace Independent Publishing", new Autor ("John Horton", "quien no sabia leer", "Armenia"), "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        System.out.println("El autor que escribió "+libro2.getTitulo()+" es "+libro2.getPrimerAutor().toString());
    }
}
