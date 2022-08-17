
PROGRAM problem_11;
{$mode ObjFPC}{$H+}

USES 
Classes,
SysUtils;

CONST 
  C_FNAME = 'problem_11.txt';

VAR 
  numbers               : TStringList;
  matrix                : ARRAY [1 .. 20, 1 .. 20] OF integer;
  x, y, Count, max, temp: longint;

BEGIN
  numbers := TStringList.Create;
  numbers.delimiter := char(' ');
  TRY
    numbers.LoadFromFile(C_FNAME);
  EXCEPT
    ON E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;
numbers.delimitedText := numbers.Text;
Count := 0;
FOR x := 1 TO 20 DO
  FOR y := 1 TO 20 DO
    BEGIN
      matrix[x, y] := StrToInt(numbers[Count]);
      Inc(Count);
    END;
max := 0;

// horizontals -
FOR x := 1 TO 20 DO
  BEGIN
    FOR y := 1 TO 17 DO
      BEGIN
        temp := matrix[x, y] * matrix[x, y + 1] * matrix[x, y + 2] *
                matrix[x, y + 3];
        IF temp > max THEN
          max := temp;
      END;
  END;

// vertical |
FOR x := 1 TO 17 DO
  BEGIN
    FOR y := 1 TO 20 DO
      BEGIN
        temp := matrix[x, y] * matrix[x + 1, y] * matrix[x + 2, y] *
                matrix[x + 3, y];
        IF temp > max THEN
          max := temp;
      END;
  END;

// Dia \
FOR x := 1 TO 17 DO
  BEGIN
    FOR y := 1 TO 17 DO
      BEGIN
        temp := matrix[x, y] * matrix[x + 1, y + 1] * matrix[x + 2, y + 2] *
                matrix[x + 3, y + 3];
        IF temp > max THEN
          max := temp;
      END;
  END;

// Dia /
FOR x := 1 TO 17 DO
  BEGIN
    FOR y := 4 TO 20 DO
      BEGIN
        temp := matrix[x, y] * matrix[x + 1, y - 1] * matrix[x + 2, y - 2] *
                matrix[x + 3, y - 3];
        IF temp > max THEN
          max := temp;
      END;
  END;
numbers.Free;
writeln(max);
END.
