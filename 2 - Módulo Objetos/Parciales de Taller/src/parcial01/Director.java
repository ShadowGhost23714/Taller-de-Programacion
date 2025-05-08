package parcial01;

public class Director extends Empleado {
    private double montoViaticos;

    public double sueldoACobrar () {
        double total = getSueldoBasico() + getMontoViaticos();
        if (getAñoIngreso() - 2024 < 20)
            total = total + getSueldoBasico() * 0.1;
        return total;
    }
    
    public Director(String nombre, int dni, int añoIngreso, double sueldoBasico, double montoViaticos) {
        super(nombre, dni, añoIngreso, sueldoBasico);
        this.montoViaticos = montoViaticos;
    }

    @Override
    public String toString() {
        String aux = super.toString() + ", sueldo a cobrar $" + this.sueldoACobrar();
        return aux;
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }

    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
}