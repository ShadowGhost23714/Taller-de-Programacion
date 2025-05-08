Procedure Seleccion (var v: vector; dl: subrango);
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