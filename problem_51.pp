{$mode ObjFPC}{$H+}

USES euler,sysutils,strutils;

TYPE 
  TDynBools = array OF boolean;

FUNCTION HasRepeatedDigit(number: UInt32): Integer;

VAR 
  digitCounts: array[0..9] OF uint32;
  digit,i: UInt32;

BEGIN
  number := number DIV 10;
  // least significant digit cannot be repeating
  FillChar(digitCounts, SizeOf(digitCounts), 0);

  WHILE (number > 0) DO
    BEGIN
      digit := number MOD 10;
      Inc(digitCounts[digit]);
      number := number DIV 10;
    END;

  FOR i := 0 TO 2 DO
    BEGIN
      IF digitCounts[i] >= 3 THEN
        Exit(i);
    END;
  Result := -1;
END;


CONST MAX = 999999;
  MyArray: TStringArray = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

VAR Is_prime: TDynBools;
  C, Count: Uint32;
  Digit, P: Integer;
  Q: STRING;
BEGIN

  Is_prime := Sieve(MAX);
  FOR C := 100000 TO MAX DO
    BEGIN
      IF NOT Is_prime[C] THEN Continue;
      Count := 0;
      Digit := HasRepeatedDigit(C);
      IF Digit > 0 THEN
        BEGIN
          FOR Q IN MyArray DO
            BEGIN
              P := StrToInt(ReplaceStr(IntToStr(C), IntToStr(Digit), Q));
              IF (P > 100000) AND Is_prime[P] THEN
                BEGIN
                  Inc(Count);
                  IF Count = 8 THEN
                    BEGIN
                      writeln(c);
                      Exit();
                    END;
                END;
            END;
        END;
    END;
END.
