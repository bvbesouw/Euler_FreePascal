
PROGRAM Euler78;

{$mode objfpc}{$H+}

CONST 
  K = 100000;
  Target = 1000000;

TYPE 
  TInt64Array = array OF Int64;

VAR 
  Partitions: TInt64Array;
  n: Integer;

FUNCTION CalculatePartitions(i: Integer): Int64;

VAR 
  j, k, s: Integer;
BEGIN
  s := 0;
  FOR j := 1 TO i DO
    BEGIN
      k := j * (3 * j - 1) DIV 2;
      IF k > i THEN break;
      IF j MOD 2 = 0 THEN s := s - Partitions[i - k]
      ELSE s := s + Partitions[i - k];
      k := k + j;
      IF k > i THEN continue;
      IF j MOD 2 = 0 THEN s := s - Partitions[i - k]
      ELSE s := s + Partitions[i - k];
    END;
  Result := s MOD Target;
END;

PROCEDURE ComputePartitions;

VAR 
  i: Integer;
BEGIN
  SetLength(Partitions, K + 1);
  Partitions[0] := 1;
  FOR i := 1 TO K DO
    Partitions[i] := CalculatePartitions(i);
END;

BEGIN
  ComputePartitions;
  n := 0;
  WHILE Partitions[n] MOD Target <> 0 DO
    Inc(n);
  writeln(n);
END.
