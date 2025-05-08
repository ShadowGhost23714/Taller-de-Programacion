package Practica4;

public class Trabajador extends Persona {
    private String trabajo;

    public Trabajador(String trabajo, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.setTrabajo(trabajo);
    }
    
    public Trabajador () {
        
    }
    
    @Override
    public String toString() {
        String aux = super.toString() + " Soy " + this.getTrabajo() + ".";
        return aux;
    }
    
    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
}