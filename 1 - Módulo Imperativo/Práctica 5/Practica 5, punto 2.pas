Program Practica5actividad2;
type
    subrango = 2010..2018;
    
    auto = record
        patente: integer;
        ano: subrango;
        marca: string;
        modelo: string;
    end;
    arbolPatente = ^hojaPatente;
    hojaPatente = record
        dato: auto;
        HI: arbolPatente;
        HD: arbolPatente;
    end;
    
    autoMarca = record
        patente: integer;
        ano: subrango;
        modelo: string;
    end;
    lista = ^nodo;
    nodo = record
        dato: autoMarca;
        sig: lista;
    end;
    listaMarca = record
        marca: string;
        info: lista;
    end;
    arbolMarca = ^hojaMarca;
    hojaMarca = record
        dato: listaMarca;
        HI: arbolMarca;
        HD: arbolMarca;
    end;

    
    Procedure LeerAutos (var a: auto);
    begin
        readln (a.marca);
        if (a.marca <> 'MMM') then begin
            readln (a.patente);
            readln (a.ano);
            readln (a.modelo);
        end;
    end;
    
    Procedure InsertarHojaPatente (var ap: arbolPatente; a: auto);
    begin
        if (ap = nil) then begin
            new (ap);
            ap^.dato:= a;
            ap^.HI:= nil;
            ap^.HD:= nil;
        end
        else begin
            if (a.patente < ap^.dato.patente) then
                InsertarHojaPatente (ap^.HI, a)
            else
                InsertarHojaPatente (ap^.HI, a);
        end;
    end;
    
    Procedure AgregarAdelante (var l: lista; a: auto);
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato.patente:= a.patente;
        nue^.dato.ano:= a.ano;
        nue^.dato.modelo:= a.modelo;
        nue^.sig:= l;
        l:= nue;
    end;
    
    Procedure InsertarHojaMarca (var am: arbolMarca; a: auto);
    begin
        if (am = nil) then begin
            new (am);
            am^.dato.marca:= a.marca;
            am^.dato.info:= nil;
            AgregarAdelante (am^.dato.info, a);
            am^.HI:= nil;
            am^.HD:= nil;
        end
        else begin
            if (a.marca = am^.dato.marca) then
                AgregarAdelante (am^.dato.info, a)
            else begin
                if (a.marca < am^.dato.marca) then
                    InsertarHojaMarca (am^.HI, a)
                else
                    InsertarHojaMarca (am^.HI, a);
            end;
        end;
    end;
    
    Procedure CargarArboles (var ap: arbolPatente; var am: arbolMarca);
    var
        a: auto;
    begin
        LeerAutos (a);
        while (a.marca <> 'MMM') do begin
            InsertarHojaPatente (ap, a);
            InsertarHojaMarca (am, a);
            LeerAutos (a);
        end;
    end;
    
    Function CantidadDeMarca_i (a: arbolPatente; mrc: string): integer;
    begin
        if (a = nil) then
            CantidadDeMarca_i:= 0
        else begin
            if (a^.dato.marca = mrc) then
                CantidadDeMarca_i:= 1 + CantidadDeMarca_i (a^.HI, mrc) + CantidadDeMarca_i (a^.HD, mrc)
            else
                CantidadDeMarca_i:= CantidadDeMarca_i (a^.HI, mrc) + CantidadDeMarca_i (a^.HD, mrc);
        end;
    end;
    
    Procedure InformarCantidadDeMarca_i (a: arbolPatente);
    var
        cant: integer;
        mrc: string;
    begin
        readln (mrc);
        cant:= CantidadDeMarca_i (a, mrc);
        if (cant = 0) then 
            writeln ('No hay existen autos correspondientes a ',mrc)
        else
            writeln ('La cantidad de autos ',mrc,' es ',cant);
        writeln;
    end;
    
    Function CantidadDeMarca_ii (a: arbolMarca; mrc: string): integer;
    var
        l: lista;
        cant: integer;
    begin
        if (a = nil) then
            CantidadDeMarca_ii:= 0
        else begin
            if (a^.dato.marca = mrc) then begin
                l:= a^.dato.info;
                cant:= 0;
                while (l <> nil) do begin
                    cant:= cant + 1;
                    l:= l^.sig;
                end;
                CantidadDeMarca_ii:= cant;
            end
            else begin
                if (a^.dato.marca > mrc) then
                    CantidadDeMarca_ii:= CantidadDeMarca_ii (a^.HI, mrc)
                else
                    CantidadDeMarca_ii:= CantidadDeMarca_ii (a^.HD, mrc);
            end;
        end;
    end;
    
    Procedure InformarCantidadDeMarca_ii (a: arbolMarca);
    var
        cant: integer;
        mrc: string;
    begin
        readln (mrc);
        cant:= CantidadDeMarca_ii (a, mrc);
        if (cant = 0) then 
            writeln ('No hay existen autos correspondientes a ',mrc)
        else
            writeln ('La cantidad de autos ',mrc,' es ',cant);
        writeln;
    end;
    
    Procedure InsertarHojaAnio (var af: arbolPatente; a: auto);
    begin
        if (af = nil) then begin
            new (af);
            af^.dato:= a;
            af^.HI:= nil;
            af^.HD:= nil;
        end
        else begin
            if (a.ano < af^.dato.ano) then
                InsertarHojaAnio (af^.HI, a)
            else
                InsertarHojaAnio (af^.HI, a);
        end;
    end;
    
    Procedure CrearArbolFabricaion (var af: arbolPatente; ap: arbolPatente);
    begin
        if (ap <> nil) then begin
            CrearArbolFabricaion (af, ap^.HI);
            InsertarHojaAnio (af, ap^.dato);
            CrearArbolFabricaion (af, ap^.HD);
        end;
    end;
    
    Function Modelo_i (a: arbolPatente; pat: integer): string;
    begin
        if (a = nil) then
            Modelo_i:= 'ZZZ'
        else begin
            if (a^.dato.patente = pat) then
                Modelo_i:= a^.dato.modelo
            else begin
                if (a^.dato.patente > pat) then
                    Modelo_i:= Modelo_i (a^.HI, pat)
                else
                    Modelo_i:= Modelo_i (a^.HD, pat);
            end;
        end;
    end;
    
    Procedure InformarModelo_i (a: arbolPatente);
    var
        pat: integer;
        model: string;
    begin
        readln (pat);
        model:= Modelo_i (a, pat);
        if (model = 'ZZZ') then
            writeln ('No existe un modelo de auto con patente ',pat)
        else
            writeln ('El modelo de la patente ',pat,' es ',model);
        writeln;
    end;
    
    Function Modelo_ii (a: arbolMarca; pat: integer): string;
    var
        l: lista;
    begin
        if (a = nil) then
            Modelo_ii:= 'ZZZ'
        else begin
            l:= a^.dato.info;
            while (l <> nil) and (l^.dato.patente <> pat) do
                l:= l^.sig;
            if (l <> nil) and (l^.dato.patente = pat) then
                Modelo_ii:= l^.dato.modelo
            else begin
                Modelo_ii:= Modelo_ii (a^.HI, pat);
                if (Modelo_ii = 'ZZZ') then
                    Modelo_ii:= Modelo_ii (a^.HD, pat);
            end;
        end;
    end;
    
    Procedure InformarModelo_ii (a: arbolMarca);
    var
        pat: integer;
        model: string;
    begin
        readln (pat);
        model:= Modelo_ii (a, pat);
        if (model = 'ZZZ') then
            writeln ('No existe un modelo de auto con patente ',pat)
        else
            writeln ('El modelo de la patente ',pat,' es ',model);
        writeln;
    end;
    
var
    Patentes, Fabricacion: arbolPatente;
    Marcas: arbolMarca;
begin
    CargarArboles (Patentes, Marcas);
    InformarCantidadDeMarca_i (Patentes);
    InformarCantidadDeMarca_ii (Marcas);
    CrearArbolFabricaion (Fabricacion, Patentes);
    InformarModelo_i (Patentes);
    InformarModelo_ii (Marcas);
end.