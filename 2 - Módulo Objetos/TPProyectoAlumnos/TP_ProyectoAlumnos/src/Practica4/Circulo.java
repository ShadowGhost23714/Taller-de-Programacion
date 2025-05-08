package Practica4;

public class Circulo extends Figura{
    private double radio;    

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        setRadio(radio);
    }

    public String toString() {
        String aux = super.toString() +", radio: " + getRadio();
        return aux;
    }
    
    public double calcularPerimetro () {
        return 2*Math.PI*this.getRadio();
    }
    
    public double calcularArea () {
        return Math.PI*Math.sqrt(radio);
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
}