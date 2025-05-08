/*

Del director se conoce el nombre, DNI, edad y la antigüedad (un número entero).

 */
package Practica5;

public class Director extends Persona{
    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        String aux = super.toString() + ", antigüedad " + this.getAntiguedad() + " años ";
        return aux;
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
}