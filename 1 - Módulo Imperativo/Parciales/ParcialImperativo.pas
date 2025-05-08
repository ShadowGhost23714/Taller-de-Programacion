Program ParcialImperativo;
type
    dias = 0..31;
    meses = 1..12;
    rangohora = 1..8;
    empleado = record
        numero: integer;
        dia: dias;
        mes: meses;
        horas: rangohora;
    end;
    arbol = ^hoja;
    hoja = record
        dato: empleado;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure LeerEmpleado (var e: empleado);
    begin
        writeln ('Ingrese lo pedido para almacenar los datos de un empleado. Recuerde que la lectura finaliza con el número del día 0.');
        writeln;
        writeln ('Ingrese el número del día.');
        writeln;
        readln (e.dia);
        writeln;
        if (e.dia <> 0) then begin
            writeln ('Ingrese el número del mes.');
            writeln;
            readln (e.mes);
            writeln;
            writeln ('Ingrese el número del empleado.');
            writeln;
            readln (e.numero);
            writeln;
            writeln ('Ingrese las horas.');
            writeln;
            readln (e.horas);
            writeln;
        end;
    end;
    
    Procedure InsertarEmpleado (var a: arbol; e: empleado);
    begin
        if (a = nil) then begin
            new (a);
            a^.dato:= e;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (e.numero < a^.dato.numero) then
                InsertarEmpleado (a^.HI, e)
            else
                InsertarEmpleado (a^.HD, e);
        end;
    end;
    
    Procedure CargarArbol (var a: arbol);
    var
        e: empleado;
    begin
        LeerEmpleado (e);
        while (e.dia <> 0) do begin
            InsertarEmpleado (a, e);
            LeerEmpleado (e);
        end;
    end;
    
    Procedure EntreDosValores (a: arbol; x, y: integer);
    begin
        if (a <> nil) then begin
            EntreDosValores (a^.HI, x, y);
            if (a^.dato.numero > x-1) and (a^.dato.numero < y+1) then begin
                writeln ('Número de Empleado ',a^.dato.numero);
                writeln ('Fecha ',a^.dato.dia,'/',a^.dato.mes,'/2021');
                writeln ('Número de Horas ',a^.dato.horas);
                writeln;
            end;
            EntreDosValores (a^.HD, x, y);
        end;
    end;
    
    Procedure InformarEntreDosValores (a: arbol);
    var
        x, y: integer;
    begin
        writeln ('A continuación a partir del ingreso de dos números de empleado se mostran en pantalla los registros de los empleados compredidos entre esos dos valores.');
        writeln;
        writeln ('Ingrese el primer número.');
        writeln;
        readln (x);
        writeln;
        writeln ('Ingrese el segundo número.');
        writeln;
        readln (y);
        writeln;
        EntreDosValores (a, x, y);
    end;
    
    Function TotalHoras (a: arbol): integer;
    begin
        if (a = nil) then
            TotalHoras:= 0
        else
            TotalHoras:= a^.dato.horas + TotalHoras (a^.HI) + TotalHoras (a^.HD);
    end;
    
    Procedure InformarTotalHoras (a: arbol);
    var
        cant: integer;
    begin
        cant:= TotalHoras (a);
        if (cant = 0) then
            writeln ('No se puede imprimir la cantidad total de horas porque el árbol está vacío.')
        else
            writeln ('La cantidad total de horas es ',cant);
        writeln;
    end;
    
var
    Empleados: arbol;
begin
    writeln;
    CargarArbol (Empleados);
    writeln ('----------- Inciso B ----------');
    writeln;
    InformarEntreDosValores (Empleados);
    writeln ('----------- Inciso C ----------');
    writeln;
    InformarTotalHoras (Empleados);
    writeln ('----------- Fin del Progrma ----------');
    writeln;
end.