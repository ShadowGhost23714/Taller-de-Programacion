/*
2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.

B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los libros
con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de los
libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */
package practica3;

/**
 *
 * @author Lucas
 */
public class Demo01ConstructoresLibro {

    public static void main(String[] args) {
        Autor a = new Autor();
        a.setNombre("Mcgraw-Hill");
        a.setBiografia(" sin biografia ");
        a.setOrigen(" Londres ");
        Libro libro1= new  Libro("Learning Java by Building Android Games "," Santillan ",a," 965-7829384");
        
        
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
