program problem054;
{$mode ObjFPC}{$H+} 
USES
  Classes, SysUtils,fgl;
  
TYPE
  TIntegerList = SPECIALIZE TfpgList<uint32>;

  
CONST
  C_FNAME = '0059_cipher.txt';
  SPACE = 32; //assume space is most used charachter

VAR
  slInfo: TStringList;
  code : string;
  frequency : array[1..3,1..200] of uint32;
  codes, maxf : array[1..3] of uint32;
  inputlist : TIntegerList;
  total,count,index : uint32; 
  
BEGIN

  inputlist := TIntegerList.Create;	
  slInfo := TStringList.Create;
  slInfo.delimiter := char(',');
  TRY
    slInfo.LoadFromFile(C_FNAME);
  EXCEPT
    ON E: EInoutError DO
      writeln('File handling error occurred. Reason: ', E.Message);
  END;
  slInfo.delimitedText := slInfo.Text;
  //move data into a list of integer;
  for code in slinfo do
     inputlist.add(strtoint(code));
  slinfo.free;
  
  //determine most used charachter for all 3 columns
  for count := 1 to 3 do
    for index := 1 to 200 do
       frequency[count,index] := 0;

  
  for index := 0 to inputlist.count-1 do
	inc(frequency[index mod 3 + 1, inputlist[index]]);

for index := 1 to 3 do
  maxf[index] := 0;

  for index := 1 to 200 do
  begin
    for count := 1 to 3 do
    if frequency[count,index] > maxf[count] then
    begin
		maxf[count] := frequency[count,index];
		codes[count] := index;
	end; 
  end;

  //map the values to "space"
  for index := 1 to 3 do
	codes[index] := codes[index] XOR SPACE;

  //count the ascii values of the decoded message
  total := 0;
  for index := 0 to inputlist.count-1 do
	inc(total, (inputlist[index] xor codes[index mod 3 + 1]));
  inputlist.free;
 writeln(total);
END.    
