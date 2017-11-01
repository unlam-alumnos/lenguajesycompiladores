-- Run @ https://www.jdoodle.com/execute-ada-online

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure jdoodle is
  type COLOR is (WHITE, RED, GREEN, BLUE, YELLOW, BROWN, BLACK);
  type RGB is new COLOR range RED..BLUE;
  type SMALLINT is new Integer range -1000..1000;
  subtype PAGENUMBER is SMALLINT range 0..100;
  windowColor: COLOR;
  lineColor: RGB;
  page: PAGENUMBER;
  interval: SMALLINT;
  length, marginRight: Float;
  
begin

    -- 1 -- 
    windowColor := RED;
    lineColor := RGB(windowColor);
    
    -- 2 --
    page := PAGENUMBER(Integer(length)/25);
    
    -- 3 --
    interval := SMALLINT(page);
    
    -- 4 --
    page := PAGENUMBER(interval);
    
    -- 5 --
    marginRight := Float(interval * page - PAGENUMBER(length / 0.698));
    
    -- 6 --
    interval := page;     
    
    -- 7 --
    interval:= PAGENUMBER(Integer(length)/25);                     
    
    -- 8 --
    page := 100;         
    
    -- 9 --
    interval := page + 1;                                           
    
    -- 10 --
    -- interval := page + 10000;
    interval := page + 900;                                       
    
end jdoodle;
