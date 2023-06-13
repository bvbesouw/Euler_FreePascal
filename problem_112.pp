
PROGRAM problem_112;
{$mode ObjFPC}{$H+}

FUNCTION IsBouncy(n: integer): boolean;

VAR 
  lastDigit, currDigit: integer;
  increasing, decreasing: boolean;
BEGIN
  increasing := true;
  decreasing := true;
  lastDigit := n MOD 10;
  n := n DIV 10;
  WHILE n > 0 DO
    BEGIN
      currDigit := n MOD 10;
      IF currDigit > lastDigit THEN
        decreasing := false
      ELSE IF currDigit < lastDigit THEN
             increasing := false;
      lastDigit := currDigit;
      n := n DIV 10;
    END;
  result := NOT (increasing OR decreasing);
END;

VAR 
  count, n: integer;
  proportion: real;
BEGIN
  count := 0;
  n := 100;
  WHILE true DO
    BEGIN
      IF IsBouncy(n) THEN
        inc(count);
      proportion := count / n;
      IF proportion >= 0.99 THEN
        break;
      inc(n);
    END;
  writeln(n);
END.
