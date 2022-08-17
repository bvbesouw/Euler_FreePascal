
PROGRAM problem_19;
{$mode ObjFPC}{$H+}

USES 
sysutils;

VAR count : longint;
  year,month: word;

BEGIN
  count := 0;
  FOR year := 1901 TO 2000 DO
    FOR month := 1 TO 12 DO
      IF dayofweek(encodedate(year,month,1)) = 1 THEN inc(count);
  writeln(count);
END.
