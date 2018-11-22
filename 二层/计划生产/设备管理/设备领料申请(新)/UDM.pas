unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB,mask,Dialogs;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qrytemp: TADOQuery;
    qrytemp2: TADOQuery;
    qry17: TADOQuery;
    intgrfldqry17RKEY: TIntegerField;
    strngfldqry17INV_PART_NUMBER: TStringField;
    strngfldqry17INV_PART_DESCRIPTION: TStringField;
    strngfldqry17GROUP_DESC: TStringField;
    qry17Qty: TBCDField;
    strngfldqry17UNIT_NAME: TStringField;
    strngfldqry17ABBR_NAME: TStringField;
    strngfldqry17LOCATION: TStringField;
    strngfldqry17XY: TStringField;
    strngfldqry17DSDesigner: TStringField;
    intgrfldqry17rkey23: TIntegerField;
    intgrfldqry17rkey02: TIntegerField;
    strngfldqry17INV_NAME: TStringField;
    strngfldqry17INV_DESCRIPTION: TStringField;
    qry468: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSql468:string;
    function OpenQry(qry:TADOquery;ssql:string):string;
    function execsql(qry:TADOquery;ssql:string):string;
    function GetNo(edt: TMaskEdit; ikey: string;tp:integer=0):boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
  function Tdm.OpenQry(qry:TADOquery;ssql:string):string;
begin

   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;

end;

function Tdm.execsql(qry:TADOquery;ssql:string):string;
begin

   with qry do
   begin
   //close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;
end;

function TDM.GetNo(edt: TMaskEdit; ikey: string;tp:integer=0):boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
    Lsql:string;
begin
  result:=false;
  Lsql:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  OpenQry(dm.qrytemp,LSql);
  if dm.qrytemp.IsEmpty or (dm.qrytemp.Fields[1].AsInteger=1) then   //完全手动
  begin
    result:=true;
    exit;
  end;

  s:=trim(dm.qrytemp.Fields[0].AsString);
  table_name:=trim(dm.qrytemp.Fields[2].AsString);
  if dm.qrytemp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      Lsql:='select top 1 number from '+table_name+' where number='''+edt.Text+'''';
       OpenQry(dm.qrytemp,LSql);
      if not dm.qrytemp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      Lsql:='select top 1 number from '+table_name+' order by number desc';
      OpenQry(dm.qrytemp,LSql);
      if dm.qrytemp.IsEmpty or (dm.qrytemp.Fields[0].AsString<=edt.Text) then
      begin
        if sL<>'' then
          Lsql:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey
        else
          Lsql:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
        DM.execsql(DM.qrytemp,Lsql);
      end;

    end;
  end else if dm.qrytemp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.qrytemp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
        if sL<>'' then
         LSql:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey
        else  //全是数字
          Lsql:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
       DM.execsql(DM.qrytemp,Lsql);
    end;
  end else if dm.qrytemp.Fields[1].AsInteger=4 then begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=DM.qrytemp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
      B:=true;
      while B do
      begin
        DM.qrytemp.close;
        if sL<>'' then
          DM.qrytemp.sql.text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.qrytemp.sql.text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        if DM.qrytemp.ExecSQL=0 then
        begin
          Lsql:='select SEED_VALUE  from data0004  where rkey ='+ikey;
          OpenQry(dm.qrytemp,LSql);
          edt.Text:=DM.qrytemp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
Fsql468:=qry468.SQL.text;
end;

end.
