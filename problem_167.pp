
PROGRAM problem_179;
{$mode ObjFPC}{$H+}

CONST MAX = 10000000;

VAR arr : array[0..max] OF longint;
  i,j,count : longint;

BEGIN
  FOR i := 2 TO MAX DIV 2 DO
    BEGIN
      j := i+i;
      WHILE j < MAX DO
        BEGIN
          inc(arr[j]);
          inc(j,i);
        END;
    END;
  count := 0;
  FOR i := 3 TO max DO
    IF arr[i] = arr[i+1] THEN inc(count);
  writeln(count);
END.
