Program Practica3Actividad1;
type
    rangoedad = 12..100;
    cadena15 = string [15];
    socio = record
        numero: integer;
        nombre: cadena15;
        edad: rangoedad;
    end;
    arbol =^nodoArbol;
    nodoArbol = record
        dato: socio;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure LeerSocio (var s: socio);
    var 
        vecnom: array [1..10] of string = ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
    begin
        s.numero:= random (51) * 100;
        If (s.numero <> 0) then begin
            s.nombre:= vecnom[1 + random(10)];
            s.edad:= 12 + random (89);
        end;
    end;

    Procedure InsertarElemento (var a: arbol; s: socio);
    Begin
        if (a = nil) then begin
            new(a);
            a^.dato:= s; 
            a^.HI:= nil; 
            a^.HD:= nil;
        end
        else begin
            if (s.numero <> a^.dato.numero) then begin
                if (s.numero < a^.dato.numero) then 
                    InsertarElemento(a^.HI, s)
                else 
                    InsertarElemento(a^.HD, s);
            end;
        end;
    end;

    Procedure CargarArbol (var a: arbol); // Punto A
    var
        s: socio;
    begin
        LeerSocio (s);
        while (s.numero <> 0) do begin
            InsertarElemento (a,s);
            LeerSocio (s);
        end;
    end;
    
    Procedure InformarSociosOrdenCreciente (a: arbol);
    begin
        if (a <> nil) then begin
            InformarSociosOrdenCreciente (a^.HI);
            writeln ('Número ',a^.dato.numero);
            writeln ('Nombre ',a^.dato.nombre);
            writeln ('Edad ',a^.dato.edad);
            writeln;
            InformarSociosOrdenCreciente (a^.HD);
        end;
    end;
    
    Function BuscarMayorNumero (a: arbol): integer;
    begin
        if (a = nil) then
            BuscarMayorNumero:= 0
        else begin
            if (a^.HD = nil) then
                BuscarMayorNumero:= a^.dato.numero
            else
                BuscarMayorNumero:= BuscarMayorNumero (a^.HD);
        end;
    end;
    
    Procedure InformarMayorNumero (a: arbol);
    var
        num: integer;
    begin
        writeln ('---------- inciso i ----------');
        writeln;
        num:= BuscarMayorNumero (a);
        if (num <> 0) then 
            writeln ('El mayor número de socio es ',num)
        else
            writeln ('No hay datos de socios cargados');
        writeln;
    end;
    
    Procedure BuscarMinimo (a: arbol; var num: integer; var nom: cadena15; var ed: rangoedad);
    begin
        if (a <> nil) then begin
            if (a^.dato.numero < num) then begin
                num:= a^.dato.numero;
                nom:= a^.dato.nombre;
                ed:= a^.dato.edad;
            end;
            BuscarMinimo (a^.HI, num, nom, ed);
        end;
    end;
    
    Procedure InformarDatosDelMinimo (a: arbol);
    var
        num: integer;
        nom: cadena15;
        ed: rangoedad;
    begin
        writeln ('---------- inciso ii ----------');
        writeln;
        num:= 9999;
        BuscarMinimo (a, num, nom, ed);
        if (num <> 9999) then begin
            writeln ('Los datos del socio con el menor número de socio son:');
            writeln ('Número ', num);
            writeln ('Nombre ', nom);
            writeln ('Edad   ', ed);
        end
        else
            writeln ('No hay datos de socios cargados.');
        writeln;
    end;
    
    Function BuscarNumero (a: arbol; num: integer): boolean;
    begin
        if (a = nil) then 
            BuscarNumero:= false
        else begin
            if (a^.dato.numero = num) then
                BuscarNumero:= true
            else
                BuscarNumero:= BuscarNumero (a^.HI, num) or BuscarNumero (a^.HD, num);
        end;
    end;
    
    Procedure InformaExisteciaDeNumero (a: arbol);
    var
        num: integer;
    begin
        writeln ('---------- inciso iii ----------');
        writeln;
        writeln ('Ingrese un número del 100 al 5.000 para saber si hay un socio con ese valor.');
        writeln;
        readln (num);
        writeln;
        if (BuscarNumero(a, num)) then 
            writeln ('Existe un socio con el valor ingresado.')
        else
            writeln ('No existe un socio con el valor ingresado.');
        writeln;
    end;
    
    Function ContarSociosEntreDosValores (a: arbol; pri, ult: integer): integer;
    begin
        if (a = nil) then 
            ContarSociosEntreDosValores:= 0
        else begin
            if (a^.dato.numero > pri-1) and (a^.dato.numero < ult+1) then
                ContarSociosEntreDosValores:= 1 + ContarSociosEntreDosValores (a^.HI, pri, ult) + ContarSociosEntreDosValores (a^.HD, pri, ult)
            else
                ContarSociosEntreDosValores:= ContarSociosEntreDosValores (a^.HI, pri, ult) + ContarSociosEntreDosValores (a^.HD, pri, ult);
        end;
    end;
    
    Procedure InformaSociosEntreDosValores (a: arbol);
    var
        pri, ult, cant: integer;
    begin
        writeln ('---------- inciso iv ----------');
        writeln;
        writeln ('Ingrese dos valores entre 100 al 5.000 para saber la cantidad de socios que se encuentran en ese rango establecido.');
        writeln;
        readln (pri);
        writeln;
        readln (ult);
        writeln;
        cant:= ContarSociosEntreDosValores (a, pri, ult);
        if (cant <> 0) then
            writeln ('La cantidad de socios con un número que se encuentra entre ',pri,' y ',ult,' es ', cant)
        else
            writeln ('No hay socios que con un número que se encuentra entre ',pri,' y ',ult);
        writeln;
    end;
    
var
    ArbolSocios: arbol;
begin
    randomize;
    CargarArbol (ArbolSocios);
    writeln ('Se muestran en pantalla los datos de los socios de forma creciente.');
    writeln;
    InformarSociosOrdenCreciente (ArbolSocios);
    InformarMayorNumero (ArbolSocios);
    InformarDatosDelMinimo (ArbolSocios);
    InformaExisteciaDeNumero (ArbolSocios);
    InformaSociosEntreDosValores (ArbolSocios);
end.