package Practica5;

public class Auto {
    private String nombreDueño;
    private int patente;

    public Auto(String nombreDueño, int patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }

    @Override
    public String toString() {
        return " Nombre del dueño: " + nombreDueño + ", patente: " + patente;
    }
    
    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }
}