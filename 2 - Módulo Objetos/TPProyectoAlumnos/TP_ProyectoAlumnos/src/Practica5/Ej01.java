/*

1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto tiene:
nombre, código, nombre completo del director y los investigadores que participan en el
proyecto (50 como máximo). De cada investigador se tiene: nombre completo, categoría (1
a 5) y especialidad. Además, cualquier investigador puede pedir hasta un máximo de 5
subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue otorgado o no.


i) Implemente el modelo de clases teniendo en cuenta:
    
    a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
    director.

    b. Un investigador sólo debería poder construirse con nombre, categoría y
    especialidad.

    c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
    Un subsidio siempre se crea en estado no-otorgado.


ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
    
    a. void agregarInvestigador(Investigador unInvestigador);
    // agregar un investigador al proyecto.

    b. void agregarSubsidio(Subsidio unSubsidio);
    // agregar un subsidio al investigador.

    c. double dineroTotalOtorgado();
    //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
    todos los subsidios otorgados de todos los investigadores)

    d. void otorgarTodos(String nombre_completo);
    //otorgar todos los subsidios no-otorgados del investigador llamado
    nombre_completo

    e. String toString();
    // devolver un string con: nombre del proyecto, código, nombre del director, el
    total de dinero otorgado del proyecto y la siguiente información de cada
    investigador: nombre, categoría, especialidad, y el total de dinero de sus
    subsidios otorgados.


iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla.

 */
package Practica5;

public class Ej01 {

    public static void main(String[] args) {
        Proyecto proyecto = new Proyecto("Proyecto A", "Dr. Director", 1234);

        Investigador investigador1 = new Investigador("Juan Perez", "Biología", 3);
        Investigador investigador2 = new Investigador("Ana Gomez", "Química", 4);
        Investigador investigador3 = new Investigador("Carlos Martinez", "Física", 2);

        Subsidio subsidio1 = new Subsidio(10000, "Investigación en Biología");
        Subsidio subsidio2 = new Subsidio(15000, "Equipo de Laboratorio");
        investigador1.agregarSubsidio(subsidio1);
        investigador1.agregarSubsidio(subsidio2);

        Subsidio subsidio3 = new Subsidio(20000, "Investigación en Química");
        Subsidio subsidio4 = new Subsidio(25000, "Compra de Materiales");
        investigador2.agregarSubsidio(subsidio3);
        investigador2.agregarSubsidio(subsidio4);

        Subsidio subsidio5 = new Subsidio(30000, "Investigación en Física");
        Subsidio subsidio6 = new Subsidio(35000, "Compra de Equipos");
        investigador3.agregarSubsidio(subsidio5);
        investigador3.agregarSubsidio(subsidio6);

        proyecto.agregarInvestigador(investigador1);
        proyecto.agregarInvestigador(investigador2);
        proyecto.agregarInvestigador(investigador3);

        proyecto.otorgarTodos("Ana Gomez");

        System.out.println(proyecto.toString());
    }
}