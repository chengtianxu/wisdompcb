unit SrvFunc;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VCLCom, StdVcl,DB,Provider,variants,winsock,Midas,ComConst,
  StdCtrls,ComObj,ConstDeclare,AdoDB;

var  strConn,CompName:string;

  function OpenFile(FileName:string;var ErrorMsg:string):string;//打开文件
  function Get_MstrDtl_Sql(ModId:integer;pBillNo:string):PMstrDtl;//返回主从表的sql
  function Get_MstrDtl_Delete_Sql(ModId:integer;BillNo:string):string;
  function OpenQuery(Query:TAdoQuery;Sqlstr:string):boolean; overload;//传入sql打开数据
  function ExecSql(acmd: TAdoCommand;Sqlstr:string):boolean;overload; //执行一段sql命令
  function Get_One_Table_Sql(ModId:integer;pBillNo:string):string;//获取一个数据表的Sql
  function ComputerName:String;
//  function ExecSql(Sqlstr:string):boolean;overload; //执行一段sql命令

implementation

function OpenFile(FileName:string;var ErrorMsg:string):string;//打开文件
var
F: TextFile;
S: string;
begin
  try
    AssignFile(F, FileName); { File selected in dialog }
    Reset(F);
    Readln(F, S); { Read first line of file }
    result := S; { Put string in a TEdit control }
    CloseFile(F);
  except
    on E:Exception do
      ErrorMsg:=E.Message;
  end;
end;

function Get_MstrDtl_Delete_Sql(ModId:integer;BillNo:string):string;
begin
  case ModId of
    MOD_QRY : result:='delete from qry_Master where QryNo='+BillNo+' delete from qry_Fields where QryNo='+BillNo;
  end;
end;

function Get_MstrDtl_Sql(ModId:integer;pBillNo:string):PMstrDtl;//返回主从表的sql
begin
  case modId of
    MOD_QRY :
                   begin
                     SetLength(result.sqlstr,2);
                     result.Sqlstr[0] := 'select * from qry_Master where QryNo='+pBillNo;
                     result.Sqlstr[1] := 'select * from qry_Fields where QryNo='+pBillNo;
                   end;
  end;
end;

function OpenQuery(Query:TAdoQuery;Sqlstr:string):boolean; overload;//传入sql打开数据
begin
  result := true;
  try
    Query.close;
    Query.SQL.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
  except
    result := false;
//    Application.MessageBox('数据表打开失败，请检查','提示',mb_ok);
  end;
end;

function ExecSql(acmd: TAdoCommand;Sqlstr: string): boolean;
begin
  try
    acmd.CommandText := sqlstr;
    acmd.Execute;
    result := true;
  except
    result := false;
  end;
end;

function Get_One_Table_Sql(ModId:integer;pBillNo:string):string;//获取一个数据表的Sql
begin
  case ModId of
    qry_Matrl_receiving_List,
    qry_Matrl_receiving_Sum,
    qry_Matrl_Issue_List,
    qry_Matrl_Issue_Sum,qry_Matrl_Stock_List,qry_Matrl_Stock_Sum,qry_Matrl_ReMove :
        begin
          if pBillNo = '' then
            result:='select * from qry_Column_List '
          else
            result:='select * from qry_Column_List where qryNo='+pBillNo;
        end;
    rpt_Item_Set:
        result := 'select * from rpt_main ';
  end;
end;

function ComputerName:String;
var
  CNameBuffer : PChar;
  fl_loaded : Boolean;
  CLen : ^DWord;
begin
  GetMem(CNameBuffer,255);
  New(CLen);
  CLen^:=   255;
  fl_loaded   :=   GetComputerName(CNameBuffer,CLen^);
  if fl_loaded then
    Result := StrPas(CNameBuffer)
  else
    Result := 'Unkown';
  FreeMem(CNameBuffer,255);
  Dispose(CLen);
end;
end.
