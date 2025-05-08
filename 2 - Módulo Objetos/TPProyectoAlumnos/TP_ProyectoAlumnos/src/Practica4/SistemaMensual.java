package Practica4;

public class SistemaMensual extends Sistema {
    private String [] meses = {
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};

    public SistemaMensual(String nombre, int latitud, int longitud, int N, int A) {
        super(nombre, latitud, longitud, N, A);
    }
    
    public String reporteMensual () {
        double prom, total;
        String aux = getNombre() + " (" + getLatitud() + " S " + getLongitud() + "): \n";
        for (int j = 0; j < 12; j++) {
            total = 0;
            for (int i = 0; i < getN(); i++)
                total = total + obtenerTemperatura(i, j);
            prom = total / getN();
            aux = aux + "- " + meses[j] + ": " + String.format("%.2f", prom)  + "°C \n";
        }
        return aux;
    }
}