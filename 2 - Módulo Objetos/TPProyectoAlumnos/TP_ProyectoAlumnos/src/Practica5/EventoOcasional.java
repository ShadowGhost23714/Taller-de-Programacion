/*

iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:

● Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“
seguido del nombre del contratante.

● Si es un show de TV se imprime “Saludos amigos televidentes”

● Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del
nombre del contratante.
Independientemente del motivo del evento, luego se imprime el listado de temas como
lo hace cualquier recital.

*/
package Practica5;

public class EventoOcasional extends Recital {
    private String motivo;
    private String nombreContratante;
    private int dia;
    
    public double calcularCosto () {
        double costo;
        if (getMotivo().equals("Show de beneficiencia"))
            costo = 0;
        else
            if (getMotivo().equals("Show de TV"))
                costo = 50000;
            else
                costo = 150000;
        return costo;
    }
    
    public String actuarEventoOcasional () {
        String aux;
        if (getMotivo().equals("Show de beneficiencia"))
            aux = "Recuerden colaborar con " + getNombreContratante() + "\n";
        else
            if (getMotivo().equals("Show de TV"))
                aux = "Saludos amigos televidentes \n";
            else
                aux = "Un feliz cumpleaños para " + getNombreContratante() + "\n";
        aux = aux + super.actuarRecital();
        return aux;
    }
    
    public EventoOcasional(String motivo, String nombreContratante, int dia, String nombreBanda, int N) {
        super(nombreBanda, N);
        this.setMotivo(motivo);
        this.setNombreContratante(nombreContratante);
        this.setDia(dia);
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
}