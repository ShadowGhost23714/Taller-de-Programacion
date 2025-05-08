package parcial01;


public class Empresa {
    private String nombreEmpresa;
    private String direccion;
    private Director director;
    private Encargado [] sucursales;
    private int df;
    private int dl = 0;

    public void agregarEncargado (Encargado encargado) {
        if (dl < df) {
            sucursales [dl] = encargado;
            dl++;
        }
    }
    
    public Empresa(String nombreEmpresa, String direccion, Director director, int N) {
        this.nombreEmpresa = nombreEmpresa;
        this.direccion = direccion;
        this.director = director;
        this.df = N;
        sucursales = new Encargado [df];
    }

    @Override
    public String toString() {
        String aux = this.getNombreEmpresa() + ", Dirección " + getDireccion() + ". \nDirector: " + this.director.toString() + "\n";
        for (int i = 0; i < dl; i++)
            aux = aux + "Surcursal " + (i+1) + ", Encargado: " + sucursales[i].toString() + "\n";
        return aux;
    }
    
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
}