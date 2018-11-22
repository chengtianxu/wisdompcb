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
    ADO268: TADOQuery;
    ADO468: TADOQuery;
    ADO268_1: TADOQuery;
    ADO468_1: TADOQuery;
    ADO17: TADOQuery;
    ADO268rkey: TAutoIncField;
    ADO268number: TStringField;
    ADO268dept_ptr: TIntegerField;
    ADO268DATE: TDateTimeField;
    ADO268EMPL_PTR: TIntegerField;
    ADO268status: TWordField;
    ADO268auth_emplptr: TIntegerField;
    ADO268auth_date: TDateTimeField;
    ADO268reference: TStringField;
    ADO268DEPT_CODE: TStringField;
    ADO268DEPT_NAME: TStringField;
    ADO268EMPL_CODE: TStringField;
    ADO268ABBR_NAME: TStringField;
    ADO268Auditcode: TStringField;
    ADO268Auditname: TStringField;
    ADO268status_c: TStringField;
    ADO468RKEY: TAutoIncField;
    ADO468FLOW_NO: TIntegerField;
    ADO468STEP: TSmallintField;
    ADO468DEPT_PTR: TIntegerField;
    ADO468INVENT_PTR: TIntegerField;
    ADO468QUAN_BOM: TFloatField;
    ADO468VENDOR: TStringField;
    ADO468Invent_or: TSmallintField;
    ADO468INV_PART_NUMBER: TStringField;
    ADO468INV_PART_DESCRIPTION: TStringField;
    ADO268auth_ptr: TIntegerField;
    tmp1: TADOQuery;
    ADO268code: TStringField;
    ADO268PURCHASE_APPROV_DESC: TStringField;
    ADO468unit_name: TStringField;
    ADO368: TADOQuery;
    DS3: TDataSource;
    ADO368USER_FULL_NAME: TStringField;
    ADO368USER_ID: TStringField;
    ADO368user_ptr: TIntegerField;
    ADO368auth_date: TDateTimeField;
    ADO368ranking: TWordField;
    ADO368auth_flag: TStringField;
    ADO468QUAN_ISSUED: TFloatField;
    ADO468CUT_NO: TStringField;
    ADO468SO_NO: TStringField;
    ADO468STATUS: TSmallintField;
    ADO468PRINTIT: TStringField;
    ADO268fac_name: TStringField;
    ADO268warehouse_ptr: TIntegerField;
    ADO268Prted: TBooleanField;
    ADO17RKEY: TAutoIncField;
    ADO17INV_PART_NUMBER: TStringField;
    ADO17INV_PART_DESCRIPTION: TStringField;
    ADO17UNIT_NAME: TStringField;
    ADO17ABBR_NAME: TStringField;
    ADO492: TADOQuery;
    DS4: TDataSource;
    ADO268CUT_NO: TStringField;
    ADO268TTYPE: TWordField;
    ADO468quan_alloc: TBCDField;
    ADO17Qty: TBCDField;
    ADO468QUAN_ON_HAND: TBCDField;
    ADO17LOCATION: TStringField;
    ADO492DSDesigner: TStringField;
    ADO492DSDesigner2: TStringField;
    ADO492DSDesigner3: TStringField;
    ADO492DSDesigner4: TStringField;
    ADO492DSDesigner5: TStringField;
    ADO492DSDesigner6: TStringField;
    ADO492DSDesigner7: TStringField;
    ADO492DSDesigner8: TFloatField;
    ADO492DSDesigner9: TIntegerField;
    ADO492DSDesigner10: TDateTimeField;
    ADO492CUT_NO: TStringField;
    ADO492MANU_PART_NUMBER: TStringField;
    ADO492MANU_PART_DESC: TStringField;
    ADO492SALES_ORDER: TStringField;
    ADO492PO_NUMBER: TStringField;
    ADO492CUST_CODE: TStringField;
    ADO492ABBR_NAME: TStringField;
    ADO492PARTS_ORDERED: TFloatField;
    ADO492ISSUED_QTY: TIntegerField;
    ADO492ENT_DATE: TDateTimeField;
    ADO492DSDesigner11: TIntegerField;
    procedure ADO268AfterScroll(DataSet: TDataSet);
  private

  public
    
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  dept_code,dept_name,rkey05:string;
  Frkey268,dept_rkey:integer;
implementation

{$R *.dfm}

procedure TDM.ADO268AfterScroll(DataSet: TDataSet);
begin
  ADO468.Close;
  ADO468.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO468.Open;
end;

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
  if DM.Tmp.IsEmpty then exit;

  s:=trim(DM.Tmp.Fields[0].AsString);
  table_name:=trim(DM.Tmp.Fields[2].AsString);
  if DM.Tmp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:= iL downto 1 do
    begin
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i,iL-i)+';1;_';
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
        DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                         '''  where rkey='+ikey;
        DM.Tmp.ExecSQL;
      end;
    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
        iL:=length(s);
        for i:=iL downto 1 do
          if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
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
            DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                             '''  where rkey='+ikey;
            DM.Tmp.ExecSQL;
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
                DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
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
  end else  if DM.Tmp.Fields[1].AsInteger=1 then begin
          edt.ReadOnly:=false;
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='select  number from data0268 where number = '''+edt.Text+'''';
          DM.Tmp.Open;
          if not DM.Tmp.IsEmpty then
          begin
                showmessage('单号重复,请重新输入...');
                exit;
          end;
  end;
  result:=true;
end;

end.
