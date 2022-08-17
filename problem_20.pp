
PROGRAM problem20;

USES 
gmp, SysUtils;

VAR 
  a: mpz_t;
  ot: PChar;
  i, sum : longint;
BEGIN
  mpz_fac_ui(a,100);
  ot := mpz_get_str(NIL, 10, a);
  sum := 0;
  FOR i := 0 TO pred(length(ot)) DO
    inc(sum,(ord(ot[i])-48));
  writeln(sum);
END.
