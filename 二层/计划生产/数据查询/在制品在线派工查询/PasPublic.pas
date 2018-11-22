unit PasPublic;

interface
     uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls,ExtCtrls,ActnList,DBGridEh,IniFiles,
  ComObj,Registry;
Type
  Time_Story  =   (ts_12,       {12 小时制}
                   ts_24        {24 小时制}
                  );
function GetTimeStory: Time_Story;
procedure SetTimeStory(const Story: Time_Story);
//取表RKey值
function GetDataRkey2(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
function GetDataRkey(Const Tablename,FieldName,strValues:String;AdoConn:TADOConnection;whereT:String=''):Integer;
//传入，字段名，字段值，AdoConn，条件可为空，返回记录数。
function ResultRecordCount(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var
   ListDEPT,ListDEPT2: TStringList; //存列表
   dListDEPT:TList;
implementation
{ ------------------------------------------------------------------------
//
//   返回当前系统时间的显示方式
//
//   返回值 :
//          默认的返回为 24 小时制
//
  -----------------------------------------------------------------------}
function GetTimeStory: Time_Story;
var
  Reg: TRegistry;
begin
  Result := ts_24;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('\Control Panel\International', False);
  Try
    if Reg.ReadString('sTimeFormat') = 'tt h:mm:ss' then
       Result := ts_12
    else
       Result := ts_24;
  Finally;
    Reg.CloseKey;
    Reg.Free;
  end;
end;


{ ---------------------------------------------------------------------------
//
//   把系统时间的显示方式设置为指定类型
//
//   参数   :
//          Story       :       指定类型
//
  --------------------------------------------------------------------------}

procedure SetTimeStory(const Story: Time_Story);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  {设置根主键为  HKEY_CURRENT_USER}
  Reg.RootKey := HKEY_CURRENT_USER;
  {打开主键   '\Control Panel\International'}
  Reg.OpenKey('\Control Panel\International', False);
  Try   {写入数据}
    Case Story of
      ts_12:    {12 小时制}
        begin
          Reg.WriteString('iTime', '0');
          Reg.WriteString('iTimePrefix', '1');
          Reg.WriteString('sTimeFormat', 'tt h:mm:ss');
        end;
      ts_24:    {24 小时制}
        begin
          Reg.WriteString('iTime', '1');
          Reg.WriteString('iTimePrefix', '0');
          Reg.WriteString('sTimeFormat', 'H:mm:ss');
        end;
    end;
  Finally;
    Reg.CloseKey;       {关闭主键}
    Reg.Free;
  end;
end;

//取表RKey值
function GetDataRkey2(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      if (whereT<>'') then
        tmpAdo.SQL.Text:='select * from '+Tablename+' '+whereT+''
      else
        tmpAdo.SQL.Text:='select * from '+Tablename+'';
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        Result:=tmpAdo.FieldBYName('Rkey').AsInteger;
      end else
        Result:=0;
    except
      Result:=0;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
    tmpAdo:=nil;
  end;
end;

//取表RKey值
function GetDataRkey(Const Tablename,FieldName,strValues:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      if (whereT<>'') then
        tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+''' and '+whereT+''
      else
        tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+'''';
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        Result:=tmpAdo.FieldBYName('Rkey').AsInteger;
      end else
        Result:=0;
    except
      Result:=0;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
    tmpAdo:=nil;
  end;
end;

//传入，字段名，字段值，AdoConn，条件可为空，返回记录数。
function ResultRecordCount(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      if (whereT<>'') then
      begin
         tmpAdo.SQL.Text:='select * from '+Tablename+' '+whereT+'';
      end else
      begin
          tmpAdo.SQL.Text:='select * from '+Tablename+'';
      end;
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        Result:=tmpAdo.RecordCount;
      end else
        Result:=0;
    except
      Result:=0;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

end.
 