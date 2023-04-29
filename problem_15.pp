
PROGRAM problem_15;

{$mode objfpc}{$H+}

var
  gridSize, i, j: Integer;
  grid: array[0..20, 0..20] of Int64;

begin
  gridSize := 20;

  for i := 0 to gridSize do
  begin
    grid[i, 0] := 1;
    grid[0, i] := 1;
  end;

  for i := 1 to gridSize do
  begin
    for j := 1 to gridSize do
    begin
      grid[i, j] := grid[i-1, j] + grid[i, j-1];
    end;
  end;


  writeln(grid[gridSize, gridSize]);
END.
