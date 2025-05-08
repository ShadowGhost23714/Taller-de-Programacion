/*
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }

- Calcular e informar la cantidad de partidos que ganó River.

- Calcular e informar el total de goles que realizó Boca jugando de local.
package tema2;
*/
package Practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 * @author ajmd0
 */
public class Ej05 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int i, dl = 0, df = 20;
        Partido [] vector = new Partido [df];
        Partido dato = new Partido();
        
        System.out.println ("Ingrese nombre del equipo visitante, su cantidad de goles, nombre del equipo local y su cantidad de goles.");
        dato.setVisitante (Lector.leerString());
        while ((!dato.getVisitante().equals("zzz")) && (dl<df)){
            dato.setGolesVisitante (GeneradorAleatorio.generarInt(7));
            dato.setLocal (Lector.leerString());
            dato.setGolesLocal(GeneradorAleatorio.generarInt(7));
            vector [dl] = dato;
            dl++;
            dato = new Partido();
            System.out.println();
            System.out.println ("Ingrese los datos.");
            dato.setVisitante (Lector.leerString());
        }
        
        System.out.println();
        
        int cantriver = 0, cantboca = 0;
        for (i=0;i<dl;i++){
            System.out.println (vector[i].getLocal()+" - "+vector[i].getGolesLocal()+" VS "+vector[i].getGolesVisitante()+" - "+vector[i].getVisitante());
            System.out.println();
            if (vector[i].getGanador().equals("River Plate"))
                cantriver++;
            if (vector[i].getLocal().equals("Boca Juniors"))
                cantboca++;
        }
        System.out.println ("La cantidad de partidos que ganó River Plate fue de "+cantriver);
        System.out.println ("La cantidad de partidos que Boca Juniors jugó como local fue de  "+cantboca);
    }
}
