Program Practica4Actividad1;
type
    producto = record
        codigo: integer;
        cantidadTotal: integer;
        montoTotal: real;
    end;
    venta = record
        codigoVenta: integer;
        codigoProducto: integer;
        unidadesVendidas: integer;
        precioUnitario: real;
    end;
    arbol = ^hoja;
    hoja = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;
    
    Procedure GenerarVenta (var v: venta);
    begin
        v.codigoVenta:= random (51) * 100;
        if (v.codigoVenta <> 0) then begin
            v.codigoProducto:= 1 + random (100);
            v. unidadesVendidas:= 1 + random (15);
            v.precioUnitario:= (100 + random (100)) / 2;
        end;
    end;
    
    Procedure ArmardProducto (var p: producto; v: venta);
    begin
        p.codigo:= v.codigoProducto;
        p.cantidadTotal:= v.unidadesVendidas;
        p.montoTotal:= v.unidadesVendidas * v.precioUnitario;
    end;
    
    Procedure InsertarDatos (var a: arbol; v : venta);
    begin
        if (a = nil) then begin
            new (a);
            ArmardProducto (a^.dato, v);
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (v.codigoProducto = a^.dato.codigo) then begin
                a^.dato.cantidadTotal:= a^.dato.cantidadTotal + v.unidadesVendidas;
                a^.dato.montoTotal:= a^.dato.montoTotal + (v.unidadesVendidas * v.precioUnitario);
            end
            else begin
                if (v.codigoProducto < a^.dato.codigo) then
                    InsertarDatos (a^.HI, v)
                else
                    InsertarDatos (a^.HD, v);
            end;
        end;
    end;
    
    Procedure CargarArbol (var a: arbol); // Punto A
    var
        v: venta;
    begin
        GenerarVenta (v);
        while (v.codigoVenta <> 0) do begin
            InsertarDatos (a, v);
            GenerarVenta (v);
        end;
    end;
    
    Procedure InformaArbolProductos (a: arbol);
    begin
        if (a <> nil) then begin
            InformaArbolProductos (a^.HI);
            writeln ('Código de producto ', a^.dato.codigo);
            writeln ('Cantidad total de unidades vendidas = ', a^.dato.cantidadTotal);
            writeln ('Monto total $', a^.dato.montoTotal);
            writeln;
            InformaArbolProductos (a^.HD);
        end;
    end;
    
    Procedure ModuloB (a: arbol); // Punto B
    begin
        writeln ('---------- Módulo B ----------');
        writeln;
        if (a = nil) then begin
            writeln ('El árbol está vacío');
            writeln;
        end
        else
            InformaArbolProductos (a);
    end;
    
    Function BuscarMinimo (a: arbol): integer;
    begin
        if (a = nil) then
            BuscarMinimo:= 9999
        else begin
            if (a^.HI = nil) then
                BuscarMinimo:= a^.dato.codigo
            else
                BuscarMinimo:= BuscarMinimo (a^.HI);
        end;
    end;
    
    Procedure ModuloC (a: arbol);
    var
        minimo: integer;
    begin
        writeln ('---------- Módulo C ----------');
        writeln;
        minimo:= BuscarMinimo (a);
        if (minimo = 9999) then
            writeln ('El árbol está vacío')
        else
            writeln ('El menor código de producto es ', minimo);
        writeln;
    end;
    
    Function TotalMenores (a: arbol; valor: integer): integer;
    begin
        if (a = nil) then
            TotalMenores:= 0
        else begin
            if (a^.dato.codigo < valor) then
                TotalMenores:= 1 + TotalMenores (a^.HI, valor) + TotalMenores (a^.HD, valor)
            else
                TotalMenores:= TotalMenores (a^.HI, valor) + TotalMenores (a^.HD, valor);
        end;
    end;
    
    Procedure ModuloD (a: arbol);
    var
        Valor, total: integer;
    begin
        writeln ('---------- Módulo D ----------');
        writeln;
        writeln ('Ingrese un valor para retornar la cantidad de códigos menores al valor ingresado.');
        writeln;
        readln (valor);
        writeln;
        total:= TotalMenores (a, valor);
        if (total = 0) then
            writeln ('Ningún código es menor a ', valor)
        else
            writeln ('La cantidad total es ', total);
        writeln;
    end;
    
    Function ObtenerMontoTotalEntreDosValores (a: arbol; pri, ult: integer): real;
    begin
        if (a = nil) then
            ObtenerMontoTotalEntreDosValores:= 0
        else begin
            if (a^.dato.codigo > pri) and (a^.dato.codigo < ult) then
                ObtenerMontoTotalEntreDosValores:= a^.dato.montoTotal + ObtenerMontoTotalEntreDosValores (a^.HI, pri, ult) + ObtenerMontoTotalEntreDosValores (a^.HD, pri, ult)
            else
                ObtenerMontoTotalEntreDosValores:= ObtenerMontoTotalEntreDosValores (a^.HI, pri, ult) + ObtenerMontoTotalEntreDosValores (a^.HD, pri, ult);
        end;
    end;
    
    Procedure ModuloE (a : arbol);
    var
        pri, ult: integer;
        total: real;
    begin
        writeln ('---------- Módulo E ----------');
        writeln;
        writeln ('Ingrese dos valores para retornar el monto total entre todos los códigos de productos comprendidos en ese rango.');
        writeln;
        writeln ('Ingrese el primer valor.');
        writeln;
        readln (pri);
        writeln;
        writeln ('Ingrese el segundo valor.');
        writeln;
        readln (ult);
        writeln;
        total:= ObtenerMontoTotalEntreDosValores (a, pri, ult);
        if (total = 0) then
            writeln ('No hay códigos entre ',pri,' y ',ult)
        else
            writeln ('El monto total entre ',pri,' y ',ult,' es ',total);
        writeln;
    end;
    
var
    ArbolProductos: arbol;
begin
    randomize;
    CargarArbol (ArbolProductos);
    writeln;
    ModuloB (ArbolProductos);
    ModuloC (ArbolProductos);
    ModuloD (ArbolProductos);
    ModuloE (ArbolProductos);
end.