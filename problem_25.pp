
PROGRAM problem_25;

{$mode ObjFPC}{$H+}

USES gmp;

VAR 
  a, b: mpz_t;
  step: longint;

BEGIN
  mpz_init_set_ui(a, 1);
  mpz_init_set_ui(b, 10);
  mpz_pow_ui(b, b, 999);
  step := 0;
  REPEAT
    Inc(step);
    mpz_fib_ui(a, step);
  UNTIL a > b;
  writeln(step);
END.
