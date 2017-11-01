// Run @ https://www.jdoodle.com/execute-pascal-online

Program AddNums(output);
type figura = (circulo,triangulo,rectangulo);
objeto = record
            case forma : figura of
                circulo: (diametro : real);
                triangulo: (ladoizq : integer; ladoder : integer; angulo : real);
                rectangulo: (lado1 : integer; lado2 : integer)
        end;
var
    cuerpo : objeto;
    lado : integer;

begin
    cuerpo.forma := circulo; 
    cuerpo.forma := rectangulo;
    cuerpo.lado1:= 1; 
    cuerpo.diametro :=2.73;
    lado:=cuerpo.lado1; 
end.
