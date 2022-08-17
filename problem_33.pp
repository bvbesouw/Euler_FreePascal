
PROGRAM problem_33;

{$mode ObjFPC}{$H+}
FUNCTION GCD(x,y : longint) : Longint;
BEGIN
  WHILE x <> y DO
    IF x > y THEN
      x := x - y
    ELSE
      y := y - x;
  result := x;
END;


VAR denproduct, nomproduct, i, nom,den : longint;
BEGIN
  denproduct := 1;
  nomproduct := 1;
  FOR i := 1 TO 9 DO
    FOR den := 1 TO pred(i) DO
      FOR nom := 1 TO  pred(den) DO
        IF ((nom * 10 + i) * den = nom * (i * 10 + den)) THEN
          BEGIN
            denproduct := denproduct * den;
            nomproduct := nomproduct * nom;
          END;
  denproduct := denproduct DIV gcd(nomproduct, denproduct);
  WriteLn(denproduct);
END.
