package parcial02;

public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada;
    
    public Butaca (int i, int j) {
        this.setDescriptor("Butaca " + (i+1) + "-" + (j+1));
        this.setPrecio(800 + 100 * i);
        this.setOcupada(false);
    }

    @Override
    public String toString() {
        String aux = this.getDescriptor() + ", $" + this.getPrecio();
        if (this.isOcupada())
            aux = aux + ", ocupada";
        else
            aux = aux + ", libre";
        return aux;
    }
    
    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
}