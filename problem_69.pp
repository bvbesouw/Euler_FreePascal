
PROGRAM problem_69;
  {$MODE DELPHI}

// compile with -O3 to speed up DIV

USES euler;

TYPE 
  TDynBools = array OF boolean;

VAR 
  is_prime: TDynBools;

FUNCTION totient(n:longint): longint;

VAR 
  i, quot: longint;

BEGIN
  result := n;
   i := 2;
  WHILE i*i <= n DO
    BEGIN
      IF n MOD i = 0 THEN
        BEGIN
          REPEAT
            quot := n DIV i;
            IF n <> quot*i THEN
              BREAK
            ELSE
              n := quot;
          UNTIL false;
          dec(result,result DIV i);
        END;
      inc(i);
      WHILE NOT is_prime[i] DO
        inc(i);
    END;
  IF n> 1 THEN
    dec(result,result DIV n);
END;


VAR i, number : longint;
  top,phirat : real;
BEGIN
  is_prime := Sieve(1000);
  top := 0;
  number := 0;
  FOR i := 2 TO 1000000 DO
    BEGIN
      phirat := i / totient(i);
      IF phirat > top THEN
        BEGIN
          top := phirat;
          number := i
        END;
    END;
  writeln(number);
END.
