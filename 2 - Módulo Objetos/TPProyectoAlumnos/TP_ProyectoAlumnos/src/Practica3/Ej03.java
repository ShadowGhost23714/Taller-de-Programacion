package Practica3;

import PaqueteLectura.Lector;

public class Ej03 {

    public static void main(String[] args) {
        Libro libro;
        Estante estante = new Estante(10);
        
        for (int i = 0; i < 5; i++) {
            libro = new Libro();
            libro.setTitulo(Lector.leerString());
            estante.agregarLibro(libro);
        }
        
        System.out.println (estante.cantidadDeLibros());
        
        System.out.println(estante.estaLleno());
        
        System.out.println("Ingrese el título de un libro para que sea buscado en el estante.");
        String titulo = Lector.leerString();
        if (estante.existeEseLibro(titulo, estante.cantidadDeLibros()))
            System.out.println("El libro "+titulo+" está en el estante.");
        else
            System.out.println("El libro "+titulo+" no está en el estante");
        
        
        if (estante.existeEseLibro("Mujercitas", estante.cantidadDeLibros()))
            System.out.println("El libro Mujercitas está en el estante.");
        else
            System.out.println("El libro Mujercitas no está en el estante");
    }
}
