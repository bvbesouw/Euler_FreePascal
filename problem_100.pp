
PROGRAM problem_100;
{$mode ObjFPC}{$H+}

VAR 
  blue, total, tmp: Int64;

BEGIN
  blue := 15;
  total := 21;

  WHILE total < 1000000000000 DO
    BEGIN
      tmp := blue;
      blue := 3 * blue + 2 * total - 2;
      total := 4 * tmp + 3 * total - 3;
    END;

  writeln(blue);
END.
