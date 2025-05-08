package parcial01;

public abstract class Empleado {
    private String nombre;
    private int dni;
    private int añoIngreso;
    private double sueldoBasico;

    public abstract double sueldoACobrar ();
     
    public Empleado(String nombre, int dni, int añoIngreso, double sueldoBasico) {
        this.nombre = nombre;
        this.dni = dni;
        this.añoIngreso = añoIngreso;
        this.sueldoBasico = sueldoBasico;
    }

    @Override
    public String toString() {
        String aux = this.getNombre() + ", DNI " + this.getDni();
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getAñoIngreso() {
        return añoIngreso;
    }

    public void setAñoIngreso(int añoIngreso) {
        this.añoIngreso = añoIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
}