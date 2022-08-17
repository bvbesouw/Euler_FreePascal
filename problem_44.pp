
PROGRAM problem_44;

{$mode ObjFPC}{$H+}

USES 
SysUtils,
euler;

VAR 

  a, b, i, j: integer;
  flag      : boolean;

BEGIN
  flag := True;
  i := 1;
  WHILE flag DO
    BEGIN
      FOR j := 1 TO i DO
        BEGIN
          a := i * (3 * i - 1) DIV 2;
          b := j * (3 * j - 1) DIV 2;
          IF IsPentagonal(a + b) AND IsPentagonal(a - b) THEN
            BEGIN
              writeln(a - b);
              flag := False;
              break
            END;
        END;
      inc(i);
    END;
END.
