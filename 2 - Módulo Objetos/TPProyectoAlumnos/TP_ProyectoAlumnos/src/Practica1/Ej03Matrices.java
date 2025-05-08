/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int [5][5];
        int i,j;
        for (i=0;i<5;i++)
            for (j=0;j<5;j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0;i<5;i++){
            System.out.println("------");
            for (j=0;j<5;j++)
                System.out.println("("+i+"/"+j+") = "+matriz[i][j]);
        }       
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int cant = 0;
        for (j=0;j<5;j++)
            cant = cant + matriz[1][j];
        System.out.println("La suma total de los elementos en la fila 1 de la matriz es "+cant);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vector = new int [5];
        for (i=0;i<5;vector[i++]=0);
        for (i=0;i<5;i++)
            for (j=0;j<5;j++)
                vector[i] = vector[i] + matriz[i][j];
        for (i=0;i<5;System.out.println(vector[i++]));
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int valor = Lector.leerInt();
        boolean noEncontrado = true;
        for (i=0;i<5;i++)
            for (j=0;j<5;j++)
                if (matriz[i][j] == valor){
                    noEncontrado = false;
                    System.out.println("El valor ingresado se encontró en la fila "+i+" y en la columna "+j);
                }
        if (noEncontrado)
            System.out.println("El valor ingresado no se encuentra en la matriz.");
    }
}
