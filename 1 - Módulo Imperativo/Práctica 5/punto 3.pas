program Practica5actividad3;
type
    rangorubro = 1..11;
    producto = record
        codigo: integer;
        rubro: rangorubro;
        stock: integer;
        precioUnitario: real;
    end;
    arbol = ^hoja;
    hoja = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure GenerarProducto (var p: producto);
    begin
        p.codigo:= random (101);
        if (p.codigo <> 0) then begin
            p.rubro:= random (10) + 1;
            p.stock:= 0;
            p.precioUnitario:= 0;
        end;
    end;
    
    Procedure InsertarDatos (var a: arbol; p: producto);
    begin
        if (a = nil) then begin
            new (a);
            a^.dato:= p;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (p.rubro < a^.dato.rubro) then
                InsertarDatos (a^.HI, p)
            else if (p.rubro > a^.dato.rubro) then
                InsertarDatos (a^.HD, p)
            else begin
                if (p.codigo < a^.dato.codigo) then
                    InsertarDatos (a^.HI, p)
                else
                    InsertarDatos (a^.HD, p);
            end;
        end;
    end;
    
    Procedure GenerarArbol (var a: arbol);
    var
        p: producto;
    begin
        GenerarProducto (p);
        while (p.codigo <> 0) do begin
            InsertarDatos (a, p);
            GenerarProducto (p);
        end;
    end;
    
    Procedure InformarArbol (a: arbol);
    begin
        if (a <> nil) then begin
            InformarArbol (a^.HI);
            writeln ('Rubro ',a^.dato.rubro);
            writeln ('codigo ',a^.dato.codigo);
            writeln;
            InformarArbol (a^.HD);
        end;
    end;
    
    Function Existencia (a: arbol; rub: rangorubro; cod: integer): boolean;
    begin
        if (a = nil) then
            Existencia:= false
        else if (rub = a^.dato.rubro) and (cod = a^.dato.codigo) then
            Existencia:= true
        else begin
            if (rub < a^.dato.rubro) then
                Existencia:= Existencia (a^.HI, rub, cod)
            else if (rub > a^.dato.rubro) then
                Existencia:= Existencia (a^.HD, rub, cod)
            else begin
                if (cod < a^.dato.codigo) then
                    Existencia:= Existencia (a^.HI, rub, cod)
                else
                    Existencia:= Existencia (a^.HD, rub, cod);
            end;
        end;
    end;
    
    Procedure InformarExistencia (a: arbol);
    var
        rub: rangorubro;
        cod: integer;
    begin
        writeln ('Ingrese un número de rubro y un número de código de un producto para saber si existe.');
        writeln;
        writeln ('Ingrese el rubro.');
        writeln;
        readln (rub);
        writeln;
        writeln ('Ingrese el código.');
        writeln;
        readln (cod);
        writeln;
        if (Existencia (a, rub, cod)) then
            writeln ('El producto del rubro ',rub,' y código ',cod,' existe.')
        else
            writeln ('El producto del rubro ',rub,' y código ',cod,' no existe.');
        writeln;
    end;
    
var
    Productos: arbol;
begin
    randomize;
    GenerarArbol (Productos); // Punto A
    InformarArbol (Productos);
    writeln ('---------- Inciso B ----------');
    writeln;
    InformarExistencia (Productos);
end.