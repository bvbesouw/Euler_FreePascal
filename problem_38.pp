
PROGRAM problem_38;
{ used algorithm from https://www.xarg.org/puzzle/project-euler/problem-38/ }
{$mode ObjFPC}{$H+}

USES 
SysUtils,euler;

VAR 
  x, res: integer;

BEGIN
  FOR x := 10000 DOWNTO 1 DO
    BEGIN
      res := 100002 * x;
      IF (IsPandigital(inttostr(res))) THEN
        BEGIN
          writeln(res);
          break;
        END;
    END;
END.
