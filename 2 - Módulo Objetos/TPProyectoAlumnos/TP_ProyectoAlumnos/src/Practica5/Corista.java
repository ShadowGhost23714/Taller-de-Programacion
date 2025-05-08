/*

De los coristas se conoce el nombre, DNI, edad y el tono fundamental (un número entero).

 */
package Practica5;

public class Corista extends Persona{
    private int tono;

    public Corista(String nombre, int dni, int edad, int tono) {
        super(nombre, dni, edad);
        this.tono = tono;
    }

    @Override
    public String toString() {
        String aux = super.toString() + ", tono " + this.getTono();
        return aux;
    }
    
    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
}