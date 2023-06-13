
PROGRAM problem_69_1;
  {$MODE DELPHI}

USES euler;

TYPE 
  TDynBools = array OF boolean;

VAR 
  is_prime: TDynBools;

VAR i, number : longint;

BEGIN
  is_prime := Sieve(1000);
  number := 1;
  i := 2;
  WHILE number * i <1000000 DO
    BEGIN
      number := number * i;
      inc(i);
      WHILE NOT is_prime[i] DO
        inc(i);
    END;

  writeln(number);
END.
