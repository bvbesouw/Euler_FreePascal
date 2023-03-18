
PROGRAM problem_7;

{$mode ObjFPC}{$H+}

USES fgl, euler, math;


TYPE 
  TIntegerList = Specialize TfpgList<longint>;

FUNCTION CombineAndCheckPrime(a, b: longint): boolean;
BEGIN
  CombineAndCheckPrime := isPrimeCheck(a*trunc(power(10,Num_Of_Digits(b)))+b) AND isPrimeCheck(b*trunc(power(10,Num_Of_Digits(a)))+a);
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
        IF CombineAndCheckPrime(primes[a],primes[b]) THEN
          BEGIN
            FOR c := succ(b) TO pred(primes.count) DO
              IF (CombineAndCheckPrime(primes[a],primes[c]) AND CombineAndCheckPrime(primes[b],primes[c])) THEN
                BEGIN
                  FOR d := Succ(c) TO pred(primes.count) DO
                    IF (CombineAndCheckPrime(primes[a],primes[d]) AND CombineAndCheckPrime(primes[b],primes[d]) AND CombineAndCheckPrime(primes[c],primes[d])) THEN
                      BEGIN
                        FOR e := succ(d) TO pred(primes.count) DO
                          IF (CombineAndCheckPrime(primes[a],primes[e]) AND CombineAndCheckPrime(primes[b],primes[e]) AND CombineAndCheckPrime(primes[c],primes[e]) AND CombineAndCheckPrime(primes[d],primes[e])) THEN
                            BEGIN
                              writeln(primes[a]+primes[b]+primes[c]+primes[d]+primes[e]);
                              halt;
                            END;
                      END;
                END;
          END;
    END;
END.
