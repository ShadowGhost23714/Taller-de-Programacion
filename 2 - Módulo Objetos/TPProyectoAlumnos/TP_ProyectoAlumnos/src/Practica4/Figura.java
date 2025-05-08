package Practica4;

public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    @Override
    public String toString(){
        String aux = "Área: " + this.calcularArea() + ", Perímetro: " + this.calcularPerimetro() + ", CR: "  + getColorRelleno() + ", CL: " + getColorLinea();             
        return aux;
    }
    
    public void despintarFigura () {
        setColorLinea("Negra");
        setColorRelleno("Blanco");
    }
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    
    public String getColorLinea(){
        return colorLinea;       
    }
    
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
}