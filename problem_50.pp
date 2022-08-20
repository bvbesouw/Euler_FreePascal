
PROGRAM problem_50;

{$mode ObjFPC}{$H+}

USES fgl, euler;

CONST max = 1000000;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;
  TDynBools = array OF boolean;

VAR 
  primes: TIntegerList;
  i,j,longest,largest,sum: longint;
  is_prime : TdynBools;

BEGIN
  primes := TIntegerList.Create;
  is_prime := Sieve(max);
  FOR i := low(is_prime) TO high(is_prime) DO
    IF is_prime[i] THEN primes.add(i);

  longest := 0;
  largest := 0;
  FOR i := 0 TO pred(primes.count) DO
    BEGIN
      sum := 0;
      FOR j := i+1 TO pred(primes.count) DO
        BEGIN
          inc(sum,primes[j]);
          IF sum > max THEN break;
          IF (is_prime[sum]) AND (j-i > longest) THEN
            BEGIN
              longest := j-i;
              largest := sum;
            END;
        END;
    END;
  writeln(largest);
END.
