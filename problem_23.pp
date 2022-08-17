
PROGRAM problem23;

USES Euler, fgl;

TYPE 
  TIntegerList = specialize TFPGList<qword>;

CONST max = 28123;

VAR 
  i,j,sum : longint;
  IntList: TIntegerList;
  arr : array[1..max] OF boolean;
  found : boolean;

BEGIN
  sum := 0;
  IntList := TIntegerList.Create;
  FOR i := 1 TO max DO
    arr[i] := false;
  FOR i := 12 TO max DO
    IF sum_of_divisors(i) > I THEN
      BEGIN
        arr[i] := true;
        intlist.add(i);
      END;
  FOR i := 1 TO max DO
    BEGIN
      j := 0;
      found := false;
      WHILE (NOT found) AND (intlist[j] < succ(i DIV 2)) DO
        BEGIN
          found := arr[i - intlist[j]];
          inc(j);
        END;
      IF NOT found THEN inc(sum,i);
    END;
  writeln(sum);
END.
