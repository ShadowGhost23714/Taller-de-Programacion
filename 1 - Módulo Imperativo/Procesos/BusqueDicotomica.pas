Procedure BusquedaDicotomica (v: vector; inicio, fin: subrango; valor: integer; var pos: subrango);
var
    medio: integer;
begin
    if (inicio > fin) then
        pos:= -1
    else begin
        medio:= (inicio + fin) div 2;
        if (valor = v[medio]) then
            pos:= medio
        else begin
            if (valor < v[medio]) then
                BusquedaDicotomica (v, inicio, medio-1, valor, pos)
            else
                BusquedaDicotomica (v, medio+1, fin, valor, pos);
        end;
    end;
end;