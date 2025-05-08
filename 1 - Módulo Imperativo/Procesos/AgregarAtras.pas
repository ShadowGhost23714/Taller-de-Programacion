procedure AgregarAtras (var pri, ult: lista; num: integer);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= num;
    nue^.sig:= NIL;
    if (pri=nil) then begin
        pri:= nue;
    end
    else
        ult^.sig:=nue;
    ult:=nue;
end;