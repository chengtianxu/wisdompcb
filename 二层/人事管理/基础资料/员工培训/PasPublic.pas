unit PasPublic;

interface
     uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls,ExtCtrls,ActnList,DBGridEh,IniFiles,
  ComObj;
  
Function ChangeStr(Str:String):String;
FunCtion GetNewKeyNo(Const Tablename,FieldName,FString,whereTxt:String;NoLen:Integer;AdoConn:TADOConnection):String;
Procedure DeleteRecord(Const TableName,Values:String;AdoConn:TADOConnection;LinkTable:String='';LinkField:String='';FindField:String='';whereT:String='';Deleteother:String='');
Function  IFSingKey2(Const IsInsert:Boolean;Const TableName,KeyField,KeyValues,sWhere:String;AdoConn:TADOConnection):Boolean;
Function  IFSingKey(Const IsInsert:Boolean;Const TableName,KeyField,KeyValues:String;AdoConn:TADOConnection):Boolean;
//删除记录
procedure DeleteRecordOver(const TableName, Values: string; AdoConn: TADOConnection; LinkTable, LinkField, FindField, whereT, Deleteother: string);
//传入表名，字段名，字段值，AdoConn，条件可为空，查询对应表RKey值。
function GetDataRkey(Const Tablename,FieldName,strValues:String;AdoConn:TADOConnection;whereT:String=''):Integer;
function GetDataResult(Const Tablename,FieldName,strValues,strResult:String;AdoConn:TADOConnection;whereT:String=''):string;
//取表RKey值,传入表名，条件返回Rkey值
function GetDataRkey2(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
function GetDataRkey3(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
//传入，字段名，字段值，AdoConn，条件可为空，返回记录数。
function ResultRecordCount(Const Tablename,FieldName,strValues:String;AdoConn:TADOConnection;whereT:String=''):Integer;
Var
   Q_Ftp:integer; //1新增，2编辑，3检查
   Q_Status:Integer;//计算状态
   Q_Status2:Integer;//计算状态
   Q_Table:integer;//1：绩效项目设置；2：业务提成项目设置
   Q_Date10:String;
   Q_Date10_2:string;
   Q_Date8:String;
   Q_RowCountAPage:Integer;
   Q_HintOnRun:String;
   sSql:string;
   v_Field_List_CN,v_Field_List_EN:Variant;

implementation
//传入，字段名，字段值，AdoConn，条件可为空，返回记录数。
function ResultRecordCount(Const Tablename,FieldName,strValues:String;AdoConn:TADOConnection;whereT:String=''):Integer;
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
        if (FieldName='Rkey') then
         tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='+strValues+' and '+whereT+''
        else
         tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+''' and '+whereT+'';
      end else
      begin
        if (FieldName='Rkey') then
          tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='+strValues+''
        else
          tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+'''';
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

Function  IFSingKey2(Const IsInsert:Boolean;Const TableName,KeyField,KeyValues,sWhere:String;AdoConn:TADOConnection):Boolean;
var tmpAdo:TAdoQuery;
Begin
    tmpAdo:=TAdoQuery.Create(Application);
    try
      tmpAdo.Connection :=AdoConn;
      if (sWhere='') then
        tmpAdo.SQL.Text:='Select * from '+tableName
                      +'  where '+KeyField+'='''+KeyValues+''''
      else
        tmpAdo.SQL.Text:='Select * from '+tableName
                      +'  where '+KeyField+'='''+KeyValues+''' and '+sWhere+'';
      tmpAdo.Open;
      if IsInsert then
         if NOt tmpAdo.IsEmpty then
            Raise Exception.Create('输入字段值：['+KeyValues+']已存在，请重新输入！'); 
    finally
       tmpAdo.Free;
    end;
    Result:=False;
end;

function GetDataResult(Const Tablename,FieldName,strValues,strResult:String;AdoConn:TADOConnection;whereT:String=''):string;
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
        if (FieldName='Rkey') then
         tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='+strValues+' and '+whereT+''
        else
         tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+''' and '+whereT+'';
      end else
      begin
        if (FieldName='Rkey') then
          tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='+strValues+''
        else
          tmpAdo.SQL.Text:='select * from '+Tablename+' where '+FieldName+'='''+strValues+'''';
      end;
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        Result:=tmpAdo.FieldBYName(''+strResult+'').AsString;
      end else
        Result:='';
    except
      Result:='';
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
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
  end;
end;

//取表RKey值
function GetDataRkey3(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      if (whereT<>'') then
        tmpAdo.SQL.Text:='select Top 1 * from '+Tablename+' '+whereT+''
      else
        tmpAdo.SQL.Text:='select Top 1 * from '+Tablename+'';
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
  end;
end;

Function ChangeStr(Str:String):String;
var S:String;
Begin
    S:=Str;
    while pos('-',S)>0 do
    begin
       Delete(s,Pos('-',S),1);
    end;
    Result:=S;
end;
FunCtion GetNewKeyNo(Const Tablename,FieldName,FString,whereTxt:String;NoLen:Integer;AdoConn:TADOConnection):String;
var tmpAdoQry:TAdoQuery;
     cmdStr,BegStr,ReturnNo,tmpNo:String;
     Len:Integer;
Begin
   tmpAdoQry:=TAdoQuery.Create(Application);
   try
        Len:=Length(FString);
        BegStr:='0000000000000000000000';
        BegStr:=Copy(BegStr,Len,(NoLen-Len));
        if FString<>'' then
           cmdStr:='Select '+FieldName+' from '+Tablename
            +' where '+FieldName+' Like '''+FString+'%'' Order by '+FieldName
        else
           cmdStr:='Select '+FieldName+' from '+Tablename+' Order by '+FieldName;
        tmpAdoQry.Connection:=AdoConn;
        tmpAdoQry.SQL.Text:=cmdStr;
        tmpAdoQry.Open;
        tmpAdoQry.Last;
        if Trim(tmpAdoQry.FieldByName(FieldName).AsString)='' then
        begin
             Len:=Length(BegStr);
             BegStr:=Copy(BegStr,1,Len-1);
             BegStr:=BegStr+'1';
             ReturnNo:=BegStr;
        end
        else
        begin
            tmpNo:=Trim(tmpAdoQry.FieldByname(FieldName).AsString);
            tmpNo:=Copy(tmpNo,Len+1,NoLen-Len);
            if tmpNO<>'' then
            begin
            try
            tmpNo:=IntToStr(StrToInt(tmpNO)+1);
            Len:=Length(BegStr)-Length(tmpNO);
            BegStr:=Copy(BegStr,1,Len);
            ReturnNo:=BegStr+tmpNo;
            except
              ReturnNo:=tmpNO;
            end;
            end
            else
            ReturnNo:='01';
        end;
        Result:=FString+ReturnNo;
   finally
       tmpAdoQry.Free;
   end;
end;

//删除记录
procedure DeleteRecordOver(const TableName, Values: string;
      AdoConn: TADOConnection; LinkTable, LinkField, FindField, whereT, Deleteother: string);
var tmpAdo: TAdoQuery;
begin
  tmpAdo := TAdoQuery.Create(nil);
  try
    tmpAdo.Connection := AdoConn;
    if Trim(Deleteother) <> '' then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Text := DeleteOther;
      tmpAdo.ExecSQL;
    end;
    if (LinkTable <> '') then
    begin
      tmpAdo.Close;                                                                               
      tmpAdo.SQL.Text := 'Select * from ' + LinkTable
        + ' where ' + LinkField + '=''' + Values + ''' ' + whereT;
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
        raise Exception.Create('该数据在使用，你不能删除。')
    end;
    if ((FindField<>'') and (Values<>'')) then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text := 'Delete from ' + TableName + ' where '
        + FindField + '=''' + Values + ''' ' + whereT;
      tmpAdo.ExecSQL;
    end else
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text := 'Delete from ' + TableName + ' where ' + whereT;
      tmpAdo.ExecSQL;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

Procedure DeleteRecord(Const TableName,Values:String;AdoConn:TADOConnection;LinkTable:String='';LinkField:String='';FindField:String='';whereT:String='';Deleteother:String='');
var tmpAdo:TAdoQuery;
begin
    if Application.MessageBox('删除后将不可再恢复，你确定吗？','操作提示',MB_YESNO+MB_ICONQUESTION)=IDNO then Exit;
    tmpAdo:=TAdoQuery.Create(Application);
    try
       tmpAdo.Connection :=AdoConn;
       if Trim(Deleteother)<>'' then
       begin
          tmpAdo.Close;
          tmpAdo.SQL.Text:=DeleteOther;
          tmpAdo.ExecSQL;
       end;
       if LinkTable<>'' then
       begin
          tmpAdo.Close;
          tmpAdo.SQL.Text:='Select * from '+LinkTable
              +' where '+LinkField+'='''+Values+''' '+whereT;
          tmpAdo.Open;
          if Not tmpAdo.IsEmpty then Raise Exception.Create('该数据在使用，你不能删除。')
       end;
       tmpAdo.Close ; 
       tmpAdo.SQL.Text :='Delete from '+TableName+' where '
           +FindField+'='''+Values+''' '+whereT;
       tmpAdo.ExecSQL ;
    finally
        tmpAdo.Free;
    end;
end;

Function  IFSingKey(Const IsInsert:Boolean;Const TableName,KeyField,KeyValues:String;AdoConn:TADOConnection):Boolean;
var tmpAdo:TAdoQuery;
Begin
    tmpAdo:=TAdoQuery.Create(Application);
    try
      tmpAdo.Connection :=AdoConn;
      tmpAdo.SQL.Text:='Select * from '+tableName
                      +'  where '+KeyField+'='''+KeyValues+'''';
      tmpAdo.Open;
      if IsInsert then
         if NOt tmpAdo.IsEmpty then
            Raise Exception.Create('输入字段值：['+KeyValues+']已存在，请重新输入！'); 
    finally
       tmpAdo.Free;
    end;
    Result:=False;
end;

Initialization
   Q_Ftp:=0;
   Q_Table:=0;
   Q_Status:=0;
   Q_Status2:=0;
   Q_Date10:=FormatDateTime('YYYY-MM-DD',Now);
   Q_Date10_2:=FormatDateTime('YYYY-MM-DD',Now);
   Q_Date8:=FormatDateTime('YYMM',Now);
   Q_RowCountAPage:=0;
   Q_HintOnRun:='0';
   sSql:='';
end.
