// very brute force

PROGRAM problem_24;

USES fgl;

TYPE 
  TIntegerList = Specialize TfpgList<qword>;
  tThingRec = RECORD
    ch  : Char;
    occ : Boolean;
  END;

VAR 
  Thing       : Array[1..255] OF tThingRec;
  EntryString : String;
  list : TIntegerList;


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
      list.add(number);
    END
  ELSE
    FOR i := 1 TO length(EntryString) DO
      IF (NOT Thing[i].Occ) THEN
        BEGIN
          Thing[i].Occ := True;
          Thing[i].Ch := EntryString[num];
          Permutate(succ(num));
          Thing[i].Occ := False;
        END;
END;

FUNCTION sortlist(CONST item1, item2 : qword) : longint;
BEGIN
  IF item1 > item2 THEN  sortlist := 1
  ELSE
    IF item1 < item2 THEN sortlist := -1
  ELSE
    sortlist := 0;
END;

BEGIN
  list := Tintegerlist.Create;
  FillChar(Thing,sizeof(Thing),0);
  EntryString := '1234567890';
  Permutate(1);
  list.sort(@sortlist);
  writeln(list[pred(1000000)]);
END.
