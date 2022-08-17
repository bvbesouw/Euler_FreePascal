
PROGRAM problem_36;

{$mode ObjFPC}{$H+}

USES euler,strutils;

FUNCTION remove_zero(x:STRING) : string;
BEGIN
  delete(x,1,pos('1',x)-1);
  remove_zero := x;
END;


VAR x, total : longint;
BEGIN
  total := 0;
  FOR x := 1 TO 1000000 DO
    IF IsPalindrome(x) AND isPalindrome(remove_zero(inttobin(x,20))) THEN inc(total,x);
  writeln(total);

END.
