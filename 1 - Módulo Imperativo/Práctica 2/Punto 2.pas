Program Practica2Punto2;
const
    max = 200;
    min = 100;
type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
    
    Procedure AgregarAdelante (var l: lista; num: integer);
    var
        nue: lista;
    Begin
        new (nue);
        nue^.dato:= num;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure CargarListaRecursiva (var l: lista); // Punto A-Y
    var
        ale: integer;
    Begin   
        ale:= min + random (max - min + 1);
        if (ale <> 100) then Begin
            AgregarAdelante (l, ale);
            CargarListaRecursiva (l);
        end;
    end;
    
    Procedure Imprimir (l: lista); // Punto B-Y
    Begin
        if (l <> nil) then Begin
            writeln ('Se almaceno el número ', l^.dato);
            Imprimir (l^.sig);
        end;
    end;
    
    Procedure ImprimirAlRevesRecursivo (l: lista); // Punto C-Y
    Begin
        if (l <> nil) then Begin
            ImprimirAlRevesRecursivo (l^.sig);
            writeln ('Se almaceno el número ', l^.dato);
        end;
    end;
    
    Function MinimoDeLaListaRecursivoAux (l:lista; minimo: integer): integer;
    Begin
        if (l = nil) then
            MinimoDeLaListaRecursivoAux:= minimo
        else if (l^.dato < minimo) then
                MinimoDeLaListaRecursivoAux:= MinimoDeLaListaRecursivoAux (l^.sig, l^.dato)
            else
                MinimoDeLaListaRecursivoAux:= MinimoDeLaListaRecursivoAux (l^.sig, minimo);
    end;
    
    Function MinimoDeLaListaRecursivo (l:lista): integer; // Punto D-Y
    var
        minimo: integer;
    Begin
        minimo:= 200;
        MinimoDeLaListaRecursivo:= MinimoDeLaListaRecursivoAux (l, minimo);
    end;
    
    Function BusquedaRecursiva (l: lista; num: integer): boolean;
    Begin
        if (l <> nil) and (num = l^.dato) then
            BusquedaRecursiva:= true
        else if (l <> nil) then
            BusquedaRecursiva:= BusquedaRecursiva (l^.sig, num);
    end;
    
var 
    ListaNumerosAle: lista;
    MinimoDeLaLista, ValorIngresado: integer;
Begin
    ListaNumerosAle:= nil;
    CargarListaRecursiva (ListaNumerosAle);
    Imprimir (ListaNumerosAle);
    writeln;
    ImprimirAlRevesRecursivo (ListaNumerosAle);
    writeln;
    MinimoDeLaLista:= MinimoDeLaListaRecursivo (ListaNumerosAle);
    writeln ('El número más chico de la lista es ', MinimoDeLaLista);
    writeln;
    writeln (' ----- Ingrese un número para averiguar si está dentro de la lista -----');
    writeln;
    readln (ValorIngresado);
    writeln;
    if (BusquedaRecursiva(ListaNumerosAle, ValorIngresado)) then
        writeln ('El número ingresado, ', ValorIngresado, ', está en la lista')
    else
        writeln ('El número ingresado, ', ValorIngresado, ', no está en la lista');
end.
