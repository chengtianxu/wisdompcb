unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils,
  common;

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
    ADO268reference: TStringField;
    ADO268DEPT_CODE: TStringField;
    ADO268DEPT_NAME: TStringField;
    ADO268EMPL_CODE: TStringField;
    ADO268ABBR_NAME: TStringField;
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
    tmp1: TADOQuery;
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
    tmp2: TADOQuery;
    tmp3: TADOQuery;
    ADO137: TADOQuery;
    ADO192: TADOQuery;
    ADO192ppc_control3: TWordField;
    sms1: TADOQuery;
    ds14: TDataSource;
    ADO14: TADOQuery;
    ADO14rkey: TAutoIncField;
    ADO14MESSAGE: TStringField;
    ADO14senddate: TDateTimeField;
    ADO14whosend: TIntegerField;
    ADO14_1: TADOQuery;
    sms_ToWhom: TADOQuery;
    ds314: TDataSource;
    ADO314: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    ADO314_1: TADOQuery;
    ADO468overproof: TWordField;
    ADO468quan_alloc: TBCDField;
    ADO17INV_PART_NUMBER: TStringField;
    ADO17UNIT_NAME: TStringField;
    ADO268cut_no: TStringField;
    ADO17INVENT_PTR: TIntegerField;
    ADO17repl_invt_ptr: TIntegerField;
    ADO17quan_bom: TFloatField;
    ADO17STD_COST: TBCDField;
    ADO17invent_tp: TStringField;
    ADO17inv_name: TStringField;
    ADO17INV_DESCRIPTION: TStringField;
    ADO17valQty: TBCDField;
    ADO17inv_part_number_r: TStringField;
    ADO17inv_name_r: TStringField;
    ADO17INV_DESCRIPTION_r: TStringField;
    ADO17valQty_r: TBCDField;
    ADO17Sel: TBooleanField;
    ADO17Qty: TBCDField;
    ADO17remark: TStringField;
    ADO17TD: TBooleanField;
    ADO17part_name: TStringField;
    ADO17employee_name: TStringField;
    ADO468Tp: TStringField;
    ADO468bom_list_ptr: TIntegerField;
    ADO468INV_name: TStringField;
    ADO468INV_DESCRIPTION: TStringField;
    ADO17rkey: TIntegerField;
    ADO17PART_PTR: TIntegerField;
    ADO17VENDOR: TStringField;
    ADO17Invent_or: TSmallintField;
    ADO268bom_ptr: TIntegerField;
    ADO268prod_code: TStringField;
    ADO268product_name: TStringField;
    ADO268ISSUED_QTY: TIntegerField;
    ADO17TotalQty: TFloatField;
    ADO468rkey17: TAutoIncField;
    ADO268auth_emplptr: TIntegerField;
    ADO268auth_date: TDateTimeField;
    ADO268rkey05: TAutoIncField;
    ADO468QUAN_ON_HAND: TBCDField;
    qryGetsystem_date: TADOQuery;
    ADOVMI: TADOQuery;
    ADOVMIDSDesigner: TStringField;
    ADOVMIDSDesigner2: TStringField;
    ADOVMIDSDesigner3: TStringField;
    ADOVMIDSDesigner4: TStringField;
    ADOVMIDSDesigner5: TStringField;
    ADOVMIDSDesigner6: TStringField;
    ADOVMIDSDesigner7: TStringField;
    ADOVMIDSDesigner8: TStringField;
    ADOVMIDSDesigner9: TFloatField;
    ADOVMIDSDesigner10: TFloatField;
    ADOVMIDSDesigner11: TDateTimeField;
    ADOVMIDSDesigner12: TStringField;
    ADOVMIrkey: TIntegerField;
    ADOVMIDSDesigner13: TStringField;
    ADOVMIDSDesigner14: TStringField;
    DS4: TDataSource;
    ADOVMIDSDesigner15: TStringField;
    ADOVMIDSDesigner16: TStringField;
    ADOVMIDSDesigner17: TStringField;
    ADOVMIDSDesigner18: TStringField;
    ADOVMIDSDesigner19: TStringField;
    ADOVMIDSDesigner20: TStringField;
    ADOVMIDSDesigner21: TStringField;
    AdoWzcp492: TADOQuery;
    AdoWzcp492Sel: TBooleanField;
    AdoWzcp492STD_QTY: TBCDField;
    AdoWzcp492App_QTY: TBCDField;
    AdoWzcp492Con_QTY: TBCDField;
    AdoWzcp492QUAN_ASSIGN: TBCDField;
    AdoWzcp492D492_ptr: TIntegerField;
    AdoWzcp492D017_ptr: TIntegerField;
    AdoWzcp492INV_PART_NUMBER: TStringField;
    AdoWzcp492INV_NAME: TStringField;
    AdoWzcp492CUT_NO: TStringField;
    AdoWzcp492SO_NO: TStringField;
    AdoWzcp492PLANNED_QTY: TIntegerField;
    AdoWzcp492ISSUED_QTY: TIntegerField;
    AdoWzcp492FG_QTY: TIntegerField;
    AdoWzcp492TSTATUS: TWordField;
    AdoWzcp492QUAN_ON_HAND: TBCDField;
    AdoWzcp492INV_DESCRIPTION: TStringField;
    AdoWzcp492unit_name: TStringField;
    ADO268Rkey492: TAutoIncField;
    AdoWzcp492dQUAN_BOM: TBCDField;
    ADO268Prted_T: TStringField;
    AdoWzcp492vendor: TStringField;
    AdoWzcp492D148_PTR: TIntegerField;
    AdoWzcp492part_name: TStringField;
    ADO468part_name: TStringField;
    ADO268user_name: TStringField;
    ADO268if_control: TIntegerField;
    AdoWzcp492inv_part_number_r: TStringField;
    AdoWzcp492inv_name_r: TStringField;
    AdoWzcp492INV_DESCRIPTION_r: TStringField;
    AdoWzcp492QUAN_ON_HAND_r: TBCDField;
    AdoWzcp492Rkey17_0: TAutoIncField;
    AdoWzcp492Rkey17_r: TAutoIncField;
    AdoWzcp492vendor2: TStringField;
    ADO468wzcp0492_ptr: TIntegerField;
    ADO468wzcp495Rkey: TAutoIncField;
    AdoWzcp492wzcp0495_ptr: TIntegerField;
    AdoWzcp492Rkey: TAutoIncField;
    procedure ADO268BeforeOpen(DataSet: TDataSet);
    procedure DS1DataChange(Sender: TObject; Field: TField);
  private

  public
     function checkbomqry(rk08:Integer):Boolean;
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  Ftag:integer; //0 add,1 edit,2 look
  Frkey268:integer;
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
  if DM.Tmp.IsEmpty or (DM.Tmp.Fields[1].AsInteger=1) then   //完全手动
  begin
    result:=true;
    exit;
  end;

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
                           'where rkey='+ikey
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
        DM.Tmp.ExecSQL;
      end;

    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
      DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey
        else  //全是数字
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
      DM.Tmp.ExecSQL;
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

procedure TDM.ADO268BeforeOpen(DataSet: TDataSet);
begin
  ADO268.Parameters.ParamByName('uptr1').Value:=StrToInt(rkey73);
  ADO268.Parameters.ParamByName('uptr2').Value:=StrToInt(rkey73);
  ADO268.Parameters.ParamByName('uptr3').Value:=StrToInt(rkey73);
  ADO268.Parameters.ParamByName('uptr4').Value:=StrToInt(rkey73);
end;

function TDM.checkbomqry(rk08: Integer): Boolean;
begin
  Result:=False;  
  with TADOQuery.Create(nil) do
  begin
    Connection:=ADOCon;
    SQL.Clear;
    SQL.Add(Format('SELECT  COUNT(*) AS qry FROM WZCP0100 WHERE (CSI_PTR = %s ) AND (PROC_PTR = %d )',[rkey73,rk08]));
    try
      Open;
      First;
      Result:=Fields[0].AsInteger>0;
    except
      Result:=False;
    end;
    Close;
    Free;
  end;
end;

procedure TDM.DS1DataChange(Sender: TObject; Field: TField);
begin
  ADO468.Close;

  ADO468.Parameters[0].Value:=ADO268.FieldValues['rkey'];
  if  ADO268.FieldByName('if_control').AsInteger=1 then
  begin
    if not checkbomqry(ADO268.FieldByName('bom_ptr').AsInteger) then
    ADO468.Parameters[0].Value:=0;
  end;
  ADO468.Open;
end;

end.
