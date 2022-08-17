
USES euler,sysutils;

VAR x,y,index : longint;
  arr         : array[0..10000] OF integer;
  //count occurences
  wordarr     : array[0..10000] OF string;
  //store sorted strings
  sorted      : string;
  //sorted number
  found       : boolean;

BEGIN
  FOR x := 0 TO high(arr) DO
    BEGIN
      arr[x] := 0;
      wordarr[x] := '';
    END;
  found := false;
  x := -1;
  WHILE NOT found DO
    BEGIN
      inc(x);
      sorted := sort_string(inttostr(x*x*x));
      FOR y := 0 TO x DO
        IF wordarr[y] = sorted THEN
          BEGIN
            inc(arr[y]);
            found := arr[y] = 5;
            IF found THEN index := y;
            break;
          END;
      wordarr[x] := sorted;
      arr[x] := 1;
    END;
  writeln(index*index*index);
END.
