package Practica3;
import PaqueteLectura.GeneradorAleatorio;
/*
 * @author ajmd0
 */
public class Habitacion {
    private double costo = GeneradorAleatorio.generarDouble(6001) + 2000;
    private Boolean ocupada;
    private Cliente cliente;    

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Boolean getOcupada() {
        return ocupada;
    }

    public void setOcupada(Boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public String Consulta (){
        String aux;
        if (this.ocupada == false)
            aux = "libre";
        else
            aux = "ocupada";
        return aux;
    }
}
