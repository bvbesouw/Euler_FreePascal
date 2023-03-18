
PROGRAM problem_77;

{$mode ObjFPC}{$H+}

const primes : array[0..21] of longint = (2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79);

var L, target,p,i : longint;
	ways : array of longint;

begin
	L := 5000;
	target := 11;
	while true do
	begin
		setlength(ways,target+1);
		FillChar(Pointer(ways)^, Length(ways), Longint(0));
		for p := 0 to high(ways) do ways[p] := 0;
		ways[0] := 1;
		for p in primes do
			for i := p to target+1 do
				inc(ways[i],ways[i-p]);
		if ways[target] > L then 
		break else
		inc(target);
	end; 
	writeln(target);
end.
