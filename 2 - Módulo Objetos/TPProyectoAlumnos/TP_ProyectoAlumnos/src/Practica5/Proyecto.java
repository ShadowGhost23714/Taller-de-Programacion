package Practica5;

public class Proyecto {
    private String nombreProyecto, director;
    private int codigo, i, dl = 0;
    private Investigador [] vector = new Investigador [50];
    
    public void agregarInvestigador (Investigador investigador) {
        if (dl < 50) {
            vector[dl] = investigador;
            dl++;
        }
        else
            System.out.println("El proyecto está lelno de investigadores.");
    }
    
    public double dineroTotalOtorgado () {
        double total = 0;
        for (i = 0; i < dl; i++) {
            total = total + vector[i].dineroOtorgado();
        }
        return total;
    }
    
    public void otorgarTodos (String nombre) {
        for (i = 0; i < dl; i++) {
            if (vector[i].getNombreInvest().equals(nombre))
                vector[i].otorgar();
        }
    }

    public Proyecto(String nombreProyecto, String director, int codigo) {
        this.nombreProyecto = nombreProyecto;
        this.director = director;
        this.codigo = codigo;
    }

    @Override
    public String toString() {
        String aux = "Proyecto " + nombreProyecto + ", director " + director + ", código " + codigo + ", Investigadores: \n";
        for (i = 0; i < dl; i++)
            aux = aux + vector[i].toString() + "\n";
        return aux;
    }
    
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
}