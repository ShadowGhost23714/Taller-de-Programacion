package Practica3;

public class Estante {
    private Libro libros [];
    private int df = 20;
    private int i;
    
    public int cantidadDeLibros (){
        int cant = 0;
        for (i = 0; i < df; i++){
            if (this.libros[i] != null)
                cant++;
        }
        return cant;
    }
    
    public String estaLleno (){
        String aux;
        i = 0;
        while ((i < df) && (libros[i] != null))
            i++;
        if (i < df)
            aux = "Hay espacio para "+(df-i)+" libro(s).";
        else
            aux = "El estante está lleno.";
        return aux;
    }
    
    public boolean existeEseLibro (String titulo, int dl){
        for (i = 0; i < dl; i++) {
            if (this.libros[i].getTitulo().equals(titulo))
                return true;  
        }
        return false;
    }
    
    public void agregarLibro (Libro libro){
        i = 0;
        while ((i<df) && (libros[i] != null))
            i++;
        if (libros[i] == null)
            libros[i] = libro;
    }
    
    public Estante () {
        libros = new Libro[df];
        for (i = 0; i < df; i++) 
            libros[i] = null;
    }
    
    public Estante (int n){
        df = n;
        libros = new Libro[df];
        for (i = 0; i < df; i++) 
            libros[i] = null;
    }
}