
PROGRAM problem_10;
{$mode ObjFPC}{$H+}

CONST 
  max_number = 2000000;

VAR 
  is_prime: ARRAY [2 .. max_number] OF boolean;
  i, j    : longint;
  sum     : Uint64;

BEGIN
  FOR i := 2 TO max_number DO
    is_prime[i] := True;
  // initialize sieve;

  FOR i := 2 TO max_number DO
    // apply sieve
    BEGIN
      IF (is_prime[i]) THEN
        FOR j := 2 TO (max_number DIV i) DO
          is_prime[i * j] := False;
    END;
  sum := 0;
  FOR i := 1 TO max_number DO
    IF is_prime[i] THEN
      Inc(sum, i);
  writeln(sum);
END.
