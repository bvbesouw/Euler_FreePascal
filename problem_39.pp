
PROGRAM problem_39;
{$mode ObjFPC}{$H+}

CONST 
  max_value = 1000;

VAR 
  arr                 : ARRAY [0 .. max_value] OF integer;
  a, b, max, perimeter: integer;
  c                   : real;

BEGIN
  FOR a := 1 TO max_value DIV 2 DO
    FOR b := a TO max_value DIV 2 DO
      BEGIN
        c := sqrt(a * a + b * b);
        IF (int(c) = c) AND ((a + b + c) <= max_value) THEN
          inc(arr[a + b + trunc(c)]);
      END;

  max := 0;
  perimeter := 0;
  FOR a := LOW(arr) TO HIGH(arr) DO
    IF arr[a] > max THEN
      BEGIN
        max := arr[a];
        perimeter := a;
      END;
  writeln(perimeter);
END.
