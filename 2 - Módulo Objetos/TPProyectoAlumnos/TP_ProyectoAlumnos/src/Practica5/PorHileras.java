/*

Coro por hileras, donde los coristas se organizan en filas de igual dimensión.

En el coro por hileras los coristas se deben ir agregando de izquierda a derecha, completando la hilera antes de pasar a la siguiente.

En el caso del coro por hileras, todos los miembros de una misma hilera
tienen el mismo tono fundamental y además todos los primeros
miembros de cada hilera están ordenados de mayor a menor en cuanto a tono fundamental.

 */
package Practica5;

public class PorHileras extends Coro{
    private Corista [][] formacion;
    private int [] dl;
    private int cantColumnas;
    private int cantFilas;
    private int coluAux = 0;
    
    public boolean estaBienFormado() {
        boolean cumple = true;
        int i = 0;
        int j;
        int igual;
        int min = 999;
        while ((i < cantFilas) && cumple) {
            j = 0;
            igual = formacion [i][j].getTono();
            if (igual < min){
                min = igual;
                while ((j < dl[i]) && cumple) {
                    if (formacion [i][j].getTono() != igual)
                        cumple = false;
                    j++;
                }
            }
            else
                cumple = false;
        i++;
        }
        return cumple;
    }
    
    public boolean estaLleno () { 
        return (dl[3] == 4);
    }
    
    public void agregarCorista (Corista corista) {
        if(!estaLleno()) {
            formacion[coluAux][dl[coluAux]] = corista;
            dl[coluAux]++;
            if (dl[coluAux] == this.cantColumnas) {
                coluAux++;
            }
        }
    }

    public PorHileras(String nombre, Director director, int cantCoristas, int filas, int columnas) {
        super(nombre, director, cantCoristas);
        this.cantColumnas = columnas;
        this.cantFilas = filas;
        this.formacion = new Corista [cantFilas][cantColumnas];
        this.dl = new int [cantCoristas];
        for (int i = 0; i < cantColumnas; i++) 
            dl[i] = 0;
    }
    
    @Override
    public String toString() {
        String aux = "Coro por hileras " + super.toString() + ", coristas : \n";
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < dl[i]; j++) {
                aux = aux + formacion[i][j].toString() + " \n";
            }
        }
        return aux;
    }
}