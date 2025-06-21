program final2;
const
    lim = 5
type
    rango = 1..5;
    fecha = record
        dia: integer;
        mes: integer;
        año: intger;
    end;
    cliente = record
        nombre: string;
        apellido: string;
        catergoria: rango;
        inscripcion: fecha;
    end;
    lista = ^nodo;
    nodo = record 
        dato: cliente;
        sig: lista;
    end;
    vector = array [rango] of integer;
    
    procedure CargarLista (var l: lista); // se dispone
    
    Procedure Incilializar (var v: vector);
    var
        i: rango;
    begin
        for i:= 1 to lim do
            v[i]:= 0;
    end;
    
    procedure AnalizarDatos (l:lista; var v: vector);
    begin
        Incilializar (v);
        while (l <> nil) do begin
            v[l^.dato.categoria]:= v[l^.dato.categoria] + 1;
            l:= l^.sig;
        end;
    end,
    
    procedure AgregarAdelante (x: cliente; var l: lista);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato:= x;
        nue^.sig:= l;
        l:= nue;
    end;
    
    procedure CrearLista (var l2: lista; l:lista; v: vector);
    begin
        while (l <> nil) do begin
            if (v[l^.dato.categoria] > 50) then
                AgregarAdelante (L^.dato, l2);
        end;
    end;
    
var
    l1, l2: lista;
    contador: vector;
begin
    l1:= nil;
    l2:= nil;
    CargarLista (l1);
    AnalizarDatos (l1, contador);
    CrearLista (l2, l1, v);
end.