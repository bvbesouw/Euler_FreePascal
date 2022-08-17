
PROGRAM problem_42;

{$mode objfpc}{$H+}

USES 
Classes, SysUtils;



CONST 
  C_FNAME = 'problem_42.txt';

VAR 
  Names: TStringList;
  matrix: ARRAY[1..6000] OF boolean;
  x, y, Count, sum: longint;
BEGIN
  names := TStringList.Create;
  names.delimiter := char(',');
  TRY
    names.LoadFromFile(C_FNAME);
  EXCEPT
    on E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;
FOR x := 1 TO 6000 DO
  matrix[x] := False;
FOR x := 1 TO 100 DO
  matrix[x * (x + 1) DIV 2] := True;
Count := 0;
names.delimitedText := names.Text;
FOR x := 0 TO pred(names.Count) DO
  BEGIN
    sum := 0;
    FOR y := 1 TO length(names[x]) DO
      Inc(sum, Ord(names[x][y]) - 64);
    IF matrix[sum] THEN
      Inc(Count);
  END;
Writeln(Count);
END.
