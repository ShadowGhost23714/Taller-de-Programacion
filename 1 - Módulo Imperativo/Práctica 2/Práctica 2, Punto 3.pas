Program Practica2Actividad3;
const
	max = 1550;
	min = 300;
	dimf = 20;
type
	subrango = -1..dimf;
	vecAle = array [1..dimf] of integer;
	
	Procedure CargaVectorRecursiva (var v: vecAle; var dl: subrango);
	var
		rango: integer;
	begin
		rango:= max - min + 1;
		if (dl < dimf) then begin
			dl:= dl + 1;
			v[dl]:= min + random (rango);
			CargaVectorRecursiva (v, dl);
		end;
	end;
	
	Procedure Insercion (var v: vecAle; dl: subrango);
	var
		i, j: subrango;
		actual: integer;
	begin
		For i:= 2 to dl do begin
			actual:= v[i];
			j:= i - 1;
			While (j > 0) and (v[j] > actual) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
		v[j+1]:= actual;
		end;
	end;
	
	Procedure BusquedaDicotomicaRecursiva (v: vecAle; inicio, fin: subrango; valor: integer; var pos: subrango);
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
                    BusquedaDicotomicaRecursiva (v, inicio, medio-1, valor, pos)
                else
                    BusquedaDicotomicaRecursiva (v, medio+1, fin, valor, pos);
            end;
        end;
    end;

var
	Vector: vecAle;
	DimensionLogica, Posicion, i: subrango;
	ValorDeseado: integer;
begin
	DimensionLogica:= 0;
	randomize;
	CargaVectorRecursiva (Vector, DimensionLogica);
	Insercion (Vector, DimensionLogica);
	For i:= 1 to DimensionLogica do
	    writeln('Número ', Vector[i],' en la posición ', i);
	writeln ('Ingrese un número para que sea buscado en el vector');
	readln (ValorDeseado);
	BusquedaDicotomicaRecursiva (Vector, 1, DimensionLogica, ValorDeseado, Posicion);
	If (Posicion = -1) then
	    writeln ('El valor ingresado ', ValorDeseado, ' no se encuentra en el vector')
	else
	    writeln ('El valor ingresado ', ValorDeseado, ' se encuentra en el vector, en la posicion ', Posicion);
end.

{Por fin cargo todo un vector sin un 0 final que me rompa todo}
