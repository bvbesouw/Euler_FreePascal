
PROGRAM problem_41;
{$mode ObjFPC}{$H+}

USES  Classes, SysUtils, Euler;

CONST 
  max = 7654321;



TYPE 
  tThingRec = RECORD
    ch  : Char;
    occ : Boolean;
  END;
  TDynBools = array OF boolean;

VAR 
  Thing       : Array[1..255] OF tThingRec;
  EntryString : String;
  primestrs : TStringList;
  is_prime: TDynBools;


PROCEDURE Permutate(num : Byte);

VAR 
  i : Byte;
  prim : string;
BEGIN
  IF num > length(EntryString) THEN
    BEGIN
      num := 1;
      prim := '';
      FOR i := 1 TO length(EntryString) DO
        prim := prim + Thing[i].Ch;
      primestrs.add(prim);
    END
  ELSE
    BEGIN
      FOR i := 1 TO length(EntryString) DO
        BEGIN
          IF (NOT Thing[i].Occ) THEN
            BEGIN
              Thing[i].Occ := True;
              Thing[i].Ch := EntryString[num];
              Permutate(succ(num));
              Thing[i].Occ := False;
            END;
        END;
    END;
END;


VAR i : longint;
BEGIN
  is_prime := Sieve(max);
  primestrs := TStringList.Create;
  primestrs.sorted := true;
  primestrs.Duplicates := dupIgnore;
  FillChar(Thing,sizeof(Thing),0);
  EntryString := '1234567';
  Permutate(1);
  FOR i := pred(primestrs.count) DOWNTO 0 DO
    IF is_prime[strtoint(primestrs[i])] THEN
      BEGIN
        writeln(primestrs[i]);
        break;
      END;
END.
