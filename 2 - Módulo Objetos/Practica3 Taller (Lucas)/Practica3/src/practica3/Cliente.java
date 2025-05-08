/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author Lucas
 */
public class Cliente {
    String nombre;
    int dni,edad;

    public Cliente() {
    }
    
    @Override
    public String toString() {
        String aux= "Datos del clientes: Nombre " + nombre + 
                    ", DNI " + dni + ", Edad " + edad ;
        return aux;
    }    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
     
}
