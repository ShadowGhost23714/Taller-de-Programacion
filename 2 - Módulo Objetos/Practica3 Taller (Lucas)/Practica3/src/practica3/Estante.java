/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author Lucas
 */
public class Estante {
    Libro vector[];
    int dimF = 20;
    
    public Estante() {
        vector = new Libro[dimF];
        for (int i=0; i<dimF; i++)
            vector[i] = null;
    }
    
    public Estante(int n) {
        dimF = n;
        vector = new Libro[dimF];
        for (int i=0; i<dimF; i++)
            vector[i] = null;
    }    
    
    
    public int contarLibros(){
        int aux = 0, i = 0;
        boolean ok = false;
        while ((i < dimF)&&(ok == false)){
            if(vector[i] == null)
                ok =true;
            else{
                aux++;
                i++;
            }    
        }
        return aux;
    }
    
    public String espacioEstanteria(){
        int i = 0;
        boolean ok = false;
        String aux; 
        while((i < dimF)&&(ok == false)){
            if(vector[i] == null)
                ok = true;
            else
                i++;
        }
        if(ok == false)
            aux = "La estanteria esta llena";
        else
            aux = "La estanteria todavia tiene espacio";
        return aux;
    }
    
    public boolean buscarTitulo(String unTitulo, int dimL){
        boolean ok =  false;
        int i= 0;
        while((i< dimL) && (ok == false)){
            if(vector[i].getTitulo().equals(unTitulo) )
                ok = true;
            else
               i++; 
        }
        return ok;
    }
    
    public void agregarLibro(Libro li){
        boolean ok = false;
        int i;
        i = 0;
        while ((i < dimF)&&(ok == false)){
            if(vector[i] == null){
                vector[i]=li;
                ok=true;
            }
            else
                i++;
        }
        /*if(ok == false)
            System.out.println("La estanteria esta llena ");*/
    }

}
