/*Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
*/
package Practica3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 * @author ajmd0
 */
public class Ej04 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        System.out.println("Ingrese la cantidad de habitaciones");
        int num = Lector.leerInt();
        System.out.println();
        Hotel hotel = new Hotel(num);
        Cliente cli;
        
        hotel.representacionHotel();
        System.out.println();
        
        for (int i = 0; i < num; i++) {
            cli = new Cliente();
            cli.setNombre(GeneradorAleatorio.generarString(8));
            cli.setEdad(GeneradorAleatorio.generarInt(83) + 18);
            cli.setDni(GeneradorAleatorio.generarInt(30000000) + 18000000);
            hotel.ingresarHabitacion(GeneradorAleatorio.generarInt(num), cli);
        }
        
        System.out.println("Ingrese un valor para aumentar el costo de las habitaciones.");
        double valor = Lector.leerDouble();
        System.out.println();
        hotel.aumentoMonto(valor);
        
        hotel.representacionHotel();
    }
}