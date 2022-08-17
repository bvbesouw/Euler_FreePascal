
PROGRAM problem_63;

USES gmp;

VAR i,counter,power : integer;
  dummy: mpz_t;
  ot : pchar;
BEGIN
  counter := 0;
  FOR i := 1 TO 10 DO
    BEGIN
      power := 1;
      WHILE true DO
        BEGIN
          mpz_ui_pow_ui(dummy,i,power);
          ot := mpz_get_str(NIL, 10, dummy);
          IF power = length(ot) THEN
            inc(counter)
          ELSE
            break;
          inc(power);
        END;
    END;
  writeln(counter);
END.
