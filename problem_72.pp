
PROGRAM problem_72;
{$mode ObjFPC}{$H+}

VAR phi : array[0..1000000] OF int64;

FUNCTION sol(limit :longint) : int64;

VAR i,j: int64;

BEGIN
  FOR i := 0 TO limit DO
    phi[i] := i-1;
  FOR i := 2 TO limit DO
    IF phi[i] = (i - 1) THEN
      BEGIN
        j := 2*i;
        WHILE j <= limit DO
          BEGIN
            phi[j] := phi[j] - trunc(phi[j] / i);
            inc(j,i);
          END;
      END;
  result := 0;
  FOR i := 1 TO limit DO
    inc(result,phi[i]);
END;

BEGIN
  writeln(sol(1000000));
END.
