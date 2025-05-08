package Practica5;

public class Investigador {
    private String nombreInvest, especialidad;
    private int categoria, i, dl = 0;
    private Subsidio [] vector = new Subsidio [5];
    
    public void otorgar () {
        for (i = dl; i < 5; i++) {
            Subsidio subsidio = new Subsidio (15000, "Otorgar todos");
            this.agregarSubsidio(subsidio);
        }
    }
    
    public void agregarSubsidio (Subsidio subsidio) {
        if (dl < 5) {
            vector[dl] = subsidio;
            dl++;
        }
        else
            System.out.println("Ya no se pueden agregar más subsidios.");
    }
    
    public double dineroOtorgado () {
        double total = 0;
        for (i = 0; i < dl; i++) {
            total = total + vector[i].getMonto();
        }
        return total;
    }

    public Investigador(String nombreInvest, String especialidad, int categoria) {
        this.nombreInvest = nombreInvest;
        this.especialidad = especialidad;
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        String aux = " Investigador " + nombreInvest + ", especialidad " + especialidad + ", categoria " + categoria + ", dinero otorgado: $" + dineroOtorgado();        
        return aux;
    }
    
    public String getNombreInvest() {
        return nombreInvest;
    }

    public void setNombreInvest(String nombreInvest) {
        this.nombreInvest = nombreInvest;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    
    
}