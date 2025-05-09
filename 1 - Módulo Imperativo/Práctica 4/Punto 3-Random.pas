Program Practica4Actividad3;
type
    producto = record
        codigo: integer;
        totalVendidas: integer;
        montoTotal: real;
    end;
    venta = record
        codigoVenta: integer;
        codigoPrducto: integer;
        unidVendidas: integer;
        precioUnitario: real;
    end;
    arbol = ^hoja;
    hoja= record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure GenerarVenta (var v: venta);
    begin
        v.codigoVenta:= random (51)*100;
        if (v.codigoVenta <> 0) then begin
            v.codigoPrducto:= random (100) + 1;
            v.unidVendidas:= random(15) + 1;
            v.precioUnitario:= (100 + random (100))/2;
        end;
    end;
    
    Procedure ArmarProducto (var p: producto; v: venta);
    begin
        p.codigo:= v.codigoPrducto;
        p.totalVendidas:= v.unidVendidas;
        p.montoTotal:= v.unidVendidas * v.precioUnitario;
    end;
    
    Procedure InsertarDatos (var a: arbol; v: venta);
    begin
        if (a = nil) then begin
            new (a);
            ArmarProducto (a^.dato, v);
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (a^.dato.codigo = v.codigoPrducto) then begin
                a^.dato.totalVendidas:= a^.dato.totalVendidas + v.unidVendidas;
                a^.dato.montoTotal:= a^.dato.montoTotal + (v.unidVendidas * v.precioUnitario);
            end
            else begin
                if (v.codigoPrducto < a^.dato.codigo) then
                    InsertarDatos (a^.HI, v)
                else
                    InsertarDatos (a^.HD, v);
            end;
        end;
    end;
    
    Procedure CargarArbol (var a: arbol);
    var
        v: venta;
    begin
        GenerarVenta (v);
        while (v.codigoVenta <> 0) do begin
            InsertarDatos (a, v);
            GenerarVenta (v);
        end;
    end;
    
    Procedure InformarHojasDelArbol (a: arbol);
    begin
        if (a <> nil) then begin
            InformarHojasDelArbol (a^.HI);
            writeln ('Código de producto ',a^.dato.codigo);
            writeln ('Unidades vendidas totales = ',a^.dato.totalVendidas);
            writeln ('Monto total $',a^.dato.montoTotal:2:2);
            writeln;
            InformarHojasDelArbol (a^.HD);
        end;
    end;
    
    Procedure MasVentas (a: arbol; var cod: integer; unid: integer);
    begin
        if (a <> nil) then begin
            if (a^.dato.totalVendidas > unid) then begin
                unid:= a^.dato.totalVendidas;
                cod:= a^.dato.codigo;
            end;
            MasVentas (a^.HI, cod, unid);
            MasVentas (a^.HD, cod, unid);
        end;
    end;
    
    Procedure InformarMasVentas (a: arbol);
    var
        cod, unid: integer;
    begin
        cod:= -1;
        unid:= -1;
        MasVentas (a, cod, unid);
        If (cod <> -1) then 
            writeln ('El código de producto ',cod,' es el que posee la mayor cantidad de unidades vendidas.')
        else
            writeln ('El árbol está vacío.');
        writeln;
    end;
    
    Function MenoresQueValor (a: arbol; valor: integer): integer;
    begin
        if (a = nil) then
            MenoresQueValor:= 0
        else begin
            if (a^.dato.codigo < valor) then
                MenoresQueValor:= 1 + MenoresQueValor (a^.HI, valor) + MenoresQueValor (a^.HD, valor)
            else
                MenoresQueValor:= MenoresQueValor (a^.HI, valor) + MenoresQueValor (a^.HD, valor);
        end;
    end;
    
    Procedure InformarMenoresQueValor (a: arbol);
    var
        cant, valor: integer;
    begin
        writeln ('Ingrese un valor para saber la cantidad de códigos de que son menor a este.');
        writeln;
        readln (valor);
        writeln;
        cant:= MenoresQueValor (a, valor);
        if (cant <> 0) then
            writeln ('La cantidad es ',cant)
        else
            writeln ('No existen códigos menores al valor ingresado');
        writeln;
    end;
    
    Function MontoTotalEntreDosValores (a: arbol; pri, ult: integer): real;
    begin
        if (a = nil) then
            MontoTotalEntreDosValores:= 0
        else begin
            if (a^.dato.codigo > pri) and (a^.dato.codigo < ult) then
                MontoTotalEntreDosValores:= a^.dato.montoTotal + MontoTotalEntreDosValores (a^.HI, pri, ult) + MontoTotalEntreDosValores (a^.HD, pri, ult)
            else
                MontoTotalEntreDosValores:= MontoTotalEntreDosValores (a^.HI, pri, ult) + MontoTotalEntreDosValores (a^.HD, pri, ult);
        end;
    end;
    
    Procedure InformarMontoTotalEntreDosValores (a: arbol);
    var
        pri, ult: integer;
        total: real;
    begin
        writeln ('Ingrese dos valores para saber el monto total en entre todos los códigos de productos comprendidos entre esos dos valores.');
        writeln;
        writeln ('Ingrese el primer valor.');
        writeln;
        readln (pri);
        writeln;
        writeln ('Ingrese el segundo valor.');
        writeln;
        readln (ult);
        writeln;
        total:= MontoTotalEntreDosValores (a, pri, ult);
        if (total <> 0) then
            writeln ('El monto total entre ',pri,' y ',ult,' es $',total:2:2)
        else
            writeln ('No existen códigos entre ',pri,' y ',ult);
        writeln;
    end;
    
var
    ArbolProductos: arbol;
begin
    randomize;
    CargarArbol (ArbolProductos);
    writeln;
    writeln ('---------- Inciso B ----------');
    writeln;
    InformarHojasDelArbol (ArbolProductos);
    writeln;
    writeln ('---------- Inciso C ----------');
    writeln;
    InformarMasVentas (ArbolProductos);
    writeln;
    writeln ('---------- Inciso D ----------');
    writeln;
    InformarMenoresQueValor (ArbolProductos);
    writeln;
    writeln ('---------- Inciso D ----------');
    writeln;
    InformarMontoTotalEntreDosValores (ArbolProductos);
end.