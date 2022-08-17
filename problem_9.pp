
PROGRAM problem_9;

CONST 
  total = 1000;

VAR 
  a, b, c: longint;

BEGIN
  FOR a := 3 TO total DO
    FOR b := 1 TO a - 1 DO
      BEGIN
        c := total - (a + b);
        IF (a * a + b * b = c * c) THEN
          BEGIN
            writeln(a * b * c);
            halt;
          END;
      END;
END.
