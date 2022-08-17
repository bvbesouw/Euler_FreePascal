
PROGRAM problem_92;

VAR 
  lookuptable: array[1..567] OF integer;

FUNCTION SquareOfDigits(X: Dword): Dword;

VAR 
  temp, sum, digit: Dword;

BEGIN
  IF (x = 1) OR (x = 89) THEN
    SquareOfDigits := x
  ELSE
    BEGIN
      temp := x;
      sum := 0;
      WHILE temp > 0 DO
        BEGIN
          digit := temp MOD 10;
          temp := temp DIV 10;
          sum := sum + digit * digit;
        END;
      squareofdigits := sum;
    END;
END;

FUNCTION getsquareofdigits(x: dword): dword;
BEGIN
  REPEAT
    x := squareofdigits(x);
  UNTIL (x = 1) OR (x = 89);
  getsquareofdigits := x;
END;



VAR 
  x, counter: dword;
  x1,x2,x3,x4,x5,x6,x7 : integer;

BEGIN
  counter := 0;
  FOR x := 1 TO 567 DO
    //create lookuptable
    lookuptable[x] := getsquareofdigits(x);

  FOR x1 := 0 TO 9 DO
    FOR x2 := 0 TO 9 DO
      FOR x3 := 0 TO 9 DO
        FOR x4 := 0 TO 9 DO
          FOR x5 := 0 TO 9 DO
            FOR x6 := 0 TO 9 DO
              FOR x7 := 0 TO 9 DO
                IF lookuptable[x1*x1+x2*x2+x3*x3+x4*x4+x5*x5+x6*x6+x7*x7] = 89 THEN inc(counter);
  writeln(counter);
END.
