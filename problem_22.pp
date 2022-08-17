
PROGRAM problem_22;
{$mode ObjFPC}{$H+}

USES 
Classes,
SysUtils;

CONST 
  C_FNAME = 'problem_22.txt';

VAR 
  names          : TStringList;
  x, y, sm, total: longint;

BEGIN
  names := TStringList.Create;

  TRY
    names.LoadFromFile(C_FNAME);
  EXCEPT
    ON E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;

names.delimiter := char(',');
names.delimitedText := names.Text;
names.sort;
total := 0;
FOR x := 0 TO pred(names.Count) DO
  BEGIN
    sm := 0;
    FOR y := 1 TO length(names[x]) DO
      Inc(sm, Ord(names[x][y]) - 64);
    Inc(total, sm * (x + 1));
  END;
writeln(total);
names.Free;
END.
