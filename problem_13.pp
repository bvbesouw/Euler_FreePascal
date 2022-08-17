
PROGRAM problem_13;

{$mode ObjFPC}{$H+}

USES 
Classes, SysUtils,gmp;


CONST 
  C_FNAME = 'problem_13.txt';

VAR 
  numbers: TStringList;
  x: longint;
  a,b: mpz_t;
  out: PChar;

BEGIN
  numbers := TStringList.Create;
  TRY
    numbers.LoadFromFile(C_FNAME);
  EXCEPT
    on E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;
mpz_init_set_ui(a, 0);
FOR x := 0 TO pred(numbers.count) DO
  BEGIN
    mpz_set_str(b, pchar(numbers[x]),10);
    mpz_add(a,a,b)
  END;
out := mpz_get_str(NIL, 10, a);
writeln(leftstr(out, 10));
END.
