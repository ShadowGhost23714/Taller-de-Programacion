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
public class Hotel {
    Habitacion vector[];
    int dimF;
    
    public Hotel(int n){
        dimF = n;
        vector = new Habitacion[dimF];
        for(int i=0; i<n; i++){
            vector[i] = new Habitacion();
            vector[i].setEstado(true); 
        }
    }
    
    
    public void insertarCliente(int pos, Cliente c){
        pos--;
        if((pos >= 0)&&(pos <= dimF)){
            if(vector[pos].getEstado()){
                vector[pos].setCli(c);
                vector[pos].setEstado(false);
            }
            else
                vector[pos].setCliReserva(c);
        }
    }
    
    public void informacionHotel(){
        for(int i=0; i< this.dimF; i++){
            System.out.println(vector[i].toString());
        }
    }
    
    
}
