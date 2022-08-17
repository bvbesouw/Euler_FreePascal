
PROGRAM problem_5;
{$mode ObjFPC}{$H+}

USES 
Math;

CONST 
  top                           = 20;
  p: ARRAY [1 .. 10] OF longint = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29);

VAR 
  i, res: longint;
  log_n : real;

BEGIN
  i := 1;
  res := 1;
  log_n := log10(top);
  WHILE p[i] <= sqrt(top) DO
    BEGIN
      res := res * trunc(intpower(p[i], trunc(log_n / log10(p[i]))));
      Inc(i);
    END;
  WHILE p[i] <= top DO
    BEGIN
      res := res * p[i];
      Inc(i);
    END;
  Writeln(res);
END.
