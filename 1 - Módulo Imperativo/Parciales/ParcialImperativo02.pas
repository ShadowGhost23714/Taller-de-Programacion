Program parcial;
type
    dias = 1..31;
    envioLectura = record
        postal: integer;
        cliente: integer;
        dia: dias;
        peso: real;
    end;
    
    envioArbol = record
        cliente: integer;
        dia: dias;
        peso: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: envioArbol;
        sig: lista;
    end;
    Envios = record
        postal: integer;
        listaEnvios: lista;
    end;
    arbol = ^hoja;
    hoja = record
        dato: Envios;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure LeerEnvio (var e: envioLectura);
    begin
        e.cliente:= random (1001);
        if (e.cliente <> 0) then begin
            e.postal:= random (100) + 1;
            e.dia:= random (31) + 1;
            e.peso:= (random (100) + 1)*1.5;
        end;
    end;
    
    Procedure AgregarAdelante (var l: lista; e: envioLectura);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato.cliente:= e.cliente;
        nue^.dato.dia:= e.dia;
        nue^.dato.peso:= e.peso;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure InsertarDatos (var a: arbol; e: envioLectura);
    begin
        if (a = nil) then begin
            new (a);
            a^.dato.postal:= e.postal;
            a^.dato.listaEnvios:= nil;
            AgregarAdelante (a^.dato.listaEnvios, e);
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else if (e.postal = a^.dato.postal) then
            AgregarAdelante (a^.dato.listaEnvios, e)
        else begin
            if (e.postal < a^.dato.postal) then
                InsertarDatos (a^.HI, e)
            else
                InsertarDatos (a^.HD, e);
        end;
    end;
    
    Procedure CargarArbolPostales (var a: arbol);
    var
        e: envioLectura;
    begin
        LeerEnvio (e);
        while (e.cliente <> 0) do begin
            InsertarDatos (a, e);
            LeerEnvio (e);
        end;
    end;
    
    Procedure ImprimirLista (l: lista);
    begin
        while (l <> nil) do begin
            writeln ('Código de cliente ', l^.dato.cliente);
            writeln ('Fecha ',l^.dato.dia,'/6/2024');
            writeln ('Peso del envío ',l^.dato.peso:2:2);
            writeln;
            l:= l^.sig;
        end;
    end;
    
    Procedure BuscarPostal (a: arbol; postal: integer; var l: lista);
    begin
        if (a = nil) then
            writeln ('No existe el codigo postal')
        else begin
            if (postal = a^.dato.postal) then begin
                writeln ('El codigo postal existe');
                l:= a^.dato.listaEnvios;
            end
            else begin
                if (postal < a^.dato.postal) then
                    BuscarPostal (a^.HI, postal, l)
                else
                    BuscarPostal (a^.HD, postal, l);
            end;
        end;
    end;
    
    Procedure RetornarEnvios (a: arbol; var l: lista);
    var
        postal: integer;
    begin
        writeln ('Ingrese un código postal para que saber todos sus envíos.');
        writeln;
        readln (postal);
        writeln;
        BuscarPostal (a, postal, l);
        writeln;
        ImprimirLista (l);
    end;
    
    Procedure MaximosMinimos (l: lista; var maxCod, minCod: integer; var maxPeso, minPeso: real);
    begin
        if (l <> nil) then begin
            if (l^.dato.peso > maxPeso) then begin
                maxPeso:= l^.dato.peso;
                maxCod:= l^.dato.cliente;
            end;
            if (l^.dato.peso < minPeso) then begin
                minPeso:= l^.dato.peso;
                minCod:= l^.dato.cliente;
            end;
            MaximosMinimos (l^.sig, maxCod, minCod, maxPeso, minPeso);
        end;
    end;
    
    Procedure InformarMaximosMinimos (l: lista);
    var
        maxCod, minCod: integer;
        maxPeso, minPeso: real;
    begin
        maxPeso:= 0;
        minPeso:= 999;
        MaximosMinimos (l, maxCod, minCod, maxPeso, minPeso);
        if (maxPeso = 0) then
            writeln ('No se econtraron datos en la lista.')
        else if (maxPeso = minPeso) then
            writeln ('El código de cliente ',maxCod,' es el único en la lista, con un peso de ',maxPeso:2:2,' kg.')
        else begin
            writeln ('El código de cliente con mayor peso es ',maxCod,' con un peso de ',maxPeso:2:2,' kg.');
            writeln;
            writeln ('El código de cliente con menor peso es ',minCod,' con un peso de ',minPeso:2:2,' kg.');
        end;
        writeln;
    end;
    
var
    ArbolPostales: arbol;
    EnviosDePostal: lista;
begin
    randomize;
    CargarArbolPostales (ArbolPostales);
    writeln;
    writeln ('----------- Inciso B ----------');
    writeln;
    RetornarEnvios (ArbolPostales, EnviosDePostal);
    writeln ('----------- Inciso C ----------');
    writeln;
    InformarMaximosMinimos (EnviosDePostal);
    writeln ('----------- Fin del Programa ----------');
    writeln;
end.