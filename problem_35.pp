
PROGRAM problem_35;
{$mode ObjFPC}{$H+}

USES euler, fgl;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

CONST 
  max = 1000000;

VAR 
  Primes          : TIntegerList;
  number, p, count: longint;
  prime           : boolean;
  arr             : ARRAY [0 .. max] OF boolean;

FUNCTION is_circular(x: longint): boolean;





{we can possibly optimize by keeping track of all numbers that have been checked and
 proven not to be circular, but this seems fast enough}

VAR 
  y, i, p, z: longint;
BEGIN
  result := true;
  IF (x < 17) THEN
    result := true
  ELSE
    BEGIN
      y := Num_Of_Digits(x);
      p := intpower(10, y - 1);
      FOR i := 1 TO pred(y) DO
        BEGIN
          z := x;
          x := (z DIV 10) + z MOD 10 * p;
          IF NOT arr[x] THEN
            BEGIN
              result := false;
              break;
            END;
        END;
    END;
END;

BEGIN
  count := 0;
  Primes := TIntegerList.Create;
  Primes.Add(2);
  number := 3;
  WHILE number < max DO
    BEGIN
      prime := true;
      FOR p := 0 TO Primes.count - 1 DO
        BEGIN
          IF Primes.items[p] > trunc(sqrt(number)) THEN
            break;
          prime := number MOD Primes.items[p] <> 0;
          IF NOT prime THEN
            break;
        END;
      IF prime THEN
        BEGIN
          arr[number] := true;
          Primes.Add(number);
        END;
      Inc(number, 2);
    END;

  FOR p := 0 TO pred(Primes.count) DO
    IF is_circular(Primes[p]) THEN
      Inc(count);

  writeln(count);
END.
