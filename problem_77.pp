
PROGRAM problem_77;

{$mode ObjFPC}{$H+}

CONST primes : array[0..21] OF longint = (2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79);

VAR L, target,p,i : longint;
  ways : array OF longint;

BEGIN
  L := 5000;
  target := 11;
  WHILE true DO
    BEGIN
      setlength(ways,target+1);
      FillChar(Pointer(ways)^, Length(ways), Longint(0));
      FOR p := 0 TO high(ways) DO
        ways[p] := 0;
      ways[0] := 1;
      FOR p IN primes DO
        FOR i := p TO target+1 DO
          inc(ways[i],ways[i-p]);
      IF ways[target] > L THEN
        break
      ELSE
        inc(target);
    END;
  writeln(target);
END.
