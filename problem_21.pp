
PROGRAM problem_21;
{$mode ObjFPC}{$H+}

USES 
euler,
sysutils;

VAR 
  a, b, sum: longint;

BEGIN
  sum := 0;
  FOR a := 3 TO 10000 DO
    BEGIN
      b := sum_of_divisors(a);
      IF (a <> b) AND (sum_of_divisors(b) = a) THEN
        inc(sum, a);
    END;
  writeln(sum);
END.
