
PROGRAM problem_80;

{$mode ObjFPC}{$H+}

USES 
gmp;

VAR 
  x,som: longint;
  sq_me: mpf_t;
  strexp: mp_exp_t;
  ot: PChar;

FUNCTION Sum100Digits(num: STRING): longint;

VAR i,sm : integer;
BEGIN
  sm := 0;
  FOR i := 1 TO 100 DO
    inc(sm,ord(num[i])-48);
  result := sm;
END;

BEGIN
  mpf_set_default_prec(500);
  mpf_init(sq_me);
  som := 0;
  FOR x := 1 TO 100 DO
    BEGIN
      mpf_set_ui(sq_me,x);
      mpf_sqrt(sq_me, sq_me);
      ot := mpf_get_str(NIL,strexp,10,102,sq_me);
      IF length(ot) > 1 THEN
        inc(som,Sum100Digits(ot));
    END;
  writeln(som);
END.
