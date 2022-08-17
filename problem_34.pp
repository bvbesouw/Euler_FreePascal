
PROGRAM problem34;

USES euler;

CONST upperlimit = 2540160;
  //9!7 = 2540160

VAR 
  arr : array[0..9] OF longint;
  i,result,a,sumoffacs,digit : longint;

BEGIN
  result := 0;
  arr[0] := 1;
  //by definition 0! = 1
  FOR i := 1 TO 9 DO
    arr[i] := arr[i-1]*i;
  FOR i := 10 TO 2540160 DO
    BEGIN
      sumoffacs := 0;
      a := i;
      REPEAT
        digit := a MOD 10;
        sumoffacs := sumoffacs + arr[digit];
        a := a DIV 10;
      UNTIL a = 0;
      IF i= sumoffacs THEN inc(result,i);
    END;
  writeln(result);
END.
