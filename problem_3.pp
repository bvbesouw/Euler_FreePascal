
PROGRAM problem_3;

USES euler;

CONST 
  max_number = 548112;
  // sqrt(600851475143 div 2);

VAR 
  is_prime: ARRAY OF boolean;

FUNCTION isprime(n: uint64): boolean;

VAR 
  i     : longint;
  iprime: boolean;

BEGIN
  i := 3;
  isprime := odd(n);
  IF n < 548112 THEN
    iprime := is_prime[n]
  ELSE
    WHILE iprime AND ((i * i) < n) DO
      BEGIN
        IF NOT is_prime[n] THEN
          REPEAT
            Inc(i)
          UNTIL is_prime[i];
        iprime := NOT(n MOD i = 0);
      END;
  isprime := iprime;
END;

VAR 
  lin, lcnt, max: uint64;

BEGIN
  max := 0;
  lin := 600851475143;
  lcnt := 2;
  setlength(is_prime,max_number);
  Sieve(is_prime);

  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        IF isprime(lcnt) AND (lcnt > max) THEN
          max := lcnt;
      lcnt := lcnt + 1;
    END;
  writeln(max);
END.
