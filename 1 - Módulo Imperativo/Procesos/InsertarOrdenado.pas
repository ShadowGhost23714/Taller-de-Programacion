Procedure InsertarOrdenado (var l: lista; x: elem);
var
    ant, act, nue: lista;
begin
    new (nue);
    nue^.dato:= x;
    ant:= l;
    act:= l;
    while (act <> nil) and (x.num > l^.dato.num) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then
        l:= nue;
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;