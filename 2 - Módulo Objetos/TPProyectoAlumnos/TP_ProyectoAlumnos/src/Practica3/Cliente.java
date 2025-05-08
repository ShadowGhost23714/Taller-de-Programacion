package Practica3;
/**
 * @author ajmd0
 */
public class Cliente {
    private String nombre;
    private int dni;
    private int edad;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    @Override
    public String toString() {
        return "cliente: "+nombre+ ", DNI "+dni+ ", " + edad+" años.";
    }
}
