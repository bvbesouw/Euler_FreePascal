
PROGRAM problem_15;

{$mode objfpc}{$H+}

USES gmp;

CONST grid = 20;

VAR 
  a,b: mpz_t;
  out: PChar;

BEGIN
  mpz_fac_ui(a,2*grid);
  mpz_fac_ui(b,grid);
  mpz_pow_ui(b, b, 2);
  mpz_cdiv_q (a, a, b);
  out := mpz_get_str(NIL, 10, a);
  Writeln(out);
END.
