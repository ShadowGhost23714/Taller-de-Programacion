package Practica3;

/*
 * @author ajmd0
 */
public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double getPerimetro () {
        return 2*Math.PI*this.getRadio();
    }
    
    public double getArea () {
        return Math.PI*Math.sqrt(radio);
    }
}