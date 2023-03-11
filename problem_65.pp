
PROGRAM problem_65;

USES euler,gmp;

CONST MAX = 100;

VAR fract,sum,k : Longword;
  n,prev_n,temp: mpz_t;

BEGIN
  mpz_init_set_ui(n,2);
  mpz_init_set_ui(temp,1);

  FOR k := 2 TO MAX DO
    BEGIN
      IF k MOD 3 = 0 THEN
        BEGIN
          fract := k DIV 3;
          Inc(fract,fract);
        END
      ELSE
        fract := 1;
      prev_n := n;
      mpz_init_set_ui(n,0);
      mpz_mul_ui(n,prev_n,fract);
      mpz_add(n,n,temp);
      temp := prev_n;
    END;
  sum := GetSumOfDigits(mpz_get_str(NIL, 10, n));
  writeln(sum);
END.
