
PROGRAM problem_45;
{$mode ObjFPC}{$H+}

USES 
math,euler;

VAR 
  Triangle, i: qword;
  top : qword;

BEGIN
  top := 0;
  i := 285;
  REPEAT
    inc(i);
    triangle := i * (i + 1) DIV 2;
    IF triangle > top THEN top := triangle
    ELSE
      writeln(i,'   ',triangle);
  UNTIL IsPentagonal(triangle) AND IsHexagonal(triangle);
  writeln(triangle);
END.
