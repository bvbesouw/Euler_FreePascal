
PROGRAM problem_64;

FUNCTION cf(n : longint) : longint;

VAR period, a0,an : longint;
  mn, dn : real;

BEGIN
  a0 := trunc(sqrt(n));
  an := a0;
  mn := 0;
  dn := 1;
  period := 0;
  IF a0 <> sqrt(n) THEN
    WHILE an <> (a0 + a0) DO
      BEGIN
        mn := dn*an-mn;
        dn := (n - mn*mn)/dn;
        an := trunc((a0 + mn)/dn);
        inc(period)
      END;
  cf := period;
END;


VAR 
  counter, i : longint;
BEGIN
  counter := 0;
  FOR i := 1 TO 10000 DO
    IF odd(cf(i)) THEN inc(counter);
  writeln(counter);
END.
