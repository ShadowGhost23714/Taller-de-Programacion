/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

/**
 *
 * @author ajmd0
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }

    @Override
    public String toString() {
        String aux;
        aux = nombre+", oriundo de "+origen+", "+biografia;
        return aux;
    }
}
