
PROGRAM problem_75;
{$mode ObjFPC}{$H+}

USES euler;

CONST 
  limit = 1500000;

TYPE 
  Ta = array[1..limit] OF longint;

VAR result, mlimit,m,n,abc,p : longint;
  triangles : Ta;

BEGIN
  result := 0;
  triangles := Default(Ta);
  mlimit := trunc(sqrt(limit/2));
  FOR m := 2 TO pred(mlimit) DO
    FOR n := 1 TO pred(m) DO
      IF (odd(n+m) AND (gcd(n,m) = 1)) THEN
        BEGIN
          abc := 2*(m*m)+2*m*n;
          p := abc;
          WHILE p < limit DO
            BEGIN
              inc(triangles[p]);
              CASE triangles[p] OF 
                1 : inc(result);
                2 : dec(result);
              END;
              inc(p,abc);
            END;
        END;
  writeln(result);
END.
