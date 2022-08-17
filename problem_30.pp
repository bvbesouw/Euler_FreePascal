
PROGRAM problem_30;

{$mode ObjFPC}{$H+}

USES math, euler;

CONST power = 5;

VAR total : qword;
  i,som,x : longint;
BEGIN
  total := 0;
  FOR i := 2 TO (power * intpower(9, power)) DO
    BEGIN
      som := 0;
      FOR x := 1 TO succ(num_of_digits(i)) DO
        som := som + intpower(getdigit(i, x), power);
      IF som = i THEN
        inc(total,som)
    END;
  writeln(total);
END.
