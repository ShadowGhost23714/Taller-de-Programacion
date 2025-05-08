package Practica4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad; 
    
    public Empleado(String nombre, double sueldo, int antiguedad){
        setNombre(nombre);
        setSueldo(sueldo);
        setAntiguedad(antiguedad); 
    }
    
    @Override
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre;
        return aux;
    }
    
    public abstract double calcularEfectividad ();
    public abstract double calcularSueldoACobrar();
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
}