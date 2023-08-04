{$mode ObjFPC}{$H+} 
uses math,euler,fgl,classes,sysutils;
const TOPEND = 50000000;
TYPE
  TDynBools = ARRAY OF boolean;
  TIntegerList = SPECIALIZE TfpgList<uint64>;
  
  
var i,a,b,c,mx,result : uint32;
    is_prime,sums: TDynBools;
	sq, cu, fo : TIntegerList;
	dic : tstringlist;

begin
  is_prime := Sieve(trunc(power(topend,1/2))+1);
  setlength(sums,TOPEND);
  sq := TIntegerList.Create;
  cu := TIntegerList.Create;
  fo := TIntegerList.Create;
  dic := tstringlist.create;
  dic.sorted := true;
  dic.duplicates := dupIgnore;

	for i := 2 to 1 + trunc(power(topend,1/2)) do
	  if is_prime[i] then sq.add(i*i);
	for i := 2 to 1 + trunc(power(topend,1/3)) do
	  if is_prime[i] then cu.add(i*i*i);
	for i := 2 to 1 + trunc(power(topend,1/4)) do
	  if is_prime[i] then fo.add(i*i*i*i);
	  
	 for a in sq do
	   for b in cu do
	     for c in fo do
	       if a+b+c > topend then break else
				dic.add(inttostr(a+b+c));

	writeln(dic.count);
	     
end.
