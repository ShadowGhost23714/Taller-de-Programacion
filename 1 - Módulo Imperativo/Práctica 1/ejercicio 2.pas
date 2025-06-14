program ejer2p1;
const
    Lim = 300;
type
    SubRango = 1..Lim;
    oficina = record
        codigo: integer;
        DNI: integer;
        expensa: real:
    end;
    Vector = array [SubRango] of oficina;

    procedure generarVector (var v: vector; var dl: SubRango);
    var
        x: oficina;
    begin
        dl:= 1;
        Leer (x);
        while (x.codigo<>-1) do begin
            v[dl]:= x;
            dl:= dl + 1;
            Leer (x);
        end;
    end;

    procedure Leer (var x: oficina);
    begin
        readln (x.codigo);
        readln (x.DNI);
        readln (x.expensa);
    end;

    Procedure insercion ( var v: vector; dl: SubRango );
    var 
        i, j: SubRango; 
        actual: oficina;
    begin
        for i:= 2 to dl do begin 
            actual:= v[i];
            j:= i-1; 
            while (j > 0) y (v[j] > actual.codigo) do begin
                v[j+1]:= v[j];
                j:= j – 1;                  
            end;  
            v[j+1]:= actual; 
        end;
    end;
    
    Procedure seleccion ( var v: vector; dl: SubRango );
    var 
        i, j, pos: SubRango;
        item : oficina;	
    begin
        for i:=1 to dl-1 do begin            
            pos := i;
            for j := i+1 to dl do begin
                if v[j].codigo < v[pos].codigo then 
                    pos:=j;                    
            end;
            item := v[pos];   
            v[pos] := v[i];   
            v[i] := item;
        end;
    end;
    
var
    VectorOficinas: vector;
    DimensionLogica: SubRango;
begin
    generarVector (VectorOficinas, DimensionLogica);
    insercion (VectorOficinas, DimensionLogica);
    seleccion (VectorOficinas, DimensionLogica);
end.
