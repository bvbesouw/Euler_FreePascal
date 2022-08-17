
PROGRAM problem_74;
{$mode ObjFPC}{$H+}

{this is way slow but does the job, good opportunites for improvement
*1. cache all the numbers that do not lead to 60
*2. sort numbers that lead to 60, all combinations will also go to 60 }

USES fgl;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR facs : array[0..9] OF longint = (1,1,2, 6,24,120,720,5040,40320,362880);
  list: Tintegerlist;



FUNCTION GetSumOffacs(num: longint): longint;

VAR 
  dummy  : longint;

BEGIN
  result := 0;
  REPEAT
    dummy := num;
    num := num DIV 10;
    Inc(result, facs[dummy - num * 10]);
  UNTIL num < 1;
END;

FUNCTION indexoff(x : longint) : longint;

VAR i : longint;
BEGIN
  result := -1;
  FOR i := 0 TO pred(list.count) DO
    IF x = list[i] THEN
      BEGIN
        result := i;
        break;
      END;
END;

VAR i, sum, count : longint;
  already_exists : boolean;
BEGIN
  list := Tintegerlist.Create;
  count := 0;
  FOR i := 1 TO 1000000 DO
    BEGIN
      sum := i;
      list.clear;
      list.add(sum);
      already_exists := false;
      REPEAT
        sum := GetSumOffacs(sum);
        IF indexoff(sum) > -1 THEN already_exists := true
        ELSE
          list.add(sum);
      UNTIL already_exists;
      IF list.count = 60 THEN inc(count);
    END;
  writeln(count);
END.
