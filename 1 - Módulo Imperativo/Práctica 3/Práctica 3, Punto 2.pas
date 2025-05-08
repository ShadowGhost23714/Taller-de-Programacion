Program p3eje2;
type
    rangodia = 1..31;
    rangomes = 1..12;
    rangoano = 2020..2024;
    data = record
        dia: rangodia;
        mes: rangomes;
        ano: rangoano;
    end;
    venta = record
        codigo: integer;
        fecha: data;
        unidades: integer;
    end;
    arbolventas = ^nodoventas;
    nodoventas = record
        dato: venta;
        HI: arbolventas;
        HD: arbolventas;
    end;
    producto = record
        codigo: integer;
        unidades: integer;
    end;
    arbolproductos = ^nodoproductos;
    nodoproductos = record
        dato: producto;
        HI: arbolproductos;
        HD: arbolproductos;
    end;
    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;
    arbolcodigolista = ^nodocodigolista;
    nodocodigolista = record
        codigo: integer;
        ventas: lista;
        HI: arbolcodigolista;
        HD: arbolcodigolista;
    end;
    
    Procedure GenerarVenta (var v: venta);
    begin
        v.codigo:= random (51)*10;
        if (v.codigo <> 0) then begin
            v.fecha.dia:= 1 + random (31);
            v.fecha.mes:= 1 + random (12);
            v.fecha.ano:= 2020 + random (5);
            v.unidades:= 1 + random (1000);
        end;
    end;
    
    Procedure InsertarVenta (var a: arbolventas; elem: venta);
    Begin
        if (a = nil) then begin
            new(a);
            a^.dato:= elem;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (elem.codigo < a^.dato.codigo) then
                InsertarVenta(a^.HI, elem)
            else
                InsertarVenta(a^.HD, elem);
        end;
    end;
    
    Procedure CargarArbolVentas (var a: arbolventas); // Punto i
    var
        v: venta;
    begin
        GenerarVenta (v);
        while (v.codigo <> 0) do begin
            InsertarVenta (a, v);
            GenerarVenta (v);
        end;
    end;

    Procedure InsertarProducto (var a: arbolproductos; cod, unid: integer);
    Begin
        if (a = nil) then begin
            new(a);
            a^.dato.codigo:= cod;
            a^.dato.unidades:= unid;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else begin
            if (cod < a^.dato.codigo) then
                InsertarProducto (a^.HI, cod, unid)
            else if (cod > a^.dato.codigo) then
                InsertarProducto (a^.HD, cod, unid)
            else
                a^.dato.unidades:= a^.dato.unidades + unid;
        end;
    end;
    
    Procedure CargarArbolProductos (var ap: arbolproductos; av: arbolventas); // Punto ii
    begin
        if (av <> nil) then begin
            CargarArbolProductos (ap, av^.HI);
            InsertarProducto (ap, av^.dato.codigo, av^.dato.unidades);
            CargarArbolProductos (ap, av^.HD);
        end;
    end;
    
    Procedure AgregarAdelante (var l: lista; v: venta);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato:= v;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure AgregarNodo (var l: lista; cod: integer; a: arbolventas); 
    begin
        if (a <> nil) then begin
            if (a^.dato.codigo = cod) then
                AgregarAdelante (l, a^.dato);
            AgregarNodo (l, cod, a^.HI);
            AgregarNodo (l, cod, a^.HD);
        end;
    end;
    
    Procedure InsertarCodigoLista (var al: arbolcodigolista; av: arbolventas);
    Begin
        if (al = nil) then begin
            new(al);
            al^.codigo:= av^.dato.codigo;
            al^.ventas:= nil;
            AgregarNodo (al^.ventas, al^.codigo, av);
            al^.HI:= nil;
            al^.HD:= nil;
        end
        else begin
            if (av^.dato.codigo < al^.codigo) then
                InsertarCodigoLista (al^.HI, av)
            else
                InsertarCodigoLista (al^.HD, av)
        end;
    end;
    
    Procedure CargarArbolListas (var al: arbolcodigolista; av :arbolventas); // Punto iii
    Begin
        if (av <> nil) then begin
            CargarArbolListas (al, av^.HI);
            InsertarCodigoLista (al, av);
            CargarArbolListas (al, av^.HD);
        end;
    end;
    
    Procedure InformarVentas (a: arbolventas); 
    begin
        if (a <> nil) then begin
            InformarVentas (a^.HI);
            writeln ('codigo ',a^.dato.codigo);
            writeln (a^.dato.fecha.dia,'/',a^.dato.fecha.mes,'/',a^.dato.fecha.ano);
            writeln ('unidades ',a^.dato.unidades);
            writeln;
            InformarVentas (a^.HD);
        end;
    end;
    
    Procedure InformarProductos (a: arbolproductos); 
    begin
        if (a <> nil) then begin
            InformarProductos (a^.HI);
            writeln ('codigo ',a^.dato.codigo);
            writeln ('unidades ',a^.dato.unidades);
            writeln;
            InformarProductos (a^.HD);
        end;
    end;
    
    Function SumaProductosVendidos (a: arbolventas; dia: rangodia; mes: rangomes; ano: rangoano): integer;
    Begin
        if (a = nil) then 
            SumaProductosVendidos:= 0
        else if (dia = a^.dato.fecha.dia) and (mes = a^.dato.fecha.mes) and (ano = a^.dato.fecha.ano) then
            SumaProductosVendidos:= a^.dato.unidades + SumaProductosVendidos (a^.HI, dia, mes, ano) + SumaProductosVendidos (a^.HD, dia, mes, ano)
        else
            SumaProductosVendidos:= SumaProductosVendidos (a^.HI, dia, mes, ano) + SumaProductosVendidos (a^.HD, dia, mes, ano);
    end;
    
    Procedure BuscarFecha (a: arbolventas); // Punto B
    var
        DiaIngresado: rangodia;
        MesIngresado: rangomes;
        AnoIngresado: rangoano;
        Productosvendidos: integer;
    begin
        writeln ('Ingrese día, mes y año, entre 2020 y 2024, para saber la cantidad de productos vendidos en esa fecha.');
        writeln;
        readln (DiaIngresado);
        readln (MesIngresado);
        readln (AnoIngresado);
        writeln;
        Productosvendidos:= SumaProductosVendidos (a, DiaIngresado, MesIngresado, AnoIngresado);
        if (Productosvendidos = 0) then
            writeln ('No se encontraron productos vendidos el ',DiaIngresado,'/',MesIngresado,'/',AnoIngresado,'.')
        else
            writeln ('La cantidad de productos vendidos el ',DiaIngresado,'/',MesIngresado,'/',AnoIngresado,' es ', Productosvendidos,'.');
        writeln;
    end;
    
    Procedure MasUnidadesVendidas (a: arbolproductos; var cod, max: integer);
    begin
        if (a <> nil) then begin
            if (a^.dato.unidades > max) then begin
                max:= a^.dato.unidades;
                cod:= a^.dato.codigo;
            end;
            MasUnidadesVendidas (a^.HI, cod, max);
            MasUnidadesVendidas (a^.HD, cod, max);
        end;
    end;
    
    Procedure BuscarProducto (a: arbolproductos); // Punto B
    var
        MaxCod, MaxUnid: integer;
    begin
        MaxUnid:= -1;
        MasUnidadesVendidas (a, MaxCod, MaxUnid);
        writeln ('El codigo de producto ', MaxCod,' posee la mayor cantidad de unidades vendidas.');
        writeln;
    end;
    
    Function VentasTotales (l: lista): integer;
    var
        cant: integer;
    begin
        cant:= 0;
        while (l <> nil) do begin
            cant:= cant + 1;
            l:= l^.sig;
        end;
        VentasTotales:= cant;
    end;
    
    Procedure MasVentas (a: arbolcodigolista; var cod, max: integer);
    var
        cant: integer;
    begin
        if (a <> nil) then begin
            MasVentas (a^.HI, cod, max);
            cant:= VentasTotales (a^.ventas);
            if (cant > max) then begin
                max:= cant;
                cod:= a^.codigo;
            end;
            MasVentas (a^.HD, cod, max);
        end;
    end;
    
    Procedure BuscarVentas (a: arbolcodigolista);
    var
        MaxCod, MaxVentas: integer;
    begin
        MaxVentas:= -1;
        MaxCod := -1;
        MasVentas (a, MaxCod, MaxVentas);
        if (MaxCod = -1 ) then
            writeln('El árbol está vacío.')
        else
            writeln('El código de producto ', MaxCod, ' posee la mayor cantidad de ventas.');
        writeln;
    end;
    
var
	Ventas: arbolventas;
	Productos: arbolproductos;
	CarpetaDeVentas: arbolcodigolista;
begin
    randomize;
	CargarArbolVentas (Ventas);
	CargarArbolProductos (Productos, Ventas);
	CargarArbolListas (CarpetaDeVentas, Ventas);
	writeln;
	writeln ('Se muestran en pantalla de cada venta el codigo del producto vendido, la fecha y las unidades vendidas:');
    writeln;
	InformarVentas (Ventas);
    writeln ('Se muestran en pantalla los codigos y las unidades vendidas cada producto almacenado:');
    writeln;
	InformarProductos (Productos);
	BuscarFecha (Ventas);
	BuscarProducto (Productos);
	BuscarVentas (CarpetaDeVentas);
end.