/*

Coro semicircular, en el que los coristas se colocan en el escenario uno al lado del otro.

En el coro semicircular los coristas se deben ir agregando de izquierda a derecha.

En el caso del coro semicircular, de izquierda a derecha los coristas están ordenados de mayor a menor en cuanto a tono fundamental.

 */
package Practica5;

public class Semicircular extends Coro {
    private Corista [] formacion;
    private int dl = 0;
    
    public boolean estaBienFormado () {
        boolean cumple = true;
        int i = 1;
        int min = formacion[0].getTono();;
        while ((i < dl) && (cumple)){
            if (formacion[i].getTono() < min)
                min = formacion[i].getTono();
            else
                cumple = false;
            i++;
        }
        return cumple;
    }
    
    public boolean estaLleno () {
        return (dl == 10);
    }
    
    public void agregarCorista (Corista corista) {
        if (dl < 10) {
            formacion[dl] = corista;
            dl++;
        }
    }

    public Semicircular(String nombre, Director director, int cantCoristas) {
        super(nombre, director, cantCoristas);
        this.formacion = new Corista [cantCoristas];
    }

    @Override
    public String toString() {
        String aux = "Coro semicircular " + super.toString() + ", coristas : \n";
        for (int i = 0; i < dl; i++) {
            aux = aux + formacion[i].toString() + " \n";
        }
        return aux;
    }
}