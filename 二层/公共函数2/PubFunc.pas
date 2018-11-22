unit PubFunc;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VCLCom, StdVcl,DB,Provider,variants,winsock,Midas,ComConst,
  StdCtrls,ComObj,ConstDeclare,DBClient,ZLib,Math;


  procedure ShowMsg(Info,title:string;Btn_type:byte);overload;//弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
  procedure ShowMsg(Info:string;Btn_type:byte);overload;//弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
  function Msg_Dlg_Ask(Info,title:string;btn_type:byte):boolean;//弹出消息框.提供yes,no选择
  function Pick_Date(inDate:TDAtetime): TDatetime;//选择日期
  function DeQuotedStr(S:string):string;//反QuotedStr函数
  function Get_Month_First_Day(fdate:tDate):TDate;//返回当月1号
  function Get_Month_Last_Day(fdate:tDate):TDate;//返回当月最后一天
  function Get_Year_First_Day(fdate:tDate):TDate;//返回年度1号
  function Get_Year_Last_Day(fdate:tDate):TDate;//返回年度最后一天

  procedure PackStream(var CompressedStream: TMemoryStream);
  procedure UnPackStream(var CompressedStream: TMemoryStream);
  function OleVariant_To_MemoryStream(OV: OleVariant): TMemoryStream;
  function Stream_To_OleVariant(Stream: TMemoryStream): OleVariant;
  function Compress_Data(var vData:oleVariant):boolean;//压缩数据
  function DeCompress_Data(var vData:oleVariant):boolean;//解压缩数据
  function IsDatetime(str:string):boolean;
  function Get_Filter_Of_Fixed_Int(D:Double):integer;
{  function Pick_Cust_ID(Value:variant;AdoConn:TAdoconnection;PickType:byte):variant;//选择客户
  function Pick_Prod_Type(Value:variant;AdoConn:TAdoconnection;PickType:byte):variant;//选择产品类型
  function Pick_Sales_Man(Value:variant;AdoConn:TAdoconnection;PickType:byte):variant;//选择业务员
  function Pick_Sales_Director(Value:variant;AdoConn:TAdoconnection;PickType:byte):variant;//选择业务主管

  function Pick_Date(inDate:TDAtetime): TDatetime;//选择日期

  function Get_Pick_Value(PickItemId:integer;Value:variant;AdoConn:TAdoconnection;PickType:byte):String;//根据挑选项目ID，进行对话框挑选
}


implementation
uses Pick_Item,DatePick;


procedure ShowMsg(Info,title:string;Btn_type:byte);overload;
begin
  case Btn_Type of
    1:  Application.MessageBox(Pchar(Info),Pchar(title),mb_ok);
    2:  Application.MessageBox(Pchar(Info),Pchar(title),MB_OKCANCEL);
  end;
end;

procedure ShowMsg(Info:string;Btn_type:byte);overload;//弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
begin
  case Btn_Type of
    1:  Application.MessageBox(Pchar(Info),'提示',mb_ok);
    2:  Application.MessageBox(Pchar(Info),'提示',MB_OKCANCEL);
  end;
end;

function Msg_Dlg_Ask(Info,title:string;btn_type:byte):boolean;//弹出消息框.提供yes,no选择
begin
  case Btn_Type of
    1:  result := Application.MessageBox(Pchar(Info),Pchar(title),mb_okCancel)=IdOK;
    2:  result := Application.MessageBox(Pchar(Info),Pchar(title),MB_YESNOCANCEL)=IDYes;
    else result := false;
  end;
end;

function Pick_Date(inDate:TDAtetime): TDatetime;//选择日期
begin
  with TfrmDatePick.Create(Application) do
  try
    InitForm(inDate);
    if Showmodal = mrok then
      result := GetDate
    else
      result := 0;
  finally
    free;
  end;
end;

function DeQuotedStr(S:string):string;//反QuotedStr函数
var
  I :integer;
begin
  for I := 1 to Length(S) do
  begin
    if S[i]='''' then
    begin
      Delete(s,i,1);
      break;
    end;
  end;
  for I := Length(S) downto 1 do
  begin
    if S[i]='''' then
    begin
      Delete(s,i,1);
      break;
    end;
  end;

  Result := S;
end;

function Get_Month_First_Day(fdate:tDate):TDate;//返回当月1号
var
  Y,M,D:Word;
begin
  DecodeDate(fdate,y,m,d);
  result := EnCodeDate(y,m,1);
end;

function Get_Month_Last_Day(fdate:tDate):TDate;//返回当月最后一天
var
  Y,M,D:Word;
begin
  DecodeDate(fdate,y,m,d);
  if m=12 then
    result := EnCodedate(y+1,1,1)-1
  else
    result := EnCodeDate(y,m+1,1)-1;
end;

function Get_Year_First_Day(fdate:tDate):TDate;//返回年度1号
var
  Y,M,D:Word;
begin
  DecodeDate(fdate,y,m,d);
  result := EnCodedate(y,1,1);
end;

function Get_Year_Last_Day(fdate:tDate):TDate;//返回年度最后一天
var
  Y,M,D:Word;
begin
  DecodeDate(fdate,y,m,d);
  result := EnCodedate(y+1,1,1)-1
end;


procedure PackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TCompressionStream;
  DestStream: TMemoryStream;
  Count: Integer;
Begin
  Count := CompressedStream.Size;
  DestStream := TMemoryStream.Create;
  SourceStream:=TCompressionStream.Create(clDefault, DestStream);
  Try
    CompressedStream.SaveToStream(SourceStream);
    SourceStream.Free;
    CompressedStream.Clear;
    CompressedStream.WriteBuffer(#6#3#1, 3);    //631 是压缩标记
    CompressedStream.WriteBuffer(Count, SizeOf(Count));
    CompressedStream.CopyFrom(DestStream, 0);
  finally
    DestStream.Free;
  end;
end;

procedure UnPackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TDecompressionStream;
  DestStream: TMemoryStream;
  Buffer: PChar;
  Count: integer;
  tmpstr:string;
Begin
  CompressedStream.Position:=0;
  tmpstr:='DDD';
  CompressedStream.ReadBuffer(tmpstr[1], 3);
  if tmpstr<>#6#3#1 then exit; //判断是否压缩的流
  CompressedStream.ReadBuffer(Count, SizeOf(Count));
  GetMem(Buffer, Count);
  DestStream := TMemoryStream.Create;
  SourceStream := TDecompressionStream.Create(CompressedStream);
  Try
    SourceStream.ReadBuffer(Buffer^, Count);
    DestStream.WriteBuffer(Buffer^, Count);
    SourceStream.Free;
    DestStream.Position := 0;//复位流指针
    CompressedStream.LoadFromStream(DestStream);
  finally
    FreeMem(Buffer);
    DestStream.Free;
  end;
end;

function OleVariant_To_MemoryStream(OV: OleVariant): TMemoryStream;
var
  Data: PByteArray;
  Size: integer;
begin
  Result := TMemoryStream.Create;
  try
      Size := VarArrayHighBound (OV, 1) - VarArrayLowBound(OV, 1) + 1;
      Data := VarArrayLock(OV);
      try
       Result.Position := 0;
       Result.WriteBuffer(Data^, Size);
      finally
       VarArrayUnlock(OV);
      end;
  except
      Result.Free;
      Result := nil;
  end;
end;

function Stream_To_OleVariant(Stream: TMemoryStream): OleVariant;
var
  Data: PByteArray;
begin
  Result := VarArrayCreate([0, Stream.Size - 1], varByte);
  Data := VarArrayLock(Result);
  try
    Stream.Position := 0;
    Stream.ReadBuffer(Data^, Stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

function Compress_Data(var vData:oleVariant):boolean;//压缩数据
var
  InStream:TMemoryStream;
begin
  InStream:=TMemoryStream.Create;
  try
    InStream:= OleVariant_To_MemoryStream(vData);
    try
      PackStream(InStream);
      vData:= Stream_To_OleVariant(InStream);
      result := true;
    except
      result := false;
    end;
  finally
    InStream.free;
  end;
end;

function DeCompress_Data(var vData:oleVariant):boolean;//解压缩数据
var
  InStream:TMemoryStream;
begin
  InStream:=TMemoryStream.Create;
  try
    InStream:= OleVariant_To_MemoryStream(vData);
    try
      UnPackStream(InStream);
      vData:= Stream_To_OleVariant(InStream);
      result := true;
    except
      result := false;
    end;
  finally
    InStream.free;
  end;
end;

function IsDatetime(str:string):boolean;
begin
  result := true;
  try
    StrTodatetime(str);
  except
    result := false;
  end;
end;

function Get_Filter_Of_Fixed_Int(D:Double):integer;
var
  Int_Part:string;
  i,iLen:integer;
begin
  Int_Part:= IntToStr(trunc(Abs(d)));
{  i:=Pos('0',Int_Part);
  if i>0 then
  begin
    iLen:=Length(Int_Part)-i+1;
    result := trunc(int(d/Power(10,iLen))*Power(10,iLen)) + trunc(Power(10,iLen));
  end
  else
  begin
    iLen:=Length(Int_Part);
    result:= trunc(int(d/Power(10,iLen-1))*Power(10,iLen-1))+10;
  end;}
  iLen:=Length(Int_Part);
  result := trunc(int(d/Power(10,iLen-1))*Power(10,iLen-1))+trunc(Power(10,iLen-1));

end;

end.

