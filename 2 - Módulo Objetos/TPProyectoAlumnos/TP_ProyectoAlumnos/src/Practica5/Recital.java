/*

i. Cualquier recital debe saber responder a los mensajes:

● agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas.

● actuar que imprime (por consola) para cada tema la leyenda “y ahora
tocaremos…” seguido por el nombre del tema.

iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.

*/
package Practica5;

public abstract class Recital {
    private String nombreBanda;
    private String [] lista;
    private int N;
    private int dl = 0;
    
    public abstract double calcularCosto ();
    
    public String actuarRecital () {
        String aux = "Y ahora tocaremos: \n";
        for (int i = 0; i < dl; i++) {
            aux = aux + lista[i] + "\n";
        }
        return aux;
    }
    
    public void agregarTema (String tema) {
        if (dl < N) {
            lista[dl] = tema;
            dl++;
        }
    }    
    
    public Recital(String nombreBanda, int N) {
        this.setNombreBanda(nombreBanda);
        this.setN(N);
        lista = new String [N];
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }
}