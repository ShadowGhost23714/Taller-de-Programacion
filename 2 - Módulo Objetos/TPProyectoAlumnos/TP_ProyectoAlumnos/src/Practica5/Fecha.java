package Practica5;

public class Fecha {
    private int dia;
    private String nombreCiudad;

    public Fecha(int dia, String nombreCiudad) {
        this.dia = dia;
        this.nombreCiudad = nombreCiudad;
    }
    
    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }
}