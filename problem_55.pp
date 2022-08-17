
PROGRAM problem_55;
{$mode ObjFPC}{$H+}

USES euler;

FUNCTION IsLychrel(number:qword) : boolean;

VAR steps : longint;
  temp : qword;
  found : boolean;
BEGIN
  steps := 0;
  found := false;
  REPEAT
    temp := number + reverse(number);
    found := IsPalindrome(temp);
    inc(steps);
    number := temp;
  UNTIL (steps > 50) OR found;
  Result := NOT found;
END;

VAR i,sum : longint;

BEGIN
  sum := 0;
  FOR i := 10 TO 9999 DO
    IF IsLychrel(i) THEN
      inc(sum);
  writeln(sum);
END.
