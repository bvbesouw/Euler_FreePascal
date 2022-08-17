
PROGRAM Problem_48;

USES gmp, sysutils;

CONST 
  count = 1000;


VAR 
  a,b: mpz_t;
  i: longint;

BEGIN
  FOR i := 1 TO count DO
    BEGIN
      mpz_ui_pow_ui(a,i,i);
      mpz_add(b,b,a);
    END;
  writeln(rightstr(mpz_get_str(NIL, 10, b),10));
END.
