
PROGRAM problem_7;

{$mode ObjFPC}{$H+}

USES fgl,sysutils,classes;


TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR 
  primes: TIntegerList;
  i1,i2,i3,a,b,c,top, max, number, p,count: longint;
  prime: boolean;
  q : qword;
  arr : array[2..50000000] OF boolean;

BEGIN
  max := 7072;
  count := 0;
  primes := TIntegerList.Create;
  primes.Add(2);
  number := 3;
  WHILE number <= max DO
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
  FOR p := 0 TO pred(primes.count) DO
    BEGIN
      IF primes[p] < 85 THEN c := p;
      IF primes[p] < 369 THEN b := p;
      IF primes[p] < 7072 THEN a := p;
    END;

  FOR i1 := 0 TO a DO
    FOR i2 := 0 TO b DO
      FOR i3 := 0 TO c DO
        BEGIN
          q := primes[i1]  * primes[i1] + primes[i2]*primes[i2]*primes[i2] + primes[i3]*primes[i3]*primes[i3]*primes[i3];
          IF q >= 50000000 THEN break
          ELSE
            IF NOT arr[q] THEN
              BEGIN
                inc(count);
                arr[q] := true;
              END;
        END;
  writeln(count);
END.
