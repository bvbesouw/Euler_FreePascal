
PROGRAM problem_26;

{$mode ObjFPC}{$H+}

USES fgl,sysutils;

CONST max = 1000;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR 
  primes: TIntegerList;

PROCEDURE GeneratePrimes(x : longint);

VAR 
  number,top,p: longint;
  prime : boolean;
BEGIN
  primes := TIntegerList.Create;
  primes.Add(2);
  number := 3;
  WHILE number < x DO
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
END;

FUNCTION recurring(divisor :longint): longint;

TYPE 
  Tarr = array[0..max*10] OF boolean;

VAR 
  number, steps: longint;
  arr : Tarr;
BEGIN
  number := 1;
  steps := 0;
  arr := default(Tarr);
  REPEAT
    WHILE divisor > number DO
      BEGIN
        number := number * 10;
        inc(steps);
      END;
    IF arr[number] THEN
      break;
    arr[number] := True;
    number := number-(number DIV divisor)*divisor;
  UNTIL arr[number] OR (number = 0);
  result := pred(steps);
END;


VAR i, longest, answer, temp: longint;
BEGIN
  GeneratePrimes(max);
  // using just primes speeds up program 4x
  longest := 0;
  FOR i := 2 TO pred(primes.count) DO
    BEGIN
      temp := recurring(primes[i]);
      IF temp > longest THEN
        BEGIN
          longest := temp;
          answer := primes[i];
        END;
    END;
  writeln(answer);
END.
