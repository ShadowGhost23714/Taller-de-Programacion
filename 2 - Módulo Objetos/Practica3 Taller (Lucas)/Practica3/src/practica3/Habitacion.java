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
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    Cliente cli,cliReserva;
    boolean estado;
    double precio = GeneradorAleatorio.generarDouble(6001) + 2000;
 
    public Habitacion(){

    }

    @Override
    public String toString() {
        String aux = " Habitacion " + " cli= " + cli.toString() + 
                       ", precio= " + precio;
        if(!estado )
            aux += ", estado= ocupado ";
        else
            aux+= ", estado= Disponible ";
        if(cliReserva != null)
            aux +=" Reservado por " + cliReserva;
        return aux;
    }    
    
    
    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }

    public Cliente getCliReserva() {
        return cliReserva;
    }

    public void setCliReserva(Cliente cliReserva) {
        this.cliReserva = cliReserva;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    } 
    
}
