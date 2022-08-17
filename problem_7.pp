
PROGRAM problem_7;

{$mode ObjFPC}{$H+}

USES fgl;


TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR 
  primes: TIntegerList;
  top, max, number, p: longint;
  prime: boolean;

BEGIN
  max := 10001;
  primes := TIntegerList.Create;
  primes.Add(2);
  number := 3;
  WHILE primes.Count < max DO
    BEGIN
      prime := True;
      top := trunc(sqrt(number));
      FOR p := 0 TO primes.Count - 1 DO
        BEGIN
          IF primes.items[p] > top THEN break;
          prime := number MOD primes.Items[p] <> 0;
          IF NOT prime THEN break;
        END;
      IF prime THEN primes.add(number);
      Inc(number, 2);
    END;
  writeln(primes.last);
END.
