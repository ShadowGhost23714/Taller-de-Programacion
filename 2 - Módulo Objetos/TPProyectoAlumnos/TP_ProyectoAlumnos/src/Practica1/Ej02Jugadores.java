
package Practica1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int df = 16;
        double [] vector = new double [df];
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        double prom = 0;
        int cant = 0;
        int i;
        double altura;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0;i<df;i++){
            altura = GeneradorAleatorio.generarDouble(2);
            vector[i] = altura;
            prom = prom + altura;
            cant++;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = prom / cant;
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cant = 0;
        for (i=0;i<df;i++){
            if (vector[i] > prom)
                cant++;
        }
        //Paso 9: Informar la cantidad.
        System.out.println ("La cantidad es "+cant);
    }
    
}
