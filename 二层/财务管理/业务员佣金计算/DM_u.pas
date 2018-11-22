unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;              
    DS2: TDataSource;
    ADO122: TADOQuery;
    ADO123_1: TADOQuery;
    ADO122_1: TADOQuery;
    DS4: TDataSource;
    ADO124: TADOQuery;
    ADO122rkey: TIntegerField;
    ADO122comm_code: TStringField;
    ADO122customer_ptr: TIntegerField;
    ADO122SALES_REP_PTR: TIntegerField;
    ADO122create_empl_ptr: TIntegerField;
    ADO122create_date: TDateTimeField;
    ADO122auth_empl_ptr: TIntegerField;
    ADO122auth_date: TDateTimeField;
    ADO122coll_startdate: TDateTimeField;
    ADO122coll_enddate: TDateTimeField;
    ADO122commission: TBCDField;
    ADO122CUST_CODE: TStringField;
    ADO122CUSTOMER_NAME: TStringField;
    ADO122REP_CODE: TStringField;
    ADO122SALES_REP_NAME: TStringField;
    ADO122EMPL_CODE: TStringField;
    ADO122EMPLOYEE_NAME: TStringField;
    ADO122EMPL_CODE_a: TStringField;
    ADO122EMPLOYEE_NAME_a: TStringField;
    ADO123: TADOQuery;
    ADO124rkey: TIntegerField;
    ADO124CATEGORY: TStringField;
    ADO124SHARE_scale: TBCDField;
    ADO124comm_ptr: TIntegerField;
    ADO124CATEGORY_ptr: TIntegerField;
    ADO124SHARE_base: TBCDField;
    ADO124SHARE_scale_1: TBCDField;
    ADO124SHARE_amount: TBCDField;
    ADO124shareScale: TBCDField;
    ADO122remark: TStringField;
    ADO122EMPLOYEE_PTR: TIntegerField;
    ADO126: TADOQuery;
    procedure ADO124SHARE_baseValidate(Sender: TField);
    procedure ADO124BeforeDelete(DataSet: TDataSet);
    procedure ADO124AfterOpen(DataSet: TDataSet);
    procedure ADO124BeforeEdit(DataSet: TDataSet);
    procedure ADO122_1AfterOpen(DataSet: TDataSet);
  private
    FcanEdit:boolean;

  public
     FsumKK:real;
     FEdtKKEvt:procedure of object;
     FrecNm:set of 0..30;
     FEdt:boolean;
     DtChanged:boolean;
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
     procedure coll_startdateChange(Sender: TField);
  end;

var
  DM: TDM;
  Frkey122:integer;

implementation

{$R *.dfm}

function TDM.GetNo(edt: TMaskEdit; ikey: string;tp:integer=0):boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin
  result:=false;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  DM.Tmp.Open;
  if DM.Tmp.IsEmpty or (DM.Tmp.Fields[1].AsInteger=1) then exit;

  s:=trim(DM.Tmp.Fields[0].AsString);
  table_name:=trim(DM.Tmp.Fields[2].AsString);
  if DM.Tmp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' where number='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' order by number desc';
      DM.Tmp.Open;
      if DM.Tmp.IsEmpty or (DM.Tmp.Fields[0].AsString<=edt.Text) then
      begin
        DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        DM.Tmp.ExecSQL;
      end;

    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else  //全是数字
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
      if DM.Tmp.ExecSQL=0  then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end;
    end;
  end else if DM.Tmp.Fields[1].AsInteger=4 then begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
      B:=true;
      while B do
      begin
        DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        if DM.Tmp.ExecSQL=0 then
        begin
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey ='+ikey;
          DM.Tmp.Open;
          edt.Text:=DM.Tmp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
end;


procedure TDM.ADO124SHARE_baseValidate(Sender: TField);
begin
  FsumKK:=FsumKK-ADO124SHARE_amount.AsFloat;
  ADO124SHARE_amount.Value:=Sender.AsFloat*ADO124shareScale.AsFloat/100;
  FsumKK:=FsumKK+ADO124SHARE_amount.AsFloat;
  if Assigned(FEdtKKEvt) then FEdtKKEvt;
end;

procedure TDM.ADO124BeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TDM.ADO124AfterOpen(DataSet: TDataSet);
begin
  FsumKK:=0;
  while not DataSet.Eof do
  begin
    FsumKK:=FsumKK+ADO124SHARE_amount.AsFloat;
    DataSet.Next;
  end;
  DataSet.First;
end;


procedure TDM.ADO124BeforeEdit(DataSet: TDataSet);
begin
 // if not FEdt and (DM.ADO124.RecNo in DM.FrecNm) then abort; //工具费用不能更改
   if (ADO124CATEGORY.Value='异常板成本') and not FcanEdit then abort;
end;

procedure TDM.coll_startdateChange(Sender: TField);
begin
  DtChanged:=true;

  ADO126.Close;
  if ADO124.Active and ADO124.Locate('CATEGORY','异常板成本',[]) then
  begin
    FcanEdit:=true;
    ADO124.Edit;
    ADO124SHARE_base.Value:=0;
    ADO124.Post;
    FcanEdit:=false;
  end;
end;

procedure TDM.ADO122_1AfterOpen(DataSet: TDataSet);
begin
  ADO122_1.FieldByName('coll_startdate').OnChange:=coll_startdateChange;
  ADO122_1.FieldByName('coll_enddate').OnChange:=coll_startdateChange;
end;

end.
