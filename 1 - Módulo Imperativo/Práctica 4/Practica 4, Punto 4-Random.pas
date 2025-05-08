Program Practica4Actividad4;
type
    rangodia = 1..31;
    rangomes = 1..12;
    prestamo = record
        ISBN: integer;
        socio: integer;
        dia: rangodia;
        mes: rangomes;
        tiempo: integer;
    end;
    ArbolPrestamo = ^hojaPrestamo;
    hojaPrestamo = record
        dato: prestamo;
        HI: ArbolPrestamo;
        HD: ArbolPrestamo;
    end;
    lista = ^nodo;
    nodo = record
        dato: prestamo;
        sig: lista;
    end;
    ArbolLista = ^hojaLista;
    hojaLista = record
        codigo: integer;
        ListaPrestamo: lista;
        HI: ArbolLista;
        HD: ArbolLista;
    end;
    ArbolISBN = ^hojaISBN;
    hojaISBN = record
        codigo: integer;
        total: integer;
        HI: ArbolISBN;
        HD: ArbolISBN;
    end;
    
    Procedure GenerarPrestamo (var p: prestamo);
    begin
        p.ISBN:= random (51) * 100;
        if (p.ISBN <> 0) then begin
            p.socio:= 1 + random (100);
            p.dia:= 1 + random (31);
            p.mes:= 1 + random (12);
            p.tiempo:= 1 + random (31);
        end;
    end;
    
    Procedure ArmarArbolPrestamo (var a: ArbolPrestamo; p: prestamo);
    begin
        if (a = nil) then begin
            new (a);
            a^.dato:= p;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (p.ISBN < a^.dato.ISBN) then 
                ArmarArbolPrestamo (a^.HI, p)
            else
                ArmarArbolPrestamo (a^.HD, p);
        end;
    end;
    
    Procedure AgregarAdelante (var l: lista; p: prestamo);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato:= p;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure ArmarArbolLista (var a: ArbolLista; p: prestamo);
    begin
        if (a = nil) then begin
            new (a);
            a^.codigo:= p.ISBN;
            a^.ListaPrestamo:= nil;
            AgregarAdelante (a^.ListaPrestamo, p);
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (p.ISBN = a^.codigo) then
                AgregarAdelante (a^.ListaPrestamo, p)
            else begin
                if (p.ISBN < a^.codigo) then 
                    ArmarArbolLista (a^.HI, p)
                else
                    ArmarArbolLista (a^.HD, p);
            end;
        end;
    end;
    
    Procedure CargarArboles (var ap: ArbolPrestamo; var al: ArbolLista);
    var
        p: prestamo;
    begin
        GenerarPrestamo (p);
        while (p.ISBN <> 0) do begin
            ArmarArbolPrestamo (ap, p);
            ArmarArbolLista (al, p);
            GenerarPrestamo (p);
        end;
    end;
    
    Procedure InformarHojasDelArbol (a: ArbolPrestamo);
    begin
        if (a <> nil) then begin
            InformarHojasDelArbol (a^.HI);
            writeln ('ISBN del libro = ',a^.dato.ISBN);
            writeln ('Código de socio ',a^.dato.socio);
            writeln ('Fecha del prestamo ',a^.dato.dia,'/',a^.dato.mes,'/2021');
            writeln ('Días de prestado ',a^.dato.tiempo);
            writeln;
            InformarHojasDelArbol (a^.HD);
        end;
    end;

    
    Function ISBNMasGrande (a: ArbolPrestamo): integer;
    begin
        if (a = nil) then
            ISBNMasGrande:= 0
        else begin
            if (a^.HD = nil) then
                ISBNMasGrande:= a^.dato.ISBN
            else
                ISBNMasGrande:= ISBNMasGrande (a^.HD);
        end;
    end;
    
    Procedure InformarISBNMasGrande (var a: ArbolPrestamo);
    var
        max: integer;
    begin
        max:= ISBNMasGrande (a);
        if (max = 0) then
            writeln ('El árbol de los prestamos esta vacío.')
        else
            writeln ('El ISBN más grande es ',max);
        writeln;
    end;
    
    Function ISBNMasChico (a: ArbolLista): integer;
    begin
        if (a = nil) then
            ISBNMasChico:= 0
        else begin
            if (a^.HI = nil) then
                ISBNMasChico:= a^.codigo
            else
                ISBNMasChico:= ISBNMasChico (a^.HI);
        end;
    end;
    
    Procedure InformarISBNMasChico (var a: ArbolLista);
    var
        min: integer;
    begin
        min:= ISBNMasChico (a);
        if (min = 0) then
            writeln ('El árbol de los préstamos esta vacío.')
        else
            writeln ('El ISBN más chico es ',min);
        writeln;
    end;
    
    Function CantidadDePrestamos (a: ArbolPrestamo; num: integer): integer;
    begin
        if (a = nil) then
            CantidadDePrestamos:= 0
        else begin
            if (a^.dato.socio = num) then
                CantidadDePrestamos:= 1 + CantidadDePrestamos (a^.HI, num) + CantidadDePrestamos (a^.HD, num)
            else
                CantidadDePrestamos:= CantidadDePrestamos (a^.HI, num) + CantidadDePrestamos (a^.HD, num);
        end;
    end;
    
    Procedure InformarCantidadDePrestamos_i (a: ArbolPrestamo);
    var
        cant, cod: integer;
    begin
        writeln ('Ingrese el número de un socio para averiguar la cantidad de préstamos.');
        writeln;
        readln (cod);
        writeln;
        cant:= CantidadDePrestamos (a, cod);
        if (cant = 0) then
            writeln ('No existe un socio con ese número.')
        else
            writeln ('La cantidad total del socio con número ',cod,' es ',cant);
        writeln;
    end;
    
    Procedure CantidadDePrestamos_ii (a: ArbolLista ; num: integer; var cant: integer);
    var
        l: lista;
    begin
        if (a <> nil) then begin
            CantidadDePrestamos_ii (a^.HI, num, cant);
            l:= a^.ListaPrestamo;
            while (l <> nil) do begin
                if (l^.dato.socio = num) then
                    cant:= cant + 1;
                l:= l^.sig;
            end;
            CantidadDePrestamos_ii (a^.HD, num, cant);
        end;    
    end;
    
    Procedure InformarCantidadDePrestamos_ii (a: ArbolLista);
    var
        cant, cod: integer;
    begin
        writeln ('Ingrese el número de un socio para averiguar la cantidad de préstamos.');
        writeln;
        readln (cod);
        writeln;
        cant:= 0;
        CantidadDePrestamos_ii (a, cod, cant);
        if (cant = 0) then
            writeln ('No existe un socio con ese número.')
        else
            writeln ('La cantidad total del socio con número ',cod,' es ',cant);
        writeln;
    end;
    
    Procedure ArmarHojaISBN_F (var a: ArbolISBN; p: prestamo);
    begin
        if (a = nil) then begin
            new (a);
            a^.codigo:= p.ISBN;
            a^.total:= 1;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (p.ISBN = a^.codigo) then
                a^.total:= a^.total + 1
            else begin
                if (p.ISBN < a^.codigo) then 
                    ArmarHojaISBN_F (a^.HI, p)
                else
                    ArmarHojaISBN_F (a^.HD, p);
            end;
        end;
    end;
    
    Procedure CrearArbolISBN_F (ap: ArbolPrestamo; var ai: ArbolISBN);
    begin
        if (ap <> nil) then begin
            CrearArbolISBN_F (ap^.HI, ai);
            ArmarHojaISBN_F (ai, ap^.dato);
            CrearArbolISBN_F (ap^.HD, ai);
        end;
    end;
    
    Procedure InformarHojasDelArbolISBN (a: ArbolISBN);
    begin
        if (a <> nil) then begin
            InformarHojasDelArbolISBN (a^.HI);
            writeln ('ISBN del libro = ',a^.codigo);
            writeln ('Cantidad de prestamos ',a^.total);
            writeln;
            InformarHojasDelArbolISBN (a^.HD);
        end;
    end;
    
    Procedure ArmarHojaISBN_G (var a: ArbolISBN; num: integer; l: lista);
    begin
        if (a = nil) then begin
            new (a);
            a^.codigo:= num;
            a^.total:= 0;
            while (l <> nil) do begin
                a^.total:= a^.total + 1;
                l:= l^.sig;
            end;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (num < a^.codigo) then 
                ArmarHojaISBN_G (a^.HI, num, l)
            else
                ArmarHojaISBN_G (a^.HD, num, l);
        end;
    end;
    
    Procedure CrearArbolISBN_G (al: ArbolLista; var ai: ArbolISBN);
    begin
        if (al <> nil) then begin
            CrearArbolISBN_G (al^.HI, ai);
            ArmarHojaISBN_G (ai, al^.codigo, al^.ListaPrestamo);
            CrearArbolISBN_G (al^.HD, ai);
        end;
    end;
    
    Function CantidadTotal_i (a: ArbolPrestamo; pri, ult: integer): integer;
    begin
        if (a = nil) then
            CantidadTotal_i:= 0
        else begin
            if (a^.dato.ISBN > pri - 1) and (a^.dato.ISBN < ult + 1) then
                CantidadTotal_i:= 1 + CantidadTotal_i (a^.HI, pri, ult) + CantidadTotal_i (a^.HD, pri, ult)
            else
                CantidadTotal_i:= CantidadTotal_i (a^.HI, pri, ult) + CantidadTotal_i (a^.HD, pri, ult);
        end;
    end;
    
    Procedure InformarCantidadTotal_i (a: ArbolPrestamo);
    var
        pri, ult, cant: integer;
    begin
        writeln ('A continuación ingrese dos valores ISBN para averiguar la cantidad total de préstamos realizados en ese rango.');
        writeln;
        writeln ('Ingrese el primer valor ISBN.');
        writeln;
        readln (pri);
        writeln;
        writeln ('Ingrese el segundo valor ISBN.');
        writeln;
        readln (ult);
        writeln;
        cant:= CantidadTotal_i (a, pri, ult);
        if (cant = 0) then
            writeln ('No existen ISBNs entre ',pri,' y ',ult)
        else
            writeln ('La cantidad entre ',pri,' y ',ult,' es ',cant);
        writeln;
    end;
    
    Function CantidadTotal_ii (a: ArbolLista; pri, ult: integer): integer;
    var
        l: lista;
        cant: integer;
    begin
        if (a = nil) then
            CantidadTotal_ii:= 0
        else begin
            if (a^.codigo > pri - 1) and (a^.codigo < ult + 1) then begin
                l:= a^.ListaPrestamo;
                cant:= 0;
                while (l <> nil) do begin
                    cant:= cant + 1;
                    l:= l^.sig;
                end;
                CantidadTotal_ii:= cant + CantidadTotal_ii (a^.HI, pri, ult) + CantidadTotal_ii (a^.HD, pri, ult);
            end
            else
                CantidadTotal_ii:= CantidadTotal_ii (a^.HI, pri, ult) + CantidadTotal_ii (a^.HD, pri, ult);
        end;
    end;
    
    Procedure InformarCantidadTotal_ii (a: ArbolLista);
    var
        pri, ult, cant: integer;
    begin
        writeln ('A continuación ingrese dos valores ISBN para averiguar la cantidad total de préstamos realizados en ese rango.');
        writeln;
        writeln ('Ingrese el primer valor ISBN.');
        writeln;
        readln (pri);
        writeln;
        writeln ('Ingrese el segundo valor ISBN.');
        writeln;
        readln (ult);
        writeln;
        cant:= CantidadTotal_ii (a, pri, ult);
        if (cant = 0) then
            writeln ('No existen ISBNs entre ',pri,' y ',ult)
        else
            writeln ('La cantidad entre ',pri,' y ',ult,' es ',cant);
        writeln;
    end;
    
var
    Prestamos: ArbolPrestamo;
    ListasPrestamos: ArbolLista;
    ISBN_F, ISBN_G : ArbolISBN;
begin
    writeln;
    writeln ('---------- Inciso A ----------');
    writeln;
    randomize;
    CargarArboles (Prestamos, ListasPrestamos);
    InformarHojasDelArbol (Prestamos);
    writeln ('---------- Inciso B ----------');
    writeln;
    InformarISBNMasGrande (Prestamos);
    writeln ('---------- Inciso C ----------');
    writeln;
    InformarISBNMasChico (ListasPrestamos);
    writeln ('---------- Inciso D ----------');
    writeln;
    InformarCantidadDePrestamos_i (Prestamos);
    writeln ('---------- Inciso E ----------');
    writeln;
    InformarCantidadDePrestamos_ii (ListasPrestamos);
    writeln ('---------- Inciso F ----------');
    writeln;
    CrearArbolISBN_F (Prestamos, ISBN_F);
    InformarHojasDelArbolISBN (ISBN_F);
    CrearArbolISBN_G (ListasPrestamos, ISBN_G);
    writeln ('---------- Inciso H ----------');
    writeln;
    InformarHojasDelArbolISBN (ISBN_G);
    writeln ('---------- Inciso I ----------');
    writeln;
    InformarCantidadTotal_i (Prestamos);
    writeln ('---------- Inciso J ----------');
    writeln;
    InformarCantidadTotal_ii (ListasPrestamos);
    writeln ('---------- Fin del Programa ----------');
    writeln;
end.
