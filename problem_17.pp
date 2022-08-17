
PROGRAM problem_17;
{$mode ObjFPC}{$H+}

VAR arr : array[0..1000] OF integer;
  i,tens,ones,hundreds,tens_ones,sum : integer;

BEGIN
  FOR i := 0 TO 1000 DO
    arr[i] := 0;
  sum := 0;
  arr[0] := length('');
  arr[1] := length('one');
  arr[2] := length('two');
  arr[3] := length('three');
  arr[4] := length('four');
  arr[5] := length('five');
  arr[6] := length('six');
  arr[7] := length('seven');
  arr[8] := length('eight');
  arr[9] := length('nine');
  arr[10] := length('ten');
  arr[11] := length('eleven');
  arr[12] := length('twelve');
  arr[13] := length('thirteen');
  arr[14] := length('fourteen');
  arr[15] := length('fifteen');
  arr[16] := length('sixteen');
  arr[17] := length('seventeen');
  arr[18] := length('eighteen');
  arr[19] := length('nineteen');
  arr[20] := length('twenty');
  arr[30] := length('thirty');
  arr[40] := length('forty');
  arr[50] := length('fifty');
  arr[60] := length('sixty');
  arr[70] := length('seventy');
  arr[80] := length('eighty');
  arr[90] := length('ninety');
  arr[1000] := length('onethousand');

  FOR i:= 21 TO 99 DO
    BEGIN
      tens := (i DIV 10) * 10;
      ones := i - tens;
      arr[i]  := arr[tens]+arr[ones];
    END;
  FOR i := 100 TO 999 DO
    BEGIN
      hundreds := i DIV 100;
      tens_ones := i - hundreds * 100;
      //if the value of tens and ones place is 0
      //just use 'hundred' instead of 'and hundred'
      IF tens_ones = 0 THEN
        arr[i] := arr[hundreds] + length('hundred')
      ELSE
        arr[i] := arr[hundreds] + length('onehundred') + arr[tens_ones];
    END;

  FOR i := 0 TO 1000 DO
    inc(sum,arr[i]);
  writeln(sum);
END.
