Procedure Insercion (var v: vector; dl: subrango);
var
    actual: elem;
begin
    for i:= 2 to dl do begin
        actual:= v[i];
        j:= i-1;
        while (j > 0) and (v[j] > actual) do begin
            v[j+1]:= v[j];
            j:= j-1;
        end;
        v[j]:= actual;
    end;
end;