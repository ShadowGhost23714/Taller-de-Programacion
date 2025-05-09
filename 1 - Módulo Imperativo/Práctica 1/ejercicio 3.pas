program ejer2p1;
const
    Lim = 8;
type
    SubRango = 1..Lim;
    pelicula = record
        codigo: integer;
        genero: SubRango;
        puntaje: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: pelicula;
        sig: lista;
    end;
    calificacion = record
        codigoVector: integer;
        puntajeVector: real;
    end;
    vector = array [SubRango] of calificacion;
    
    procedure Leer (var P: pelicula);
    begin
        readln (P.codigo);
        readln (P.genero);
        readln (P.puntaje);
    end;
    
    procedure AgregarAtras (var pri, ult: lista; p: pelicula);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato:= p;
        nue^.sig:= NIL;
        if (pri=nil) then begin
            pri:= nue;
        end
        else
            ult^.sig:=nue;
        ult:=nue;
    end;
    
    procedure CargarLista (var L: lista);
    var
        p: pelicula;
        pri, ult: lista; 
    begin
        pri:= L;
        ult:= L;
        Leer (p);
        while (p.codigo<>-1) do begin
            AgregarAtras (pri, ult, p);
            leer (p);
        end;
    end;
    
    procedure Inicializar (var v: vector);
    var
        i: SubRango;
    begin
        for i:=1 to Lim do
            v[i].puntajeVector:= 0;
    end;
    
    procedure ProcesarDatos (l: lista; var v: vector);
    begin
        Inicializar (v);
        while (l<>nil) do begin
            if (l^.dato.puntaje > v[l^.dato.genero].puntajeVector) then
                v[l^.dato.genero].puntajeVector:= l^.dato.puntaje;
            l:= l^.sig;
        end;
    end;
    
    procedure Insercion (var v: vector);
    var 
        i, j: SubRango; 
        actual: calificacion;
    begin
        for i:= 2 to lim do begin 
            actual:= v[i];
            j:= i-1; 
            while (j > 0) and (v[j].puntajeVector > actual.puntajeVector) do begin
                v[j+1]:= v[j];
                j:= j-1;                  
            end;  
            v[j+1]:= actual; 
        end;
    end;
    
    procedure MaxsMins (v: vector);
    var
        i: SubRango;
        min, max: real;
        minCod, maxCod: integer;
    begin
        max:= -1;
        min:= 99;
        for i:= 1 to lim do begin
            if (v[i].puntajeVector > max) then begin
                max:= v[i].puntajeVector;
                maxCod:= v[i].codigoVector;
            end
            else begin
                if (v[i].puntajeVector < min) then begin
                    min:= v[i].puntajeVector;
                    minCod:= v[i].codigoVector;
                end;
            end;
        end;
        writeln ('La pelicula ', maxCod,'cuenta con el mayor puntaje, que es de ',max);
        writeln ('La pelicula ', minCod,'cuenta con el menor puntaje, que es de ',min);
    end;
    
var
    ListaPeliculas: lista;
    VectorPeliculas: vector;
    DimensionLogica: SubRango;
begin
    ListaPeliculas:= nil;
    CargarLista (ListaPeliculas);
    ProcesarDatos (ListaPeliculas, VectorPeliculas);
    Insercion (VectorPeliculas);
    MaxsMins (VectorPeliculas);
end.

{v[l^.dato.genero]. codigoVector := l^.dato.codigo;  Falto por algun lado jsjsjs}
