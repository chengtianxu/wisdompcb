{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uLoginFunc;

interface
uses
  System.SysUtils,IdHashMessageDigest,IdGlobal, IdHash, Vcl.Dialogs,
  Winapi.WinSock, Winapi.Windows;


function GetLocalIP: string; //获取本机IP
function GetLocalName: string; //获得电脑名称

function Base64_Encode(DecryptedText: string): string;
function Base64_Decode(a: string): string;

//MD5
function MD5Print(AStr: string): string;


implementation


const
  base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';


function MD5Print(AStr: string): string;
var
  LMD5: TIdHashMessageDigest5;
begin
  LMD5 := TIdHashMessageDigest5.Create;
  try
    Result := LMD5.HashStringAsHex(AStr);
  finally
    LMD5.Free;
  end;
end;


function mimeencode(w: Integer): string;
begin
  if w >= 0 then
    result := copy(base64, w + 1, 1)
  else
    result := '';
end;
function mimedecode(a: string): Integer;
begin
  if Length(a) = 0 then
  begin
    result := -1;
    Exit;
  end;
  result := pos(a, base64) - 1;
end;

function Base64_Encode(DecryptedText: string): string;
var
  c1, c2, c3: integer;
  w1, w2, w3, w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(DecryptedText) do
  begin
    c1 := ord(DecryptedText[n]);
    c2 := ord(DecryptedText[n + 1]);
    c3 := ord(DecryptedText[n + 2]);
    w1 := Trunc(c1 / 4);
    w2 := (c1 and 3) * 16 + Trunc(c2 / 16);
    if (Length(DecryptedText) >= n + 1) then
      w3 := (c2 and 15) * 4 + Trunc(c3 / 64)
    else w3 := -1;
    if (Length(DecryptedText) >= n + 2) then w4 := c3 and 63
    else w4 := -1;
    retry := retry + mimeencode(w1) + mimeencode(w2) + mimeencode(w3) + mimeencode(w4);
    n := n + 3;
  end;
  result := retry;
end;


function Base64_Decode(a: string): string;
var
  w1: Integer;
  w2: Integer;
  w3: Integer;
  w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(a) do
  begin
    w1 := mimedecode(a[n]);
    w2 := mimedecode(a[n + 1]);
    w3 := mimedecode(a[n + 2]);
    w4 := mimedecode(a[n + 3]);
    if w2 >= 0 then retry := retry + Char(((w1 * 4 + Trunc(w2 / 16)) and 255));
    if w3 >= 0 then retry := retry + Char(((w2 * 16 + Trunc(w3 / 4)) and 255));
    if w4 >= 0 then retry := retry + Char(((w3 * 64 + w4) and 255));
    n := n + 4;
  end;
  result := retry;
end;

function GetLocalIP: string;
var
  HostEnt: PHostEnt;
  IP: String;
  Addr: PAnsiChar;
  Buffer: array [0..63] of AnsiChar;
  WSData: TWSADATA;
begin
  try
    if WSAStartUp($0101, WSData) <> 0 then exit;
    GetHostName(Buffer, SizeOf(Buffer));
    HostEnt := GetHostByName(Buffer);
    if HostEnt = nil then exit;
    Addr := HostEnt^.h_addr_list^;
    IP := Format( '%d.%d.%d.%d', [ Byte(Addr[0]), Byte(Addr[1]),Byte(Addr[2]), Byte(addr[3]) ]);
    result := Ip;
  finally
    WSACleanup;
  end;
end;

function GetLocalName: string;
var
  ComputerName: array [0 .. MAX_COMPUTERNAME_LENGTH + 1] of Char; // 保留计算机名的缓冲区
  Buffer: Dword; // 缓冲区大小
begin
  Buffer := MAX_COMPUTERNAME_LENGTH + 1;
  if GetComputerNameW(@ComputerName[0], Buffer) then
  begin
    Result := ComputerName;
  end
  else
  begin
    Result := '';
  end;
end;


end.
