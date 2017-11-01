-- Run @ https://www.jdoodle.com/execute-ada-online

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure jdoodle is
    subtype smallFloat is Float range 0.0..10.0;  
    type smallsmallFloat is new Float range 0.0..10.0;    
    area, coeficiente, promedio, total : Float;   
    suma, cantidad                     : Integer;   
    caracter                           : character;   
    pi                                 : constant := 3.14159_26536; 
    radio                              : smallFloat;  
    radio1                             : smallsmallFloat;  
begin
    cantidad := coeficiente + promedio * 2.85;        -- 1    
    suma := (cantidad - 15.7) + suma;                 -- 2   
    promedio := suma / cantidad;                      -- 3   
    cantidad := caracter;                             -- 4   
    area := pi * (radio * radio);                     -- 5   
    area:= smallsmallFloat (pi) * (radio1 * radio1);  -- 6  
end jdoodle;
