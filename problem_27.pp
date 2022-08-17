
PROGRAM problem_27;

{$mode ObjFPC}{$H+}

CONST max_number = 1000;

VAR is_prime: ARRAY[2..max_number] OF boolean;
  i,j,answer, largest,count,n : longint;

BEGIN
  FOR i := 2 TO max_number DO
    is_prime[i] := true;
  //initialize sieve;

  FOR i := 2 TO max_number DO
    //apply sieve
    BEGIN
      IF (is_prime[i]) THEN
        FOR j := 2 TO (max_number DIV i) DO
          is_prime[i*j] := false;
      //mark all multiples up to n as being not prime}
    END;

  answer := 0;
  largest := 0;
  i := -999;
  WHILE i < 1000 DO
    BEGIN
      FOR j := 1 TO 1000 DO
        BEGIN
          n := 0;
          count := 0;
          WHILE is_prime[n * n + i * n + j] DO
            BEGIN
              inc(count);
              inc(n);
            END;
          IF count > largest THEN
            BEGIN
              answer := i * j;
              largest := count;
            END;
        END;
      inc(i,2);
    END;
  writeln(answer);
END.
