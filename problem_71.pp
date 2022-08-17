
PROGRAM problem_71;

USES fractions,euler;

CONST denom = 1000000;

VAR F3_7, F1,FSmall,Fsub : Tfraction;
  numerator, denominator,Closest : longint;

BEGIN
  F3_7 := Fraction(3,7);
  FSmall := Fraction(1,1);
  FOR denominator := denom DOWNTO denom - 7 DO
    BEGIN
      numerator := (denominator DIV 2)+1;
      REPEAT
        dec(numerator);
        F1 := fraction(numerator,denominator);
      UNTIL (F1 < F3_7) OR (numerator = 1);

      Fsub := f3_7 - F1;
      IF (Fsub < Fsmall) AND (gcd(numerator,denominator) = 1) THEN
        BEGIN
          Fsmall := Fsub;
          Closest := numerator;
        END;
    END;
  writeln(Closest);
END.
