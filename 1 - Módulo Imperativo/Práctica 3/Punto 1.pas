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
            if (s.numero < a^.dato.numero) then 
                InsertarElemento(a^.HI, s)
            else 
                InsertarElemento(a^.HD, s);
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
    
    Procedure InformarSociosOrdenCreciente (a: arbol); // Punto B-i
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
    
    Procedure InformarSociosOrdenDecreciente (a:arbol); // Punto B-ii
    begin
        if (a <> nil) then begin
            InformarSociosOrdenDecreciente (a^.HD);
            writeln ('Número ',a^.dato.numero);
            writeln ('Nombre ',a^.dato.nombre);
            writeln ('Edad ',a^.dato.edad);
            writeln;
            InformarSociosOrdenDecreciente (a^.HI);
        end;
    end;
    
    Procedure NumeroMasEdadRecursivo (a: arbol; var nummax, edmax: integer);
    begin
        if (a <> nil) then begin
            if (a^.dato.edad >= edmax) then begin
                edmax:= a^.dato.edad;
                nummax:= a^.dato.numero;
            end;
            NumeroMasEdadRecursivo (a^.HI, nummax, edmax);
            NumeroMasEdadRecursivo (a^.HD, nummax, edmax);
        end;
    end;
    
    Procedure InformarNumeroSocioConMasEdad (a: arbol); // Punto B-iii
    var
        numeroMax, edadMax: integer;
    begin
        edadMax:= -1;
        NumeroMasEdadRecursivo (a, numeroMax, edadMax);
        if (edadMax = -1) then
            writeln ('No hay datos de socios cargados.')
        else
            writeln ('El número del socio con mayor edad es ', numeroMax,'.');
        writeln;
    end;
    
    Function CantEdadNumeroImparAumentada (a: arbol): integer;
    begin
        if (a = nil) then 
            CantEdadNumeroImparAumentada:= 0
        else begin
            if (a^.dato.edad mod 2 = 1) then begin
                a^.dato.edad:= a^.dato.edad + 1;
                CantEdadNumeroImparAumentada:= 1 + CantEdadNumeroImparAumentada (a^.HI) + CantEdadNumeroImparAumentada (a^.HD);
            end
            else
                CantEdadNumeroImparAumentada := CantEdadNumeroImparAumentada(a^.HI) + CantEdadNumeroImparAumentada(a^.HD);
        end;
    end;
    
    Procedure InformarEdadImparAumentada (a: arbol); // Punto B-iv
    var
        total: integer;
    begin
        total:= CantEdadNumeroImparAumentada (a);
        if (total = 0) then
            writeln ('No hay socios con edad impar.')
        else
            writeln ('La cantidad total de socios a los que con edad impar se les aumento en 1 es ', total,'.');
        writeln;
    end;
    
    Function BuscarNombre (a: arbol; n: cadena15): boolean;
    begin
        if (a = nil) then
            BuscarNombre:= false
        else begin
            if (n = a^.dato.nombre) then
                BuscarNombre:= true
            else begin
                BuscarNombre:= BuscarNombre (a^.HI, n);
                BuscarNombre:= BuscarNombre (a^.HD, n);
            end;
        end;
    end;
    
    Procedure InformarExistenciaNombreSocio (a: arbol); // Punto B-vi
    var
        nom: cadena15;
    begin
        writeln ('Ingrese un nombre para verificar si se encuentra almacenado.');
        writeln;
        readln (nom);
        writeln;
        if (BuscarNombre (a, nom)) then 
            writeln (nom, ' se encuentra almacenado :)')
        else    
            writeln (nom, ' no se encuentra almacenado :(');
        writeln;
    end;
    
    Function CantidadSocios (a: arbol): integer;
    begin
        if (a = nil) then
            CantidadSocios:= 0
        else
            CantidadSocios:= CantidadSocios (a^.HI) + CantidadSocios (a^.HD) + 1;
    end;
    
    Procedure InformarCantidadSocios (a: arbol);
    var
        cantTotalSocios: integer;
    begin
        cantTotalSocios:= CantidadSocios (a);
        writeln ('La cantidad total de socios que hay es de ', cantTotalSocios,'.');
        writeln;
    end;
    
    Function SumarEdadSocios (a: arbol): integer;
    begin
        if (a = nil) then
            SumarEdadSocios:= 0
        else
            SumarEdadSocios:= a^.dato.edad + SumarEdadSocios (a^.HI) + SumarEdadSocios (a^.HD);
    end;
    
    Procedure InformarPromedioDeEdad (a: arbol);
    var
        promSocios: real;
        cantTotal, edadtotal: integer;
    begin
        cantTotal:= CantidadSocios (a);
        If (cantTotal = 0) then
            writeln ('No hay socios, por ende, no se puede hacer un promedio de las edades de los socios.')
        else
            edadtotal:= SumarEdadSocios (a);
            promSocios:= edadtotal / cantTotal;
            writeln ('El promedio total de la edad de todos los socios es de ', promSocios,'.');
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
    writeln ('Se muestran en pantalla los datos de los socios de forma decreciente.');
    writeln;
    InformarSociosOrdenDecreciente (ArbolSocios);
    InformarNumeroSocioConMasEdad (ArbolSocios);
    InformarEdadImparAumentada (ArbolSocios);
    InformarExistenciaNombreSocio (ArbolSocios);
    InformarCantidadSocios (ArbolSocios);
    InformarPromedioDeEdad (ArbolSocios);
end.