/*

EstaciónMeteorológica
-------------------------
- nombre: String
- latitud: double
- longitud: double
- temperaturas: double[][]
-------------------------
+ registrarTemperatura(año: int, mes: int, temp: double): void
+ obtenerTemperatura(año: int, mes: int): double
+ obtenerMayorTemperatura(): String
+ reporteAnual(): String
+ reporteMensual(): String

*/
package Practica4;

public class Sistema extends Estacion {
    private double [][] temperaturas;
    private int i, j, N, A;
    private String [] meses = {
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
    
    public void registrarTemperatura (int año, int mes, double temp) {
        temperaturas[año][mes] = temp;
    }
    
    public double obtenerTemperatura (int año, int mes) {
        return temperaturas[año][mes];
    }
    
    public String obtenerMayotTemp () {
        double max = -1;
        int año = 0;
        String mes = "Ninguno";
        for (i = 0; i < N; i++) {
            for (j = 0; j < 12; j++) {
                if (temperaturas[i][j] > max) {
                    max = temperaturas [i][j];
                    año = i+A;
                    mes = meses[j];
                }
            }
        }
        String aux = "La mayor temperatura fue de " + String.format("%.2f", max) + "°C, en el año " + año + " y en el mes de " + mes;
        return aux;
    }

    public Sistema(String nombre, int latitud, int longitud, int N, int A) {
        super(nombre, latitud, longitud);
        this.setN(N);
        this.setA(A);
        temperaturas = new double [N][12];
        for (i = 0; i < N; i++)
            for (j = 0; j < 12; j++)
                temperaturas[i][j] = 99;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public int getA() {
        return A;
    }

    public void setA(int A) {
        this.A = A;
    }
}