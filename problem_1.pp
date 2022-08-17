
PROGRAM problem_1;

VAR 
  x, sum: longint;

BEGIN
  sum := 0;
  FOR x := 1 TO 999 DIV 3 DO
    Inc(sum, x * 3);
  FOR x := 1 TO 999 DIV 5 DO
    Inc(sum, x * 5);
  FOR x := 1 TO 999 DIV 15 DO
    Dec(sum, x * 15);
  writeln(sum);
END.
