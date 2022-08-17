
PROGRAM problem_56;

{$mode ObjFPC}{$H+}

USES euler,gmp;

VAR 
  a: mpz_t;
  i,j,largest,sum : integer;

BEGIN
  largest := 0;
  FOR i := 1 TO 99 DO
    FOR j := 1 TO 99 DO
      BEGIN
        mpz_ui_pow_ui(a,i,j);
        sum := GetSumOfDigits(mpz_get_str(NIL, 10, a));
        IF sum > largest THEN largest := sum;
      END;
  writeln(largest);
END.
