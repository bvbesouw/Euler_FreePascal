
PROGRAM problem_32;
{$mode ObjFPC}{$H+}

USES 
SysUtils, classes, euler;

// CONST
// to_be_checked = '123456789';

VAR 
  products, i, j: integer;
  s             : STRING;
  list          : tstringlist;

BEGIN
  list := tstringlist.create;
  list.Sorted := true;
  list.Duplicates := dupIgnore;
  products := 0;
  FOR i := 1 TO 8 DO
    FOR j := 999 TO 9999 DO
      BEGIN
        s := inttostr(i) + inttostr(j) + inttostr(i * j);
        IF IsPandigital(s) THEN
          list.add(inttostr(i * j))
        ELSE IF length(s) > 9 THEN
               break;
      END;

  // for double digit multiplicand
  FOR i := 9 TO 99 DO
    FOR j := 99 TO 999 DO
      BEGIN
        s := inttostr(i) + inttostr(j) + inttostr(i * j);
        IF isPandigital(s) THEN
          list.add(inttostr(i * j))
        ELSE IF length(s) > 9 THEN
               break;
      END;
  FOR i := 0 TO pred(list.count) DO
    inc(products, strtoint(list[i]));
  writeln(products);
END.
