PROGRAM problem_112;
{$mode ObjFPC}{$H+}

function IsBouncy(n: integer): boolean;
var
  lastDigit, currDigit: integer;
  increasing, decreasing: boolean;
begin
  increasing := true;
  decreasing := true;
  lastDigit := n mod 10;
  n := n div 10;
  while n > 0 do
  begin
    currDigit := n mod 10;
    if currDigit > lastDigit then
      decreasing := false
    else if currDigit < lastDigit then
      increasing := false;
    lastDigit := currDigit;
    n := n div 10;
  end;
  result := not (increasing or decreasing);
end;

var
  count, n: integer;
  proportion: real;
begin
  count := 0;
  n := 100;
  while true do
  begin
    if IsBouncy(n) then
      inc(count);
    proportion := count / n;
    if proportion >= 0.99 then
      break;
    inc(n);
  end;
  writeln(n);
end.
