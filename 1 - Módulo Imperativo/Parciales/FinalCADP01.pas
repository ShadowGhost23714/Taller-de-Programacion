program Final01;
type
    dias = 1..31;
    meses = 1..12;
    anns = 2014..2024;
    codigo = 1..100;
    
    fecha = record
        dia: dias;
        mes: meses;
        ann: anns;
    end;
    
    empleado = record
        dni: integer;
        nom: string;
        ape: string;
        depto: codigo;
        data: fecha;
        presente: boolean;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: empleado;
        sig: lista;
    end;
    
    procedure CargarLista (var l: lista); // se dispone
    
    procedure ContarPresentes (l : lista);
    var
        presentes: integer;
    begin
        presentes := 0;
        while (l <> nil) do begin
            if (l^.dato.presente) then
                presentes := presentes + 1;
            l:= l^.sig;
        end;
        writeln ('La cantidad de empleados presentes es de ',presentes);
    end;

var
    ListaEmpleados: lista;
begin
    CargarLista (ListaEmpleados);
    ContarPresentes (ListaEmpleados);
end.