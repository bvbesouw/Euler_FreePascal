
PROGRAM problem_57;

{$mode ObjFPC}{$H+}

USES euler,sysutils,gmp;

VAR 
  p,q,p1,q1,c: mpz_t;
  i,counter : integer;
BEGIN
  mpz_set_ui(p,1);
  mpz_set_ui(q,1);
  counter := 0;
  FOR i:= 1 TO 1000 DO
    BEGIN
      mpz_mul_si(c,q,2);
      mpz_add(p1,p,c);
      mpz_add(q1,p,q);
      IF length(mpz_get_str(NIL, 10, p1)) > length(mpz_get_str(NIL, 10, q1)) THEN inc(counter);
      mpz_set(p,p1);
      mpz_set(q,q1);
    END;
  writeln(counter);
END.
