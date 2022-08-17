
PROGRAM problem_47;
{$mode ObjFPC}{$H+}

USES fgl,sysutils;

TYPE 
  TIntegerList = Specialize TfpgList<integer>;

VAR 
  list: Tintegerlist;

FUNCTION BinarySearch(X: integer; VAR indx: integer): boolean;

VAR 
  top, bottom, middle,toosmall,i : integer;
  found : boolean;
BEGIN
  top := pred(list.count);
  bottom := 0;
  found := false;
  indx := -1;
  REPEAT
    middle := (top + bottom) DIV 2;
    IF (list[top] = x) OR (list[middle]= x) OR (list[bottom]=x) THEN
      BEGIN
        found := true;
        IF list[top] = x THEN indx := top
        ELSE
          IF list[middle] = x THEN indx := middle
        ELSE
          indx := bottom;
      END;
    toosmall := top - bottom;
    IF x > list[middle] THEN bottom := middle
    ELSE top := middle;
  UNTIL (found OR (toosmall < 3));
  result := found;
  IF NOT found THEN
    BEGIN
      indx := top;
      WHILE list[indx] > x DO
        dec(indx);
      inc(indx);
    END;
END;

PROCEDURE AddToList(x : integer);

VAR ix : integer;
BEGIN
  IF list.count = 0 THEN list.add(x)
  ELSE
    IF x > list[pred(list.count)] THEN list.add(x)
  ELSE
    IF x < list[0] THEN list.insert(0,x)
  ELSE
    IF NOT BinarySearch(x,ix) THEN list.insert(ix,x);
END;

FUNCTION npf(number: Integer): Integer;

VAR 
  i: Integer;

BEGIN
  i := 2;
  list.clear;
  WHILE (i < sqrt(number)) OR (number = 1) DO
    BEGIN
      IF number MOD i = 0 THEN
        BEGIN
          number := number DIV i;
          AddToList(i);
          dec(i);
        END;
      inc(i);
    END;
  result := succ(list.count);
END;

VAR 
  j: Integer;

BEGIN
  list := Tintegerlist.Create;
  j := 2 * 3 * 5 * 7;
  WHILE True DO
    BEGIN
      IF (npf(j) = 4) AND (npf(j + 1) = 4) AND (npf(j + 2) = 4) AND
         (npf(j + 3) = 4) THEN
        BEGIN
          writeln(j);
          break;
        END;
      inc(j);
    END;
  list.Free;
END.
