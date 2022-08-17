
PROGRAM problem_28;

{$mode ObjFPC}{$H+}

VAR n,sum, size : qword;
BEGIN
  sum := 1;
  size := 1001;
  n := 3;
  REPEAT
    sum := sum +4*n*n - 6*n + 6;
    inc(n,2)
  UNTIL n>size;
  writeln(sum);
END.
