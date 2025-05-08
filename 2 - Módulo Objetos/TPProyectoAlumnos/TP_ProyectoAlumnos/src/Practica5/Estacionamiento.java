package Practica5;

public class Estacionamiento {
    private String nombreEsta, direccion;
    private int apertura, cierre;
    private Auto [][] matriz;
    private int piso, plaza;
    
    public int autosDeUnaPlaza (int plaza) {
        int cant = 0;
        for (int i = 0; i < piso; i++) {
            if (this.matriz[i][plaza-1] != null)
                cant++;
        }
        return cant;
    }
    
    public String existeAuto (int patente) {
        String aux = "Auto Inexistente";
        for (int i = 0; i < piso; i++) {
            for (int j = 0; j < plaza; j++)
                if ((this.matriz[i][j] != null) && (this.matriz[i][j].getPatente() == patente)) 
                    aux = "El auto está en el estaconamiento, en el piso " + (i+1) + " y en la plaza " + (j+1);
        }
        return aux;
    }
    
    public void ingresarAuto (Auto auto, int piso, int plaza) {
        matriz [piso-1][plaza-1] = auto;
    }
    
    public Estacionamiento(String nombreEsta, String direccion) {
        this.nombreEsta = nombreEsta;
        this.direccion = direccion;
        this.apertura = 8;
        this.cierre = 21;
        this.piso = 5;
        this.plaza = 10;
        matriz = new Auto [5][10];
    }
    
    public Estacionamiento(String nombreEsta, String direccion, int apertura, int cierre, int piso, int plaza) {
        this.nombreEsta = nombreEsta;
        this.direccion = direccion;
        this.apertura = apertura;
        this.cierre = cierre;
        this.piso = piso;
        this.plaza = plaza;
        matriz = new Auto [piso][plaza];
    }

    @Override
    public String toString() {
        String aux = "Estacionamiento " + this.nombreEsta + ": \n";
        for (int i = 0; i < piso; i++) {
            for (int j = 0; j < plaza; j++) {
                if (matriz[i][j] == null)
                    aux = aux + "Piso " + (i+1) + ", Plaza " + (j+1) + ": Libre \n"; 
                else
                    aux = aux + "Piso " + (i+1) + ", Plaza " + (j+1) + ":" + matriz[i][j].toString() + " \n";
            }
        }
        return aux;
    }
    
    public String getNombreEsta() {
        return nombreEsta;
    }

    public void setNombreEsta(String nombreEsta) {
        this.nombreEsta = nombreEsta;
    }

    public int getApertura() {
        return apertura;
    }

    public void setApertura(int apertura) {
        this.apertura = apertura;
    }

    public int getCierre() {
        return cierre;
    }

    public void setCierre(int cierre) {
        this.cierre = cierre;
    }
}