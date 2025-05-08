/*

ii. La gira debe saber responder a los mensajes:

● agregarFecha que recibe una “fecha” y la agrega adecuadamente.

● La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego
debe imprimir el listado de temas como lo hace cualquier recital. Además debe
establecer la siguiente fecha de la gira como la nueva “actual”.

*/
package Practica5;

public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] fechas;
    private int actual;
    private int A;
    private int dl = 0;
    
    public double calcularCosto () {
        double costo = 30000 * dl; 
        return costo;
    }
    
    public String actuarGira () {
        String aux = "Buenas noches " + fechas[actual].getNombreCiudad() + "\n";
        aux = aux + super.actuarRecital();
        return aux;
    }
    
    public void agregarFecha (Fecha fecha) {
        if (dl < A) {
            fechas[dl] = fecha;
            dl++;
        }
    }
    
    public Gira(String nombreGira, String nombreBanda, int N, int A) {
        super(nombreBanda, N);
        this.nombreGira = nombreGira;
        this.setActual(0);
        this.setA(A);
        fechas = new Fecha [A];
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }

    public int getA() {
        return A;
    }

    public void setA(int A) {
        this.A = A;
    }
}