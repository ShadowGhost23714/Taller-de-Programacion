Program Practica2Punto1;
const
    max = 155;
    min = 10;
    lim = 15;
type
    subRango = 0..lim;
    vecAle = array [subRango] of integer;
    
    Procedure CargarVectorRecursivo (var v: vecAle; var dl: subRango); // Punto A-N
    var
        ale: integer;
        rango: integer;
    begin
        rango:= max - min + 1;
        ale:= min + random (rango);
        if (dl < lim) and (ale <> 20) then begin
            v[dl]:= ale;
            dl:= dl + 1;
            CargarVectorRecursivo (v,dl);
        end;
    end;
    
    Procedure ImprimirVectorRecursivoAux (v: vecAle; dl, i: subRango); // Punto B-Y
    begin
        if (i <= dl) then begin
            writeln('El numero aleatorio en la posicion ', i, ' es ', v[i]);
            i := i + 1;
            ImprimirVectorRecursivoAux(v, dl, i);
        end;
    end;
    
    Procedure ImprimirVectorRecursivo (v: vecAle; dl: subRango); // Punto B-Y
    begin
        ImprimirVectorRecursivoAux(v, dl, 1);
    end;
    
    Procedure ImprimirVectorNoRecursivo (v: vecAle; dl: subRango); // Punto C-Y
    var
        i: subRango;
    begin
        For i:= 1 to dl do begin
            writeln ('El numero aletorio en la posicion ', i,' es ', v[i]);
            ImprimirVectorRecursivo (v, dl);
        end;
    end;
    
    function SumarRecursivo(v: vecAle; pos, dl: integer): integer;
    begin
        if (pos > dl) then
            SumarRecursivo := 0
        else if (v[pos] mod 10) mod 2 = 0 then
            SumarRecursivo := SumarRecursivo(v, pos + 1, dl) + v[pos]  
        else
            SumarRecursivo := SumarRecursivo(v, pos + 1, dl);
    end;
    
    function Sumar (v: vecAle; dl: integer): integer; // Punto D-Y
    begin
        Sumar:= SumarRecursivo (v, 1, dl);
    end;
    
    Function Maximos (v: vecAle; dl, pos: subRango; max: integer): integer; // Punto E-Y
    begin
        if (pos > dl) then
            Maximos := max
        else if (v[pos] > max) then
                Maximos := Maximos (v, dl, pos + 1, v[pos])
            else
                Maximos := Maximos (v, dl, pos + 1, max);
    end;

    Function ObtenerMaximo (v: vecAle; dl: subRango): integer; // Punto E-Y
    var 
        pos: subRango;
        max: integer;
    begin
        pos := 1;
        max := v[pos];
        ObtenerMaximo := Maximos (v, dl, pos + 1, max);
    end;
    
    Function BusquedaRecursiva (v: vecAle; dl, pos: subRango; valor: integer): boolean; // Punto F-Y
    begin
        if (pos <= dl) and (v[pos] = valor) then
            BusquedaRecursiva:= true
        else if (pos <= dl) then
            BusquedaRecursiva:= BusquedaRecursiva (v, dl, pos + 1, valor);
    end;
    
    Function BuscarValor (v: vecAle; dl: subRango; valor: integer): boolean; // Punto F-Y
    var
        pos: subRango;
    Begin
        pos:= 1;
        BuscarValor:= BusquedaRecursiva (v, dl, pos, valor);
    end;
    
    Procedure Imprimir(num: integer); // Punto G-Y
    begin
        if (num <> 0) then begin
            Imprimir(num div 10);
            writeln(num mod 10);
        end;
    end;
    
    Procedure ImprimirDigitos (v: vecAle; dl: subRango); // Punto G
    var
        i: subRango;
    begin
        For i:= 1 to dl do begin
            writeln;
            writeln ('Los digitos del numero ', v[i],' de la posicion ', i,' son:');
            writeln;
            Imprimir (v[i]);
        end;
    end;
    
var 
    DimensionLogica: subRango;
    suma, maximo, valor: integer; 
    Vector: vecAle;
    encontre: boolean;
Begin
    DimensionLogica:= 1;
    randomize;
    CargarVectorRecursivo (Vector, DimensionLogica);
    writeln;
    if (DimensionLogica = 1) then 
        writeln ('--- Vector sin elementos ---')
    else begin
        ImprimirVectorRecursivo (Vector, DimensionLogica);
    end;
    writeln;
    suma:= Sumar (Vector, DimensionLogica);
    writeln;
    writeln('La suma de los valores del vector es ', suma); 
    writeln;
    maximo:= ObtenerMaximo (Vector, DimensionLogica);
    writeln;
    writeln ('El maximo del vector es ', maximo); 
    writeln;
    writeln ('Ingrese un valor a buscar: ');
    readln (valor);
    encontre:= BuscarValor (Vector, DimensionLogica, valor);
    writeln;
    if (encontre) then 
        writeln('El ', valor, ' esta en el vector')
    else 
        writeln('El ', valor, ' no esta en el vector');
    writeln;
    ImprimirDigitos (Vector, DimensionLogica);
end.
