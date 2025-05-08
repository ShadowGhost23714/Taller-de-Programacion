package Practica4;

public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        setCampeonatos(campeonatos);
    }
    
    @Override
    public String toString() {
        String aux = super.toString() + ", sueldo a cobrar: $"  + calcularSueldoACobrar() + ", campeonatos ganados por año de antigüedad: "+ calcularEfectividad();
        return aux;
    }
    
    public double calcularEfectividad () {
        return (double) getCampeonatos() / getAntiguedad();
    }
    
    public double calcularSueldoACobrar () {
        double num = getCampeonatos(), total = getSueldo() + (getSueldo() * 0.10) * getAntiguedad();
        if (num > 0 ){
            total = total + 5000;
            if (num > 4){
                total = total + 30000;
                if (num > 10)
                    total = total + 50000;
            }
        }
        return total;
    }
    
    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
}