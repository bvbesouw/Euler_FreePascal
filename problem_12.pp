
PROGRAM problem_12;

{ brute force solution, can probably be optimised by using prime factorisation }

USES 
euler;

VAR 
  number, i: longint;

BEGIN
  number := 0;
  i := 1;
  WHILE (NumberOfDivisors(number) < 500) DO
    BEGIN
      Inc(number, i);
      Inc(i);
    END;
  Writeln(number);
END.
