package parcial02;

public class Funcion {
    private String titulo;
    private String fecha;
    private int hora;
    private Butaca [][] sala;
    private int N, M;
    private int [] dl;

    public String imprimirButacas (int b) {
        String aux = "Butacas número " + b + ": \n";
        for (int i = 0; i < 10; i++) {
            aux = aux + sala[i][b-1].toString();
        }
        return aux;
    }
    
    public void desocuparFila (int f) {
        for (int j = 0; j < M; j++) {
            if (sala[f-1][j].isOcupada())
                sala[f-1][j].setOcupada(false);
        }
    }
    
    public void ocuparButaca (int f, int b) {
        if (!sala[f-1][b-1].isOcupada())
            sala[f-1][b-1].setOcupada(true);
    }
    
    public Funcion(String titulo, String fecha, int hora, int n, int m) {
        this.setTitulo(titulo);
        this.setFecha(fecha);
        this.setHora(hora);
        this.N = n;
        this.M = m;
        sala = new Butaca [N][M];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                Butaca butaca = new Butaca (i, j);
                sala [i][j] = butaca;
            }
        }
    }

    @Override
    public String toString() {
        String aux = this.getTitulo() + ", " + this.getFecha() + ", " + this.getHora() + ":00 hs \n";
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                aux = aux + sala[i][j].toString() + "\n";
            }
        }
        return aux;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }
}