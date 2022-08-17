
PROGRAM problem_16;

{$mode ObjFPC}{$H+}

USES gmp;

VAR 
  a:   mpz_t;
  out: pchar;
  step,sum : longint;

BEGIN
  mpz_init_set_ui(a, 2);
  mpz_pow_ui(a, a, 1000);
  out := mpz_get_str(NIL, 10, a);
  sum := 0;
  FOR step := 0 TO pred(length(out)) DO
    inc(sum,ord(out[step])-48);
  writeln(sum);
END.
