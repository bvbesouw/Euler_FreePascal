Program problem095;


const n=1000000;
type ar=array[1..n] of longint;
Var     x,y,i:longint;
        max,count:integer;
        c,d,p:ar;

function divi(x:longint):longint;
Var a1,a2,a3:longint;
Begin
	a1:=p[x];
	If a1=0 then 
		a1:=x;
	a3:=x;
	a2:=a1;
	If (d[x div a1]<>0)then
	While (a3 mod a1=0) do
	Begin
		a3:=a3 div a1;
		a2:=a2*a1;
	End;
	If a1=x then
		a1:=1
	else 
	If d[x div a1]=0 then
		a1:=0
	else 
		a1:=(((a2-1)*(d[a3]+a3))div(a1-1))-x;
	If a1<=n then 
		divi:=a1 
	else 
		divi:=0;
End;

Begin

	for i:=1 to n do
	Begin
	c[i]:=0;
	p[i]:=0;
	End;
	For i:=2 to n do
		For y:=2 to (n div i) do
			If p[i*y]=0 then
				p[i*y]:=i;
	d[1]:=0;
	For i:=2 to n do
		d[i]:=divi(i);
	max:=0;
	i:=1;
	While i<=n do
	Begin
		y:=d[i];
		count:=1;
		While (y<=n) and (y>i) and (c[y]<>i) do
		Begin
			c[y]:=i;
			inc(count);
			y:=d[y];
		End;
		If (count>max) and (y=i) then
		Begin
			max:=count;
			x:=i;
		End;
		inc(i);
	End;
	Writeln(x);
End.
