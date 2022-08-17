
PROGRAM problem_4;

{$mode ObjFPC}{$H+}

USES 
euler;

CONST 
  max = 999;

VAR 
  x, y, largest, mul: longint;

BEGIN
  largest := 0;
  x := max;
  WHILE x > 100 DO
    BEGIN
      FOR y := max DOWNTO 100 DO
        BEGIN
          mul := x * y;
          IF (IsPalindrome(mul) AND (mul > largest)) THEN largest := mul;
        END;
      IF ((x < max) AND (largest = mul)) THEN x := 100;
      Dec(x);
    END;
  writeln(largest);
END.
