
UNIT euler;
{$mode ObjFPC}{$H+}


INTERFACE

USES sysutils;

TYPE 
  TDynBools = array OF boolean;

FUNCTION Shuffle(inp: STRING): STRING;
{ This function shuffles all the letters of the input string and returns the new string }
FUNCTION Reverse(inp: STRING): STRING;
OVERLOAD;
{ This function reverses all the letters of the input string and returns the new string }
FUNCTION fib(CONST n: uint64): uint64;
{ this function returns the nth fiboUnacci number, upto 94 }
FUNCTION GetSumOfDigits(num: uint64): longint;
Overload;{ this function returns the sum of digits }
FUNCTION GetSumOfDigits(num: STRING): longint;
Overload;
FUNCTION Reverse(num: uint64): uint64;
OVERLOAD;
FUNCTION Reverse(num: longint): longint;
OVERLOAD;
FUNCTION IsPalindrome(num: STRING): boolean;
OVERLOAD;
FUNCTION IsPalindrome(num: uint64): boolean;
OVERLOAD;
FUNCTION GetDigit(num, digit: uint64): integer;
// returns value of a given digit counting from the right (ones first)
FUNCTION Num_Of_Digits(i: uint64): longint;
FUNCTION NumberOfDivisors(lin: longint): longint;
FUNCTION sum_of_divisors(lin: longint): longint;
FUNCTION fact(n: uint64): uint64;
FUNCTION intpower(base, expon: longint): longint;
FUNCTION sort_string(woord: STRING): STRING;
FUNCTION sort_number(x:qword): qword;
FUNCTION IsPandigital(s: STRING): boolean;
FUNCTION IsPentagonal(p: uint64): boolean;
FUNCTION IsHexagonal(p: uint64): boolean;
FUNCTION GCD(a, b: Int64): Int64;
FUNCTION Sieve(top : longint): TdynBools;

IMPLEMENTATION

USES Classes, Math;



CONST 
  to_be_checked = '123456789';

FUNCTION Shuffle(inp: STRING): STRING;

VAR 
  List      : TStringList;
  Counter, x: longint;
  tmp       : STRING;
BEGIN
  Randomize;
  List := TStringList.Create;
  tmp := '';
  FOR Counter := 1 TO length(inp) DO
    List.Add(inp[Counter]);
  FOR Counter := 1 TO length(inp) DO
    BEGIN
      x := Random(List.Count);
      tmp := tmp + List[x];
      List.Delete(x);
    END;
  List.Free;
  Result := tmp;
END;

FUNCTION Reverse(inp: STRING): STRING;
OVERLOAD;

VAR 
  x, inp_length: longint;
  temp         : char;
BEGIN
  inp_length := length(inp);
  FOR x := 1 TO (length(inp) DIV 2) DO
    BEGIN
      temp := inp[x];
      inp[x] := inp[inp_length + 1 - x];
      inp[inp_length + 1 - x] := temp;
    END;
  Result := inp;
END;

FUNCTION fib(CONST n: uint64): uint64;
BEGIN
  // optimization: then part gets executed most of the time
  IF n > 1 THEN
    Result := fib(n - 2) + fib(n - 1)
  ELSE
    Result := n;
END;

FUNCTION GetSumOfDigits(num: uint64): longint;
overload;
// Returns sums of all digits

VAR 
  sum  : longint;
  dummy: uint64;
BEGIN
  sum := 0;
  REPEAT
    dummy := num;
    num := num DIV 10;
    Inc(sum, dummy - (num SHL 3 + num SHL 1));
  UNTIL num < 1;
  Result := sum;
END;

FUNCTION GetSumOfDigits(num: STRING): longint;
overload;

VAR i,sm : integer;
BEGIN
  sm := 0;
  FOR i := 1 TO length(num) DO
    sm := sm + ord(num[i])-48;
  result := sm;
END;



FUNCTION Reverse(num: uint64): uint64;
OVERLOAD;

VAR 
  r: uint64;
BEGIN
  r := 0;
  WHILE (num > 0) DO
    BEGIN
      r := r * 10 + (num MOD 10);
      num := num DIV 10;
    END;
  Result := r;
END;

FUNCTION Reverse(num: longint): longint;
OVERLOAD;

VAR 
  r: longint;
BEGIN
  r := 0;
  WHILE (num > 0) DO
    BEGIN
      r := r * 10 + (num MOD 10);
      num := num DIV 10;
    END;
  Result := r;
END;

FUNCTION IsPalindrome(num: STRING): boolean;
OVERLOAD;
BEGIN
  Result := num = Reverse(num);
END;

FUNCTION IsPalindrome(num: uint64): boolean;
OVERLOAD;
BEGIN
  Result := num = Reverse(num);
END;

FUNCTION GetDigit(num, digit: uint64): integer;
// returns value of a given digit counting from the right (ones first)

VAR 
  z: integer;

BEGIN
  FOR z := 1 TO digit - 1 DO
    num := num DIV 10;
  Result := num MOD 10;
END;

FUNCTION Num_Of_Digits(i: uint64): longint;
BEGIN
  Result := Floor(Log10(i)) + 1;
END;

FUNCTION NumberOfDivisors(lin: longint): longint;

VAR 
  lcnt, nod: longint;
BEGIN
  lcnt := 1;
  nod := 0;
  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        Inc(nod, 2);
      lcnt := lcnt + 1;
    END;
  IF lcnt * lcnt = lin THEN
    dec(nod);
  NumberOfDivisors := nod;
END;

FUNCTION sum_of_divisors(lin: longint): longint;

VAR 
  lcnt, sod: longint;
BEGIN
  sod := 1;
  lcnt := 2;
  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        BEGIN
          sod := sod + lcnt + lin DIV lcnt;
          IF lcnt * lcnt = lin THEN
            dec(sod, lcnt);
        END;
      lcnt := lcnt + 1;
    END;
  sum_of_divisors := sod;
END;

FUNCTION fact(n: uint64): uint64;
BEGIN
  IF (n = 0) THEN
    fact := 1
  ELSE
    fact := n * fact(n - 1);
END;

FUNCTION intpower(base, expon: longint): longint;

VAR 
  i, ip: longint;
BEGIN
  ip := 1;
  FOR i := 1 TO expon DO
    ip := ip * base;
  intpower := ip;
END;

FUNCTION sort_string(woord: STRING): STRING;

VAR 
  flip   : boolean;
  stop, i: integer;
  dummy  : char;
BEGIN
  stop := length(woord);
  REPEAT
    flip := false;
    dec(stop);
    FOR i := 1 TO stop DO
      BEGIN
        IF woord[i] > woord[i + 1] THEN
          BEGIN
            dummy := woord[i + 1];
            woord[i + 1] := woord[i];
            woord[i] := dummy;
            flip := true;
          END;
      END;
  UNTIL NOT flip;
  Result := woord;
END;

FUNCTION sort_number(x : qword) : qword;
BEGIN
  result := strtoint(sort_string(inttostr(x)));
END;

FUNCTION IsPandigital(s: STRING): boolean;
BEGIN
  Result := (length(s) = 9) AND (sort_string(s) = to_be_checked);
END;

FUNCTION IsPentagonal(p: qword): boolean;
BEGIN
  result := 0 = ((1 + sqrt(24 * p + 1)) MOD 6);
END;

FUNCTION IsHexagonal(p: qword): boolean;
BEGIN
  result := 0 = ((1 + sqrt(8 * p + 1)) MOD 4);
END;

FUNCTION GCD(a, b: Int64): Int64;
BEGIN
  // only works with positive integers
  IF (a < 0) THEN a := -a;
  IF (b < 0) THEN b := -b;
  // don't enter loop, since subtracting zero won't break condition
  IF (a = 0) THEN exit(b);
  IF (b = 0) THEN exit(a);
  WHILE NOT (a = b) DO
    BEGIN
      IF (a > b) THEN
        a := a - b
      ELSE
        b := b - a;
    END;
  result := a;
END;

FUNCTION Sieve(top : longint): TdynBools;

VAR i,j : longint;
BEGIN
  setlength(result,top);
  FOR i := 2 TO top DO
    result[i] := True;
  FOR i := 2 TO top DO
    BEGIN
      IF result[i] THEN
        FOR j := 2 TO (top DIV i) DO
          result[i * j] := False;
    END;
END;

END.
