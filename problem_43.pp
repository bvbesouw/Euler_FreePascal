
PROGRAM problem_43;

TYPE 
  tThingRec = RECORD
    ch  : Char;
    occ : Boolean;
  END;

VAR 
  Thing       : Array[1..255] OF tThingRec;
  EntryString : String;
  sum : qword;

FUNCTION Divisibility(dummy : qword) : boolean;

CONST 
  P : Array [1..7] OF integer = (17,13,11,7,5,3,2);

VAR 
  j: longint;
BEGIN
  Divisibility := true;
  FOR j := 1 TO 7 DO
    BEGIN
      IF ((dummy MOD 1000) MOD p[j]) <> 0 THEN
        BEGIN
          Divisibility := false;
          break;
        END
      ELSE
        dummy := dummy DIV 10;
    END;
END;

PROCEDURE Permutate(num : Byte);

VAR 
  i : Byte;
  number : qword;
BEGIN
  IF num > length(EntryString) THEN
    BEGIN
      num := 1;
      number := 0;
      FOR i := 1 TO length(EntryString) DO
        number := number*10 + (ord(Thing[i].Ch)-48);
      IF divisibility(number) THEN
        inc(sum,number);
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

BEGIN
  sum := 0;
  FillChar(Thing,sizeof(Thing),0);
  EntryString := '1234567890';
  Permutate(1);
  writeln(sum);
END.
