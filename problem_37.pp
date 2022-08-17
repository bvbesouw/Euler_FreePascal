
PROGRAM problem_37;
{$mode ObjFPC}{$H+}

USES 
fgl,
euler;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

CONST 
  step                                = 250000;
  dividers: ARRAY [2 .. 6] OF Integer = (10, 100, 1000, 10000, 100000);

VAR 
  Primes                      : TIntegerList;
  Number, P, Sum, foundnumbers: Integer;
  Prime                       : Boolean;
  Arr                         : ARRAY OF Boolean;

FUNCTION Right_Truncable(Numb: Integer): Boolean;
BEGIN
  Result := TRUE;
  Numb := Numb DIV 10;
  REPEAT
    IF NOT Arr[Numb] THEN
      BEGIN;
        Result := FALSE;
        break
      END;
    Numb := Numb DIV 10;
  UNTIL Numb = 0;
END;

FUNCTION left_truncable(Numb: Integer): Boolean;

VAR 
  x,i: Integer;
BEGIN
  x := Num_Of_Digits(Numb);
  Result := TRUE;
  FOR I := x DOWNTO 2 DO
    BEGIN
      Numb := Numb MOD dividers[I];
      IF NOT Arr[Numb] THEN
        BEGIN;
          Result := FALSE;
          break
        END;
    END;
END;

BEGIN
  Sum := 0;
  foundnumbers := 0;
  Primes := TIntegerList.Create;
  setlength(Arr, step);
  Primes.Add(2);
  Arr[2] := TRUE;
  Number := 3;
  WHILE foundnumbers < 11 DO
    BEGIN
      Prime := TRUE;
      FOR P := 0 TO Primes.count - 1 DO
        BEGIN
          IF Primes.items[P] > trunc(sqrt(Number)) THEN
            break;
          Prime := Number MOD Primes.items[P] <> 0;
          IF NOT Prime THEN
            break;
        END;
      IF Prime THEN
        BEGIN
          IF Number > pred(length(Arr)) THEN
            setlength(Arr, length(Arr) + step);
          Arr[Number] := TRUE;
          Primes.Add(Number);
          IF left_truncable(Number) AND Right_Truncable(Number) THEN
            BEGIN
              Inc(Sum, Number);
              Inc(foundnumbers);
            END;
        END;
      Inc(Number, 2);
    END;
  writeln(Sum);
END.
