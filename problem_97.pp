
PROGRAM Problem_97;

USES gmp, sysutils;

VAR 
  a: mpz_t;

BEGIN
  mpz_set_ui(a,2);
  mpz_pow_ui(a,a,7830457);
  mpz_mul_ui(a,a, 28433);
  mpz_add_ui(a,a,1);
  writeln(rightstr(mpz_get_str(NIL, 10, a),10));
END.
