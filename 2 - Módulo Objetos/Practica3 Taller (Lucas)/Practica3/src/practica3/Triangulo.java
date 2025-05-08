/*
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
 */
package practica3;


public class Triangulo {
    private double lado1,lado2,lado3;
    private String color,colorLinea;


        
    public double getLado1() {
        return lado1;
    }
    
    public Triangulo() {
            
    }

    public Triangulo(double lado1, double lado2, double lado3, String color, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.color = color;
        this.colorLinea = colorLinea;
    }
    
    public void leerLados(double lado1, double lado2, double lado3){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;       
    }
    
    public void leerColores(String color, String colorLinea){
        this.color = color;
        this.colorLinea = colorLinea;        
    }
    
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(){
        double s;
        s = (this.lado1 + this.lado2 + this.lado3)/2.0;
        return s;
    }
    
    public double calcularArea(){
        double aux,s;
        s = calcularPerimetro();
        aux = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return aux;   
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        String aux;
        aux =  "El triangulo que genero :  Lado1 " +this.lado1 + ", Lado2 " + this.lado2 
                + ", Lado3 "+ this.lado3 + " con un area de " + calcularArea() + " Y un perimetro " + calcularPerimetro()
                + " color de relleno: " + this.color + " | color de linea: " + this.colorLinea;
        return (aux);
    }   

}
