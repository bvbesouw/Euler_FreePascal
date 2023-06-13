
PROGRAM problem_15;

{$mode objfpc}{$H+}

VAR 
  gridSize, i, j: Integer;
  grid: array[0..20, 0..20] OF Int64;

BEGIN
  gridSize := 20;

  FOR i := 0 TO gridSize DO
    BEGIN
      grid[i, 0] := 1;
      grid[0, i] := 1;
    END;

  FOR i := 1 TO gridSize DO
    BEGIN
      FOR j := 1 TO gridSize DO
        BEGIN
          grid[i, j] := grid[i-1, j] + grid[i, j-1];
        END;
    END;


  writeln(grid[gridSize, gridSize]);
END.
