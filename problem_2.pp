
PROGRAM problem_2;

VAR 
  x, y, sum, total: longint;
BEGIN
  x := 1;
  y := 1;
  sum := 0;
  total := x + y;
  REPEAT
    IF NOT odd(total) THEN Inc(sum, total);
    x := y;
    y := total;
    total := x + y;
  UNTIL total > 4000000;
  writeln(sum);
END.
