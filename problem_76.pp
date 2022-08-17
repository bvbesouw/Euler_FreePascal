
PROGRAM problem_76;
{$mode ObjFPC}{$H+}

USES fgl;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

CONST n = 100;

VAR 
  ways : array[0..10000] OF qword;
  numbers: Tintegerlist;
  i,j : longint;

BEGIN
  numbers := tintegerlist.create;
  FOR i := 1 TO n-1 DO
    numbers.add(i);
  ways[0] := 1;
  FOR i := 0 TO pred(numbers.count) DO
    FOR j := numbers[i] TO n DO
      ways[j] := ways[j] + ways[j-numbers[i]];
  writeln( ways[n]);
END.
