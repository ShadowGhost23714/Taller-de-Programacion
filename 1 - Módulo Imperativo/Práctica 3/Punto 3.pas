Program Practica3Actividad3;
type
    rangodia = 1..31;
    rangomes = 1..12;
    rangoano = 2014..2024;
    data = record
        dia: rangodia;
        mes: rangomes;
        ano: rangoano;
    end;
    final = record
        materia: integer;
        fecha: data;
        nota: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: final;
        sig: lista;
    end;
    alumno = record
        legajo: integer;
        historia: lista;
    end;
    arbol = ^hoja;
    hoja = record
        dato: alumno;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure AgregarAdelante (var l: lista; f: final);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato:= f;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure LeerFinal (var f: final);
    begin
        f.nota:= random (11);
        if (f.nota <> 0) then begin
            f.materia:= 1 + random (20);
            f.fecha.dia:= 1 + random (31);
            f.fecha.mes:= 1 + random (12);
            f.fecha.ano:= 2014 + random (10);
            f.nota:= random (11);
        end;
    end;
    
    Procedure GenerarAlumno (var al: alumno);
    var
        f: final;
    Begin
        al.legajo:= random (100);
        if (al.legajo <> 0) then Begin
            al.historia:= nil;
            LeerFinal (f);
            while (f.nota <> 0) do Begin
                AgregarAdelante (al.historia, f);
                writeln ('Se guardo un final con nota ', f.nota);
                LeerFinal (f);
            end;
        end;
    end;
    
    Procedure InsertarFinal (var a: arbol; al: alumno);
    Begin
        if (a = nil) then begin
            new(a);
            a^.dato:= al;
            writeln ('Se cargo la lista de finales del legajo ', al.legajo);
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (al.legajo < a^.dato.legajo) then
                InsertarFinal (a^.HI, al)
            else
                InsertarFinal (a^.HD, al);
        end;
    end;
    
    Procedure CargarArbolAlumnos (var a: arbol); // Punto A
    var
        al: alumno;
    begin
        GenerarAlumno (al);
        while (al.legajo <> 0) do begin
            InsertarFinal (a, al);
            GenerarAlumno (al);
        end;
    end;
    
    Function BusquedaImpar (a: arbol): integer;
    begin
        if (a = nil) then
            BusquedaImpar:= 0
        else if ((a^.dato.legajo mod 10) mod 2 <> 0) then
            BusquedaImpar:= 1 + BusquedaImpar (a^.HI) + BusquedaImpar (a^.HD)
        else
            BusquedaImpar:= BusquedaImpar (a^.HI) + BusquedaImpar (a^.HD);
    end;
    
    Procedure LegajoImpar (a: arbol); // Punto B 
    var
        cant: integer;
    begin
        cant:= BusquedaImpar (a);
        writeln;
        if (cant <> 0) then
            writeln ('La cantidad de alumnos con legajo impar es ', cant)
        else
            writeln ('No hay alumnos con legajo impar');
        writeln;
    end;
    
    Function CondicionNota (l: lista): integer;
    var
        cant: integer;
    begin
        cant:= 0;
        while (l <> nil) do begin
            if (l^.dato.nota >= 4) then
                cant:= cant + 1;
            l:= l^.sig;
        end;
        CondicionNota:= cant;
    end;
    
    Procedure FinalesAprobados (a: arbol); // Punto C
    var
        cant: integer;
    begin
        if (a <> nil) then begin
            FinalesAprobados (a^.HI);
            cant:= CondicionNota (a^.dato.historia);
            writeln ('El alumno con legajo ', a^.dato.legajo, ' aprobó, con nota mayor o igual a cuatro, ', cant, ' final(es).');
            writeln;
            FinalesAprobados (a^.HD);
        end;
    end;
    
    Function CondicionPromedio (l: lista; num: real): boolean;
    var
        prom: real;
        cant: integer;
        notas: integer;
    begin
        cant:= 0;
        notas:= 0;
        while (l <> nil) do begin
            notas:= notas + l^.dato.nota;
            cant:= cant + 1;
            l:= l^.sig;
        end;
        if (cant > 0) then
            prom:= notas / cant
        else
            prom:= 0;
        CondicionPromedio:= (prom > num);
    end;
    
    Procedure PromedioAlumnos (a: arbol; num: integer); // Punto D
    begin
        if (a <> nil) then begin
            PromedioAlumnos (a^.HI, num);
            if (CondicionPromedio (a^.dato.historia, num)) then begin
                writeln ('El alumno con legajo ', a^.dato.legajo, ' tiene un promedio que supera el promedio ingresado');
                writeln;
            end;
            PromedioAlumnos (a^.HD, num);
        end;
    end;
    
var
    ArbolAlumnos: arbol;
    NotaIngresada: integer;
begin
    randomize;
    CargarArbolAlumnos (ArbolAlumnos);
    LegajoImpar (ArbolAlumnos);
    FinalesAprobados (ArbolAlumnos);
    writeln ('Escriba un número del 1 al 10 para averiguar el legajo de aquellos alumnos que superan con el promedio de sus notas ese número. En caso de ingresar un número y que no sea retornado ningun legajo significa que nadie supera ese valor');
    writeln;
    readln (NotaIngresada);
    writeln;
    PromedioAlumnos (ArbolAlumnos, NotaIngresada);
end.