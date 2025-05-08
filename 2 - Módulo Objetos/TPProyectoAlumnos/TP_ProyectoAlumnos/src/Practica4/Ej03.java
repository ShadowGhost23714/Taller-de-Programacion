/*

3-A- Implemente las clases para el siguiente problema. Una garita de seguridad quiere
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son
personas que se caracterizan además por la tarea realizada en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString siguiendo el formato:

▪ Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”

▪ Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy
jardinero.”


B- Realice un programa que instancie una persona y un trabajador y muestre la
representación de cada uno en consola.

NOTA: Reutilice la clase Persona (carpeta tema2).

 */
package Practica4;

import PaqueteLectura.Lector;

public class Ej03 {

    public static void main(String[] args) {
        
        Persona persona = new Persona();
        persona.setNombre(Lector.leerString());
        persona.setDNI(Lector.leerInt());
        persona.setEdad(Lector.leerInt());
        System.out.println(persona.toString());
        
        Trabajador trabajador = new Trabajador();
        trabajador.setNombre(Lector.leerString());
        trabajador.setDNI(Lector.leerInt());
        trabajador.setEdad(Lector.leerInt());
        trabajador.setTrabajo(Lector.leerString());
        System.out.println(trabajador.toString());
    }
}