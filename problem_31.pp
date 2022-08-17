
PROGRAM problem31;

CONST max = 200;
  //200 pennies

VAR counter,a,b,c,d,e,f : longint;

BEGIN
  counter := 1;
  // start at 1 for the 200p coin
  // number of 100p coins
  FOR a := 0 TO 2 DO
    // number of 50p coins
    FOR b := 0 TO  ((200-100*a) DIV 50) DO
      // number of 20p coins
      FOR c := 0 TO ((200-100*a-50*b) DIV 20) DO
        // number of 10p coins
        FOR d := 0 TO ((200-100*a-50*b-20*c) DIV 10) DO
          // number of 5p coins
          FOR e := 0 TO (200-100*a-50*b-20*c-10*d) DIV 5 DO
            // number of 2p coins
            FOR f := 0 TO (200-100*a-50*b-20*c-10*d-5*e) DIV 2 DO
              inc(counter);
  writeln(counter);
END.
