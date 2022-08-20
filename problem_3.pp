
PROGRAM problem_3;

USES euler;

TYPE 
  TDynBools = array OF boolean;

CONST 
  max_number = 548112;
  // sqrt(600851475143 div 2);

VAR 
  is_prime: TDynBools;

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
  is_prime := Sieve(max_number);

  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        IF isprime(lcnt) AND (lcnt > max) THEN
          max := lcnt;
      lcnt := lcnt + 1;
    END;
  writeln(max);
END.
