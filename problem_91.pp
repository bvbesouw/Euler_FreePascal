program RightTriangleCount;
{$mode ObjFPC}{$H+}
const
  LIMIT = 51;

type
  TPoint = record
    x, y: uint32;
  end;

function IsRightTriangle(x1, y1, x2, y2: uint32): Boolean;
var
  a, b, c: uint32;
begin
  a := x1 * x1 + y1 * y1;
  b := x2 * x2 + y2 * y2;
  c := (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1);
  Result := (a + b = c) or (b + c = a) or (c + a = b);
end;

function Compute(): UInt32;
var
  x1, y1, x2, y2: uint32;

begin
  result := 0;
  for x1 := 0 to LIMIT - 1 do
  begin
    for y1 := 0 to LIMIT - 1 do
    begin
      for x2 := 0 to LIMIT - 1 do
      begin
        for y2 := 0 to LIMIT - 1 do
        begin
          if (y2 * x1 < y1 * x2) and IsRightTriangle(x1, y1, x2, y2) then
            Inc(result);
        end;
      end;
    end;
  end;
end;

begin
  WriteLn(Compute());
end.
