
PROGRAM problem_10;
{$mode ObjFPC}{$H+}

USES 
Euler;

TYPE 
  TDynBools = array OF boolean;

CONST 
  max_number = 2000000;

VAR 
  is_prime: TDynBools;
  i    : longint;
  sum     : Uint64;

BEGIN
  is_prime := Sieve(max_number);

  sum := 0;
  FOR i := 1 TO max_number DO
    IF is_prime[i] THEN
      Inc(sum, i);
  writeln(sum);
END.
