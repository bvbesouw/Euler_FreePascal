
PROGRAM problem_;

{$mode ObjFPC}{$H+}

USES 
Classes, SysUtils,strutils;


CONST 
  C_FNAME = 'problem_89.txt';

VAR 
  roman_numbers: TStringList;
  x,out_number,sum : longint;
BEGIN
  roman_numbers := TStringList.Create;
  sum := 0;
  TRY
    roman_numbers.LoadFromFile(C_FNAME);
  EXCEPT
    on E: EInOutError DO
          writeln('File handling error occured. Reason: ', E.Message);
END;
FOR x := 0 TO pred(roman_numbers.count) DO
  IF TryRomanToInt(roman_numbers[x],out_number,rcsRelaxed) THEN
    inc(sum,length(roman_numbers[x])- length(IntToRoman(out_number)))
  ELSE
    BEGIN
      writeln('couldn''t convert : ',roman_numbers[x]);
      halt;
    END;
writeln(sum);
END.
