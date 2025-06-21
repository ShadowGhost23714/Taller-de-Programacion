program final3;
type
    rango = 1..12;
    publicacion = record 
        titulo: string;
        autor: string;
        dni: integer;
        tipo: rango;
    end;
    lista = ^nodo;
    nodo record
        dato: publicacion;
        sig: lista;
    end;
    vector = array [rango] of integer
    
    procedure inicializar (var v: vector);
    var 
        i: rango;
    begin
        for i:= 1 to 12 do begin
            v[i]:= 0;
    end;
    
    procedure leer (var x: publicacion);
    begin
        readln (x.titulo);
        readln (x.autor);
        readln (x.dni);
        readln (x.tipo);
    end;
    
    procedure insertarordendado (var l: lista; x: publicacion);
    var
        nue, act, ant: lista;
    begin
        new (nue);
        nue^.dato:= x;
        act:= l;
        ant:= l;
        while (act <> nil) and (x.dni > act^.dato.dni) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act <> ant) then
            l:= nue;
        else
            ant^,sig:= act^.sig;
        ant^sig:= nue;
    end;
    
    procedure maximos (v: vector);
    var
        max: integer;
        tdp, i: rango;
    begin
        max:= -1;
        for i:0 1 to 12 do begin
            if (max < v[i]) then begin
                max:= v[i];
                tdp:= i;
            end;
        end;
        writeln (tdp, max);
    end;
    
    procedure cargarlista (var l: lista);
    var 
        x: publicacion;
    begin
        leer (x);
        while (x.dni <> 0) do begin
            insertarordendado (l, x);
            leer (x);
        end;
    end;
    
    procedure procesardatos (l: lista);
    var
        v: vector;
        cant: integer;
        dniautor: integr;
    begin
        inicializar (v);
        while (l <> nil) do begin
            cant:= 0;
            dniautor:= l^.dato.dni;
            while (l <> nil) and (dniautor <> l^.dato.dni) do begin
                cant:= cant + 1;
                v[l^.dato.tipo]:= v[l^.dato.tipo] + 1;
                l:= l^:sig;
            end;
            writeln (dniautor, cant);
        end;
        maximos (v);
    end;

var
    l: lista;
begin
    l:= nil;
    cargarlista (l);
    procesardatos (l);
end.