package Practica4;

public class SistemaAnual extends Sistema {
    
    public SistemaAnual(String nombre, int latitud, int longitud, int N, int A) {
        super(nombre, latitud, longitud, N, A);
    }
    
    public String reporteAnual () {
        double prom, total;
        String aux = getNombre() + " (" + getLatitud() + " S " + getLongitud() + "): \n";
        for (int i = 0; i < getN() ; i++) {
            total = 0;
            for (int j = 0; j < 12; j++)
                total = total + obtenerTemperatura(i, j);
            prom = (double) total / 12;
            aux = aux + "- Año " + (i+getA()) + ": " + prom  + "°C \n";
        }
        return aux;
    }
}