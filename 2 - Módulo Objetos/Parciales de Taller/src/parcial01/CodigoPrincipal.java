package parcial01;

public class CodigoPrincipal {

    public static void main(String[] args) {
        Director director = new Director ("Juan", 34790239, 1999, 10000, 1000);
        Encargado encargado1 = new Encargado ("Pepe", 300, 2001, 5000, 10);
        Encargado encargado2 = new Encargado ("Chiche", 200, 2007, 4000, 5);
        Encargado encargado3 = new Encargado ("Tito", 100, 2004, 3000, 3);
        
        Empresa empresa = new Empresa ("Sabores Express", "cantilo y calle 3", director, 3);
        
        empresa.agregarEncargado(encargado1);
        empresa.agregarEncargado(encargado2);
        empresa.agregarEncargado(encargado3);
        
        System.out.println(empresa.toString());
        
    } 
}