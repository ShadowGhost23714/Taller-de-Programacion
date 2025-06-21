program Final;
type
    tipodepago = "efectivo", "tarjeta";
    venta = record
        numero: integer;
        cant_productos: integer;
        pago: tipodepago;
    end;
    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;
    
    procedure Cargarlista (var l1: lista); // se dispone
    
    procedure Analizar (l1: lista; var l2: lista);
    var
        
    begin
        while (l1 <> nil) do begin
            if (cumple(l1^.dato.cant_productos)) then
                Insertar (l1^.dato, l2);
        end;
    end;
    
    function cumple (num: integer): boolean;
    var
        pares: integer;
    begin
        pares:= 0;
        while (num <> 0) do begin
            if ((num mod 10) mod 2 = 0) then
                pares:= pares + 1;
            num:= num div 10;
        end;
        cumple:= (pares > 2);
    end;
    
    procedure Insertar (dato: cliente; var l: lista);
    var
        ant, act, nue: lista;
    begin
        new (nue);
        nue^.dato:= dato
        ant:= l;
        act:= l;
        while (act <> nil) and (dato.pago <> "efectivo") do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act <> ant) then
            l:= nue;
        else
            ant^.sig:= act^.sig;
        ant^.sig:= nue;
    end;
var
    l1, l2: lista;
begin
    l1:= nil;
    l2:= nil;
    Cargarlista (l1);
    Analizar (l1, l2);
end.
