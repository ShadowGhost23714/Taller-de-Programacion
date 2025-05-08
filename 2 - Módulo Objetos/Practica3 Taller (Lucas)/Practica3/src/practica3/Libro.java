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
public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     

    public Libro(String titulo, Autor primerAutor, String editorial, int añoEdicion, String ISBN, double precio) {
        this.titulo = titulo;
        this.primerAutor = primerAutor;
        this.editorial = editorial;
        this.añoEdicion = añoEdicion;
        this.ISBN = ISBN;
        this.precio = precio;
    }

    public Libro(  String unTitulo,  String unaEditorial, Autor unPrimerAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
        
    }
    
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
    
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.toString() + "editorial" + editorial + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}

