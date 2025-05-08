package Practica3;
/**
 * @author ajmd0
 */
public class Hotel {
    private int df;
    private int i;
    private Habitacion [] vector;

    public Hotel (int n) {
        df = n;
        vector = new Habitacion [df];
        for (i = 0; i < df; i++){
            vector [i] = new Habitacion();
            vector [i].setCliente(null);
            vector [i].setOcupada(false);
        }
    }
    
    public void ingresarHabitacion (int pos, Cliente cliente) {
        if ((pos < df) && (vector[pos].getCliente() == null)){
            vector[pos].setCliente(cliente);
            vector[pos].setOcupada(true);
        }
    }
    
    public void aumentoMonto (double aumento) {
        for (i = 0; i < df; i++)
            vector[i].setCosto(aumento+vector[i].getCosto());
    }
    
    public void representacionHotel () {
        for (i = 0; i < df; i++) {
            if (vector[i].getOcupada())
                System.out.println("Habitación "+(i+1)+": $"+vector[i].getCosto()+", "+vector[i].Consulta()+", "+vector[i].getCliente().toString());
            else
                System.out.println("Habitación "+(i+1)+": $"+vector[i].getCosto()+", "+vector[i].Consulta());
        }
    }
}