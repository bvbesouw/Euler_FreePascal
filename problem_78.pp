program Euler78;

{$mode objfpc}{$H+}

const
  K = 100000;
  Target = 1000000;

type
  TInt64Array = array of Int64;

var
  Partitions: TInt64Array;
  n: Integer;

function CalculatePartitions(i: Integer): Int64;
var
  j, k, s: Integer;
begin
  s := 0;
  for j := 1 to i do
  begin
    k := j * (3 * j - 1) div 2;
    if k > i then break;
    if j mod 2 = 0 then s := s - Partitions[i - k] else s := s + Partitions[i - k];
    k := k + j;
    if k > i then continue;
    if j mod 2 = 0 then s := s - Partitions[i - k] else s := s + Partitions[i - k];
  end;
  Result := s mod Target;
end;

procedure ComputePartitions;
var
  i: Integer;
begin
  SetLength(Partitions, K + 1);
  Partitions[0] := 1;
  for i := 1 to K do
    Partitions[i] := CalculatePartitions(i);
end;

begin
  ComputePartitions;
  n := 0;
  while Partitions[n] mod Target <> 0 do
    Inc(n);
  writeln(n);
end.
