
PROGRAM problem_40;
{$mode ObjFPC}{$H+}

USES 
SysUtils;

VAR 
  a: STRING;
  i: integer;

BEGIN
  a := '';
  i := 0;

  REPEAT
    inc(i);
    a := a + inttostr(i);
  UNTIL length(a) >= 1000000;

  writeln((ord(a[1]) - 48) * (ord(a[10]) - 48) * (ord(a[100]) - 48) *
  (ord(a[1000]) - 48) * (ord(a[10000]) - 48) * (ord(a[100000]) - 48) *
  (ord(a[1000000]) - 48));

END.
