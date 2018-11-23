unit Unit2;

interface
uses
  SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;





function func1(const ASrc, AKey: PAnsiChar): PAnsiChar;stdcall;

function func2(const ASrc, AKey: PAnsiChar): PAnsiChar;stdcall;

implementation




procedure ExChange(pCh: PChar; nSize: Integer);
var
  ch: Char;
  i: Integer;
begin
  if nSize >= 2 then
  begin
    for i := 0 to nSize div 2 - 1 do
    begin
      ch := pCh[i];
      pCh[i] := pCh[nSize - 1 - i];
      pCh[nSize - 1 - i] := ch;
    end;
  end;
end;

function EncryptStr(pSrc, pKey: PChar; SrcLen, KeyLen: Integer): string; overload;
var
  i, Keyidx, step: Integer;
  pch: PChar;
  RetLen, ntmp: Integer;
begin
  Result:='';
  if SrcLen=0 then Exit;
  if SrcLen > KeyLen then
    RetLen := 2 * (SrcLen + 1) + 1
  else
    RetLen := 2 * (KeyLen + 1) + 1;
  SetLength(Result, RetLen);
  begin
    ntmp := RetLen div 2;
    GetMem(pch, ntmp);
    pch[ntmp - 1] := Char(SrcLen - KeyLen);
    for i := 0 to KeyLen - 1 do
      pch[ntmp - 1] := Char(Ord(pch[ntmp - 1]) xor Ord(pKey[i]));
    for i := 0 to ntmp - 2 do
      pch[i] := Char(Ord(pSrc[i mod SrcLen]) xor Ord(pKey[i mod KeyLen])
         xor Ord(pch[ntmp - 1]));

    i := 0;
    Keyidx := 0;
    while (i < ntmp - 1) do
    begin
      step := Ord(pkey[Keyidx mod KeyLen]) mod 10;
      if i + step > ntmp - 1 then
        Step :=  ntmp - 1 - i;
      Exchange(@pch[i], Step);
      Inc(i, Step);
      Inc(Keyidx);
    end;

    for i := 0 to ntmp - 1 do
    begin
      StrFmt(@Result[i * 2+1], '%.2x', [Ord(pch[i])]);
    end;

    FreeMem(pch);
  end;
end;

function DecryptStr(pSrc, pKey: PChar; SrcLen, KeyLen: Integer): string; overload;
var
  i, Keyidx, step: Integer;
  pch: PChar;
  RetLen, ntmp: Integer;
begin
  Result:='';
  if SrcLen=0 then Exit;
  try
    ntmp := SrcLen div 2;
    GetMem(pch, SrcLen);
    HexToBin(pSrc, pch, ntmp);

    i := 0;
    Keyidx := 0;
    while (i < ntmp - 1) do
    begin
      step := Ord(pkey[Keyidx mod KeyLen]) mod 10;
      if i + step > ntmp - 1 then
      begin
        Step :=  ntmp - 1 - i;
        ExChange(@pch[i], Step);
      end
      else
      begin
        Exchange(@pch[i], Step);
      end;
      Inc(i, Step);
      Inc(Keyidx);
    end;
    RetLen := Ord(pch[ntmp - 1]);
    for i := 0 to KeyLen - 1 do
      RetLen := RetLen xor Ord(pKey[i]);
    RetLen := ShortInt(RetLen) + KeyLen;
    if ntmp>RetLen then i:=ntmp else i:=RetLen;
    SetLength(Result, i);
    begin
      for i := 0 to ntmp - 2 do
        Result[i+1] := Char(Ord(pch[i]) xor Ord(pKey[i mod KeyLen]) xor Ord(pch[ntmp - 1]));
    end;
    SetLength(Result, RetLen);
    FreeMem(pch);
  except
    Result:='';
  end;
end;


function func1(const ASrc, AKey: PAnsiChar): PAnsiChar;
var
  LRet: string;
  lbts: array of Byte;
  I: Integer;
begin
  LRet := EncryptStr(ASrc, PChar(AKey), Length(ASrc), Length(AKey));
  SetLength(lbts,Length(LRet)+1);
  for I := 1 to Length(LRet) do
  begin
    lbts[i-1] := ord(lret[I]);
  end;
  lbts[High(lbts)] := 0;
  Result:= PAnsiChar(lbts);
end;

function func2(const ASrc, AKey: PAnsiChar): PAnsiChar;
var
  LRet: string;
  lbts: array of Byte;
  I: Integer;
begin
  LRet := DecryptStr(PChar(ASrc), PChar(AKey), Length(ASrc), Length(AKey));
  SetLength(lbts,Length(LRet)+1);
  for I := 1 to Length(LRet) do
  begin
    lbts[i-1] := Ord(lret[I]);
  end;
  lbts[High(lbts)] := 0;
  Result:= PAnsiChar(lbts);
end;

end.
