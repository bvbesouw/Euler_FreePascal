
UNIT euler;
{$mode ObjFPC}{$H+}


INTERFACE

USES sysutils,strutils;

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
FUNCTION sort_string(inputstring: STRING): STRING;
FUNCTION sort_number(x:qword): qword;
FUNCTION IsPandigital(s: STRING): boolean;
FUNCTION IsPentagonal(p: uint64): boolean;
FUNCTION IsHexagonal(p: uint64): boolean;
FUNCTION GCD(a, b: Int64): Int64;
FUNCTION Sieve(top : longint): TdynBools;
FUNCTION isPrimeCheck(CONST n:int64): boolean;

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

BEGIN
  Result := ReverseString(inp);
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
      inc(lcnt);
    END;
  dec(lcnt);
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

FUNCTION sort_string(inputstring: STRING): STRING;
PROCEDURE QuickSortString(VAR str: STRING; left, right: Integer);

VAR 
  i, j: Integer;
  pivot, temp: Char;
BEGIN
  i := left;
  j := right;
  pivot := str[(left + right) DIV 2];

  WHILE i <= j DO
    BEGIN
      WHILE str[i] < pivot DO
        Inc(i);
      WHILE str[j] > pivot DO
        Dec(j);

      IF i <= j THEN
        BEGIN
          temp := str[i];
          str[i] := str[j];
          str[j] := temp;
          Inc(i);
          Dec(j);
        END;
    END;

  IF left < j THEN
    QuickSortString(str, left, j);
  IF i < right THEN
    QuickSortString(str, i, right);
END;


BEGIN
  Result := inputString;
  QuickSortString(Result, 1, Length(Result));
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
{very basic sieve but works fast enough for the relative small numbers in project Euler}

VAR i,j : longint;
BEGIN
  setlength(result,top);
  FillChar(Pointer(result)^, Length(result), Byte(True));
  FOR i := 2 TO top DO
    BEGIN
      IF result[i] THEN
        FOR j := 2 TO (top DIV i) DO
          result[i * j] := False;
    END;
END;

FUNCTION isPrimeCheck(CONST n:int64): boolean;
FUNCTION millerRabinTest(CONST n,a:int64): boolean;
FUNCTION modularMultiply(x,y:qword): int64;

VAR d: qword;
  mp2: qword;
  i: longint;
BEGIN
  IF (x OR y) AND 9223372034707292160=0
    THEN result := x*y MOD n
  ELSE
    BEGIN
      d := 0;
      mp2 := n shr 1;
      FOR i:=0 TO 62 DO
        BEGIN
          IF d>mp2
            THEN d := (d shl 1)-qword(n)
          ELSE d := d shl 1;
          IF (x AND 4611686018427387904)>0 THEN inc(d,y);
          IF d>=qword(n) THEN d := d+qword(n);
          x := x shl 1;
        END;
      result := d;
    END;
END;

VAR n1,d,t,p: int64;
  j: longint = 1;
  k: longint;
BEGIN
  n1 := int64(n)-1;
  d := n shr 1;
  WHILE NOT(odd(d)) DO
    BEGIN
      d := d shr 1;
      inc(j);
    END;
  //1<=j<=63, 1<=d<=2^63-1
  t := a;
  p := a;
  WHILE (d>1) DO
    BEGIN
      d := d shr 1;
      //p:=p*p mod n;
      p := modularMultiply(p,p);
      IF odd(d) THEN t := modularMultiply(t,p);
      //t:=t*p mod n;
    END;
  IF (t=1) OR (t=n1) THEN exit(true);
  FOR k:=1 TO j-1 DO
    BEGIN
      //t:=t*t mod n;
      t := modularMultiply(t,t);
      IF t=n1 THEN exit(true);
      IF t<=1 THEN break;
    END;
  result := false;
END;

FUNCTION isComposite: boolean;

VAR x: int64 = 1;
  y: int64 = 2*3*5*7*11*13*17*19*23*29*31*37*41*43*47;
  z: int64 = 1;
BEGIN
  x := n MOD y;
  z := y;
  y := x;
  WHILE (y<>0) DO
    BEGIN
      x := z MOD y;
      z := y;
      y := x;
    END;
  result := z>1;
END;

BEGIN
  IF (n<=1) THEN exit(false);
  IF (n<48) THEN exit(byte(n) in [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]);
  IF isComposite THEN exit(false)
  ELSE IF n<2209 THEN exit(true);
  //2209=47*47
  IF n< 9080191
    THEN exit(millerRabinTest(n,31) and
    millerRabinTest(n,73))
  ELSE
    IF n<25326001
      THEN exit(millerRabinTest(n,2) and
      millerRabinTest(n,3) and
      millerRabinTest(n,5))
  ELSE
    IF n < 4759123141
      THEN exit(millerRabinTest(n,2) and
      millerRabinTest(n,7) and
      millerRabinTest(n,61))
  ELSE
    IF n < 2152302898747   //[41bit] it is enough to test a =   array[0..4] of byte=(2,3,5,7,11);
      THEN exit(millerRabinTest(n, 2) and
      millerRabinTest(n, 3) and
      millerRabinTest(n, 5) and
      millerRabinTest(n, 7) and
      millerRabinTest(n,11))
  ELSE
    IF n < 3474749660383   //[42bit] it is enough to test a =   array[0..5] of byte=(2,3,5,7,11,13);
      THEN exit(millerRabinTest(n, 2) and
      millerRabinTest(n, 3) and
      millerRabinTest(n, 5) and
      millerRabinTest(n, 7) and
      millerRabinTest(n,11) and
      millerRabinTest(n,13))
  ELSE
    IF n < 341550071728321
       //[49bit] it is enough to test a = array[0..6] of byte=(2,3,5,7,11,13,17);
      THEN exit(millerRabinTest(n, 2) and
      millerRabinTest(n, 3) and
      millerRabinTest(n, 5) and
      millerRabinTest(n, 7) and
      millerRabinTest(n,11) and
      millerRabinTest(n,13) and
      millerRabinTest(n,17))
  ELSE

    //if n < 18446744073709551616 = 2^64, it is enough to test a = 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, and 37.
    result := millerRabinTest(n, 2) AND
              millerRabinTest(n, 3) AND
              millerRabinTest(n, 5) AND
              millerRabinTest(n, 7) AND
              millerRabinTest(n,11) AND
              millerRabinTest(n,13) AND
              millerRabinTest(n,17) AND
              millerRabinTest(n,19) AND
              millerRabinTest(n,23) AND
              millerRabinTest(n,29) AND
              millerRabinTest(n,31) AND
              millerRabinTest(n,37);
END;
END.
