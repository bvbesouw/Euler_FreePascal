
PROGRAM problem_46;

{$mode ObjFPC}{$H+}

USES fgl;

CONST 
  max = 1000000;
  //can be big, we don't iterate through it so no time penalty

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR 
  primes: TIntegerList;
  top, number, goldbach, i : longint;
  prime, found: boolean;
  is_prime: ARRAY[2..max] OF boolean;

BEGIN
  primes := TIntegerList.Create;
  primes.Add(2);
  number := 3;
  WHILE primes.Count < max DO
    //max can be huge, we "halt" when done
    BEGIN
      //start finding primes
      prime := True;
      top := trunc(sqrt(number));
      FOR i := 0 TO primes.Count - 1 DO
        BEGIN
          IF primes.items[i] > top THEN break;
          prime := number MOD primes.Items[i] <> 0;
          IF NOT prime THEN break;
        END;
      IF prime THEN
        BEGIN
          primes.add(number);
          is_prime[number] := true;
        END
      ELSE  // if number is not a prime, start checking 
        BEGIN
          found := false;
          i := 1;
          goldbach := 2 * (i*i);
          WHILE goldbach < number DO
            BEGIN
              IF is_prime[number - goldbach] THEN
                BEGIN
                  found := true;
                  break;
                END;
              inc(i);
              goldbach := (2 * (i*i))
            END;
          IF NOT found THEN
            BEGIN
              writeln(number);
              halt;
            END;
        END;
      Inc(number, 2);
    END;
END.
