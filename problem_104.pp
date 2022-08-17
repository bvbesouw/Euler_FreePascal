
PROGRAM problem_104;

{$mode ObjFPC}{$H+}

USES 
SysUtils,gmp,euler;

VAR 
  a,b,c: mpz_t;
  out: PChar;
  k : longint;
  found : boolean;

BEGIN
  k := 320000;
  mpz_fib_ui(a,k);
  mpz_set_str (c, '1000000000',10);
  found := false;
  REPEAT
    inc(k);
    mpz_fib_ui(a,k);
    mpz_mod (b, a, c);
    out := mpz_get_str(NIL, 10, b);
    IF ispandigital(out) THEN
      BEGIN
        out := mpz_get_str(NIL, 10, a);
        found := ispandigital(leftstr(out, 9));
      END;
  UNTIL found;
  writeln(k);
END.
