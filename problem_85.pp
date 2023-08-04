
var area, width,height,mindist : uint32;
nrects: real;
begin

width := 2000;
height := 1;
mindist := 2000000;
while(width > 1) do
	begin
		nrects := width*(width+1)*height*(height+1) / 4;
		if(abs(nrects - 2000000) < mindist) then
		begin
			mindist := abs(trunc(nrects - 2000000));
			area := width * height;
		end;
		if(nrects > 2000000) then
			inc(width)
		else
		  inc(height);
end;
writeln(area);
end.
