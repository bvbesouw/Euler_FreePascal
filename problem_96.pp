
PROGRAM problem096;
{$mode ObjFPC}{$H+} 
USES
  Classes, SysUtils,fgl;
  
TYPE
  TIntegerList = SPECIALIZE TfpgList<uint32>;

  
CONST
  C_FNAME = 'p096_sudoku.txt';
  
VAR
  grid : ARRAY [0..8,0..8] OF integer;
  slInfo: TStringList;
  total : uint32;
  start : qword;
FUNCTION possible(y,x,n : integer):boolean;

VAR
  i,j,x0,y0 : integer;
BEGIN
  possible := false;
  FOR i := 0 TO 8 DO
    IF grid[y,i] = n THEN
		exit(false);
  FOR i := 0 TO 8 DO
    IF grid[i,x] = n THEN
      exit(false);
  x0 := (x DIV 3) * 3;
  y0 := (y DIV 3) * 3;
  FOR i := 0 TO 2 DO
    FOR j := 0 TO 2 DO
      IF grid[y0+i,x0+j] = n THEN
        exit(false);
  possible := true;
END;

procedure solve;
VAR
  n,x,y : integer;
BEGIN
   FOR y := 0 TO 8 DO
     FOR x := 0 TO 8 DO
       IF grid[y,x] = 0 THEN
         BEGIN
           FOR n := 1 TO 9 DO
             IF possible(y,x,n) THEN
               BEGIN
                 grid[y,x] := n;
                 solve;
                 grid[y,x] := 0
               END;
           exit;
         END;
   total := total + grid[0,0]*100 + grid[0,1]*10+grid[0,2];
END;

procedure read_puzzle(puz : uint32);
var start,x,y: uint32;
begin
	start := (puz-1)*10+1;
	for x := start to start+8 do
		for y := 0 to 8 do
			grid [x-start,y] := ord(slinfo[x][y+1])-48;
end;

var 	puzzle : uint32;
BEGIN
  total := 0;	
  slInfo := TStringList.Create;
  TRY
    slInfo.LoadFromFile(C_FNAME);
  EXCEPT
    ON E: EInoutError DO
      writeln('File handling error occurred. Reason: ', E.Message);
  END;

start := gettickcount64;
	for puzzle := 1 to 50 do
	begin
		read_puzzle(puzzle);
		solve;
	end;
	writeln(total);
	writeln(gettickcount64-start);
  slinfo.free;
END.
