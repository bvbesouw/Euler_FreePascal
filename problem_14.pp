
PROGRAM problem_14;

USES 
sysutils;

CONST 
  max = 100000000;

VAR 
  arr: ARRAY [1 .. max] OF int64;

FUNCTION collatz(n: int64): int64;

VAR 
  step: int64;

BEGIN
  step := 0;
  REPEAT
    IF ((n < max) AND (arr[n] > 0)) THEN
      BEGIN
        step := step + arr[n];
        //inc(step,arr[n]);
        break;
      END;
    IF odd(n) THEN
      BEGIN
        n := (3 * n + 1) DIV 2;
        // since 3n+1 is always positive we can also do the next step
        inc(step) // by dividing by 2, and increasing the step an extra time
      END
    ELSE
      n := n DIV 2;
    inc(step);
  UNTIL n = 1;
  collatz := step
END;

VAR 
  maxsteps, number, i: int64;

BEGIN

  maxsteps := 0;
  FOR i := 1 TO 1000000 DO
    BEGIN
      arr[i] := collatz(i);
      IF arr[i] > maxsteps THEN
        BEGIN
          maxsteps := arr[i];
          number := i;
        END;
    END;
  writeln(number);
END.
