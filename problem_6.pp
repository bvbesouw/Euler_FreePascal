
PROGRAM problem_6;
{$mode ObjFPC}{$H+}

USES 
math;

VAR 
  n, sum1, sum2: longint;

BEGIN
  sum1 := 0;
  sum2 := 0;
  FOR n := 1 TO 100 DO
    BEGIN
      Inc(sum1, n * n);
      Inc(sum2, n);
    END;
  sum2 := sum2 * sum2;
  writeln(max(sum1, sum2) - min(sum1, sum2));
END.
