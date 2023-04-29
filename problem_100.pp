PROGRAM problem_100;
{$mode ObjFPC}{$H+}

var
  blue, total, tmp: Int64;

begin
  blue := 15;
  total := 21;

  while total < 1000000000000 do
  begin
    tmp := blue;
    blue := 3 * blue + 2 * total - 2;
    total := 4 * tmp + 3 * total - 3;
  end;

  writeln(blue);
end.
