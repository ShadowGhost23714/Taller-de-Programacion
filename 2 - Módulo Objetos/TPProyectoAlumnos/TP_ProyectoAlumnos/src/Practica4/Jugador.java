package Practica4;

public class Jugador extends Empleado {
    private int partidos, goles;
    
    public Jugador(int partidos, int goles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        setPartidos(partidos);
        setGoles(goles);
    }
    
    @Override
    public String toString() {
        String aux; 
        aux = super.toString() + ", sueldo a cobrar: $" + calcularSueldoACobrar() + ", goles por partido: " + calcularEfectividad();
        return aux;
    }
    
    public double calcularEfectividad (){
        return (double) this.getGoles() / this.getPartidos();
    }
    
    public double calcularSueldoACobrar () {
        if (calcularEfectividad() > 0.5)
            return getSueldo() * 2 + (getSueldo() * 0.10) * getAntiguedad();
        else
            return getSueldo() + (getSueldo() * 0.10) * getAntiguedad();
    }
    
    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
}