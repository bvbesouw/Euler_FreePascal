
PROGRAM problem29;

USES gmp, Classes;

VAR 
  a: mpz_t;
  i,j: longint;
  Str: TStringList;

BEGIN
  Str := TStringList.Create;
  str.sorted := true;
  str. Duplicates := dupIgnore;
  mpz_set_ui(a, 1);
  FOR i := 2 TO 100 DO
    FOR j := 2 TO 100 DO
      BEGIN
        mpz_ui_pow_ui(a,i,j);
        str.add(mpz_get_str(NIL, 10, a));
      END;
  writeln(str.count);
END.
