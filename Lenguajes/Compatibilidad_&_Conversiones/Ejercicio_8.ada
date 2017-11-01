-- Run @ https://www.jdoodle.com/execute-ada-online

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure reg_var is
    type FIGURA is (circulo,triangulo,rectangulo);
    type objeto (FORMA: FIGURA:=triangulo) is
    record
        case FORMA is
            when circulo => diametro : float;
            when triangulo => ladoizq : integer; ladoder : integer; angulo : float;
            when rectangulo => lado1 : integer; lado2 : integer;
        end case;
    end record;
    a: objeto; -- registro libre
    c: objeto (circulo); -- registro congelado
    r: objeto (FORMA => rectangulo); -- registro congelado
    r1: objeto (FORMA => rectangulo);
    t: objeto (FORMA => triangulo);
    lado:integer;
begin
    a := (FORMA => triangulo, ladoizq => 10, ladoder => 20, angulo => 45.00);
    t := a;
--    t := (FORMA => triangulo, ladoizq => 43, ladoder => 53 );
--    t := (FORMA => triangulo, 45,12,0.45);
--    c := (FORMA => rectangulo, lado1 => 100, lado2 => 50);
--    c := (diametro => 35.4 );
    c := (FORMA => circulo, diametro => 4.9);
    r := (FORMA => rectangulo, lado1 => 100, lado2 => 50);
    r1 := r;
    lado := r.lado1;
    Put_Line("lado es: "); Put(lado);
end reg_var;