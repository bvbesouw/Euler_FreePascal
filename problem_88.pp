program SumsetSums;

uses
  SysUtils, Math, fgl;

type
  TIntegerHashSet = specialize TFPHashList<uint32>;

const
  MAX = 12000;

var
  StartTime: TDateTime;

function Product(const AArray: array of PtrInt; ASize: Integer): PtrInt;
var
  i: Integer;
begin
  Result := 1;
  for i := 0 to ASize - 1 do
    Result := Result * AArray[i];
end;

function Sum(const AArray: array of PtrInt; ASize: Integer): PtrInt;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ASize - 1 do
    Result := Result + AArray[i];
end;

function Power(const Base: PtrInt; Exponent: Integer): PtrInt;
begin
  Result := Math.Power(Base, Exponent);
end;

procedure FindSumSetSums();
const
  MAX_LENGTH = 15;
var
  Results: array[1..MAX] of PtrInt;
  Len, N, K, Index, IndexBefore: Integer;
  Terms: array[1..MAX_LENGTH] of PtrInt;
  TermSet: TIntegerHashSet;
begin
  for Len := 1 to MAX_LENGTH do
  begin
    for Index := 1 to Len do
      Terms[Index] := 2;

    while True do
    begin
      N := Product(Terms, Len);
      K := N - Sum(Terms, Len) + Len;

      if K <= MAX then
        Results[K] := Min(Results[K], N);

      TermSet := TIntegerHashSet.Create;
      try
        for Index := 0 to Len - 1 do
        begin
          if Product(Terms[Index..Len - 1], Len - Index) * Power(Terms[Index] + 1, Index) <= MAX * 2 then
          begin
            Terms[Index] := Terms[Index] + 1;
            for IndexBefore := 0 to Index - 1 do
              Terms[IndexBefore] := Terms[Index];
            TermSet.Add(@Terms[Index]);
          end;
        end;

        if TermSet.Count = 0 then
          Break;
      finally
        TermSet.Free;
      end;
    end;
  end;

  Writeln('Result: ', Sum(Results[2..MAX], MAX - 1));
  Writeln('Time: ', MilliSecondsBetween(Now, StartTime), 'ms');
end;

begin
  StartTime := Now;
  FindSumSetSums();
end.
