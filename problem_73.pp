
PROGRAM problem_73;

USES euler;

CONST denom = 12000;

VAR numerator, denominator,count : longint;

BEGIN
  count := 0;
  FOR denominator := 2 TO 12000 DO
    FOR numerator := (denominator DIV 3) TO (denominator DIV 2) DO
      IF (numerator*3 > denominator) AND (numerator * 2 < denominator) AND (gcd(numerator, denominator) = 1) THEN
        inc(count);
  writeln(count);
END.
