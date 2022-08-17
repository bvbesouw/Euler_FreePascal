
PROGRAM problem52;
{$mode ObjFPC}{$H+}

USES Euler;

VAR i : integer;


BEGIN
  i := 1;
  WHILE true DO
    IF (sort_number(6*i) = sort_number(5*i)) AND
       (sort_number(5*i) = sort_number(4*i)) AND
       (sort_number(4*i) = sort_number(3*i)) AND
       (sort_number(3*i) = sort_number(2*i))
      THEN
      BEGIN
        writeln(i);
        break;
      END
    ELSE inc(i);
END.
