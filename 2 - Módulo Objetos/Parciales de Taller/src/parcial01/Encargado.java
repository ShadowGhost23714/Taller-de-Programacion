package parcial01;

public class Encargado extends Empleado {
    private int cantEmpleados;

    public double sueldoACobrar () {
        double total = getSueldoBasico() + 1000 * getCantEmpleados();
        if (getAñoIngreso() - 2024 < 20)
            total = total + getSueldoBasico() * 0.1;
        return total;
    }
    
    public Encargado(String nombre, int dni, int añoIngreso, double sueldoBasico, int cantEmpleados) {
        super(nombre, dni, añoIngreso, sueldoBasico);
        this.cantEmpleados = cantEmpleados;
    }

    @Override
    public String toString() {
        String aux = super.toString() + ", sueldo a cobrar $" + this.sueldoACobrar();
        return aux;
    }
    
    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
}