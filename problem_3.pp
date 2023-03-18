
PROGRAM problem_3;

USES euler;

TYPE 
  TDynBools = array OF boolean;

CONST 
  max_number = 548112;
  // sqrt(600851475143 div 2);

VAR 
  is_prime: TDynBools;
  lin, lcnt, max: uint64;

BEGIN
  max := 0;
  lin := 600851475143;
  lcnt := 2;
  is_prime := Sieve(max_number);
  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        IF isPrimeCheck(lcnt) AND (lcnt > max) THEN
          max := lcnt;
      lcnt := lcnt + 1;
    END;
  writeln(max);
END.
