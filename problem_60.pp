
PROGRAM problem_7;

{$mode ObjFPC}{$H+}

USES fgl, euler, math;


TYPE 
  TIntegerList = Specialize TfpgList<longint>;

FUNCTION comb(a, b: longint): boolean;
BEGIN
  comb := isPrimeCheck(a*trunc(power(10,Num_Of_Digits(b)))+b) AND isPrimeCheck(b*trunc(power(10,Num_Of_Digits(a)))+a);
END;

VAR 
  primes: TIntegerList;
  a,b,c,d,e,number : longint;
  top, p: longint;
  prime: boolean;

BEGIN
  primes := TIntegerList.Create;
  primes.Add(2);
  number := 3;
  WHILE number < 10000 DO
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

  FOR a := 1 TO pred(primes.count) DO
    BEGIN
      FOR b := succ(a) TO pred(primes.count) DO
        IF comb(primes[a],primes[b]) THEN
          BEGIN
            FOR c := succ(b) TO pred(primes.count) DO
              IF (comb(primes[a],primes[c]) AND comb(primes[b],primes[c])) THEN
                BEGIN
                  FOR d := Succ(c) TO pred(primes.count) DO
                    IF (comb(primes[a],primes[d]) AND comb(primes[b],primes[d]) AND comb(primes[c],primes[d])) THEN
                      BEGIN
                        FOR e := succ(d) TO pred(primes.count) DO
                          IF (comb(primes[a],primes[e]) AND comb(primes[b],primes[e]) AND comb(primes[c],primes[e]) AND comb(primes[d],primes[e])) THEN
                            BEGIN
                              writeln(primes[a]+primes[b]+primes[c]+primes[d]+primes[e]);
                              halt;
                            END;
                      END;
                END;
          END;
    END;
END.
