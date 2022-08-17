
PROGRAM problem_67;

{$mode ObjFPC}{$H+}


USES 
math, Classes, SysUtils;

CONST 
  C_FNAME = 'problem_67.txt';
  lines = 100;

VAR 
  slInfo: TStringList;
  arr : ARRAY[1..lines,1..lines] OF integer;
  i,x,y : longint;
BEGIN
  slInfo := TStringList.Create;
  slinfo.delimiter := char(' ');
  TRY
    slInfo.LoadFromFile(C_FNAME);
  EXCEPT
    on E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;
slinfo.delimitedText := slinfo.Text;
//populate matrix
i := 0;
FOR x := 1 TO lines DO
  FOR y:= 1 TO x DO
    BEGIN
      arr[x,y] := strtoint(slinfo[i]);
      inc(i);
    END;
//count from the bottom up
FOR x := lines-1 DOWNTO 1 DO
  FOR y:= 1 TO x DO
    arr[x,y] := arr[x,y] + max(arr[x+1,y],arr[x+1,y+1]);
writeln(arr[1,1]);
slInfo.Free;
END.
