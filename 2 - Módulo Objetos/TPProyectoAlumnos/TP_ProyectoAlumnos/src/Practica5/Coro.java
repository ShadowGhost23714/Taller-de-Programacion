/*

Los coros poseen un nombre y están formados por un director y una serie de coristas.

Devolver la representación de un coro formada por el nombre del coro, todos los datos del director y todos los datos de todos los coristas.

 */
package Practica5;

public abstract class Coro {
    private String nombre;
    private Director director;
    private int cantCoristas;

    public Coro(String nombre, Director director, int cantCoristas) {
        this.nombre = nombre;
        this.director = director;
        this.cantCoristas = cantCoristas;
    }
    
    @Override
    public String toString() {
        String aux = this.getNombre() + ", director " + this.director.toString();
        return aux;
    }
    
    public abstract boolean estaBienFormado ();
    
    public abstract boolean estaLleno ();
    
    public abstract void agregarCorista (Corista corista);
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
}
