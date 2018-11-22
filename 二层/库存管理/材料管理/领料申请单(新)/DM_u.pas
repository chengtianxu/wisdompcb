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
    tmp2: TADOQuery;
    tmp3: TADOQuery;
    ADO137: TADOQuery;
    ADO268allow_submit: TWordField;
    ADO268allow_submit_c: TStringField;
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
    ADO268allow_submit_person_code: TStringField;
    ADO268allow_submit_person_name: TStringField;
    ADO268allow_submit_time: TDateTimeField;
    ADO17RKEY: TIntegerField;
    ADO17INV_PART_NUMBER: TStringField;
    ADO17INV_PART_DESCRIPTION: TStringField;
    ADO17Qty: TBCDField;
    ADO17UNIT_NAME: TStringField;
    ADO17ABBR_NAME: TStringField;
    ADO17LOCATION: TStringField;
    ADO17XY: TStringField;
    ADO468PRINTIT_S: TStringField;
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
    DS4: TDataSource;
    ADOVMIrkey: TIntegerField;
    ADOVMIDATE: TDateTimeField;
    ADO268control_ptr: TIntegerField;
    ADO155_1: TADOQuery;
    ADO155_1control_ptr: TIntegerField;
    ADO155_1invt_ptr: TIntegerField;
    ADO155_1INV_NAME: TStringField;
    ADO155_1UNIT_NAME: TStringField;
    ADO155_1INV_PART_NUMBER: TStringField;
    ADO155_1Rkey02: TAutoIncField;
    ADO154_1: TADOQuery;
    ADO154_1control_ptr: TIntegerField;
    ADO154_1dept_ptr: TIntegerField;
    ADO154_1DEPT_CODE: TStringField;
    ADO154_1DEPT_NAME: TStringField;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO136: TADOQuery;
    ADO136rkey: TAutoIncField;
    ADO136warehouse_ptr: TIntegerField;
    ADO136WAREHOUSE_CODE: TStringField;
    ADO136WAREHOUSE_NAME: TStringField;
    ADO136ABBR_NAME: TStringField;
    ADO136stan_consume: TBCDField;
    ADO136control_name: TStringField;
    ADO136unit_ptr: TIntegerField;
    DataSource1: TDataSource;
    ADOVMIDSDesigner13: TStringField;
    ADOVMIDSDesigner14: TStringField;
    adsKZXM: TADODataSet;
    qrytmp: TADOQuery;
    ADO136group_id: TWordField;
    ADO136Important_mtl: TWordField;
    ADO136Prod_Area_Type: TWordField;
    ADO136Depletion: TFloatField;
    ADO136Plating: TFloatField;
    ADO136Depth: TFloatField;
    ADO136Density: TFloatField;
    ADO136Formula: TStringField;
    ADO136Formula_Result: TFloatField;
    ADO136Mtl_Type: TWordField;
    ADOProc_PreM: TADOStoredProc;
    ADOProc_PreMcal_value: TFloatField;
    Important_Metal: TADOQuery;
    DataSource4: TDataSource;
    Important_MetalRkey: TAutoIncField;
    Important_MetalCorollary_Result: TFloatField;
    Important_MetalUNIT_NAME468: TIntegerField;
    Important_MetalQUAN_BOM468: TFloatField;
    Important_MetalCalc_Result: TFloatField;
    Important_MetalRecord_Time: TDateTimeField;
    Important_MetalDEPT_CODE: TStringField;
    Important_MetalDEPT_NAME: TStringField;
    Important_Metalnumber: TStringField;
    Important_Metalcontrol_name: TStringField;
    IM_Tmp: TADOQuery;
    IM_TmpRkey: TAutoIncField;
    IM_TmpCorollary_Result: TFloatField;
    IM_TmpUNIT_NAME468: TIntegerField;
    IM_TmpQUAN_BOM468: TFloatField;
    IM_TmpCalc_Result: TFloatField;
    IM_TmpRecord_Time: TDateTimeField;
    IM_TmpSMS: TStringField;
    IM_TmpPtr268: TIntegerField;
    IM_TmpDept_Ptr: TIntegerField;
    IM_TmpControl_Ptr: TIntegerField;
    tmp4: TADOQuery;
    ADO268cut_no: TStringField;
    strngfldADO468control_name: TStringField;
    strngfldADO468remark: TStringField;
    qry_temp: TADOQuery;
    qry_temp2: TADOQuery;
    intgrfldADO468control_ptr: TIntegerField;
    intgrfldADO17rkey23: TIntegerField;
    intgrfldADO468supplier_ptr: TIntegerField;
    sp1: TADOStoredProc;
    strngfldADO468ExReason: TStringField;
    strngfldADO468standards: TStringField;
    strngfldADO17DSDesigner: TStringField;
    atncfldADO268rkey94: TAutoIncField;
    ADO268ismsgsended: TIntegerField;
    qry_temp3: TADOQuery;
    qry_temp22: TADOQuery;
    qry_temp33: TADOQuery;
    ADO17DSDesigner: TStringField;
    wdstrngfldADO268ConfMan: TWideStringField;
    strngfldADO17DSDesigner2: TStringField;
    qry_WZCP492: TADOQuery;
    ds_WZCP492: TDataSource;
    qry_WZCP492Sel: TBooleanField;
    qry_WZCP492QUAN_ON_HAND: TBCDField;
    qry_WZCP492QUAN_ON_HAND_1: TBCDField;
    qry_WZCP492QUAN_ASSIGN: TBCDField;
    qry_WZCP492STD_QTY: TBCDField;
    qry_WZCP492App_QTY: TBCDField;
    qry_WZCP492Con_QTY: TBCDField;
    qry_WZCP492dQUAN_BOM: TBCDField;
    intgrfld_WZCP492D492_ptr: TIntegerField;
    intgrfld_WZCP492D017_ptr: TIntegerField;
    strngfld_WZCP492INV_PART_NUMBER: TStringField;
    strngfld_WZCP492INV_DESCRIPTION: TStringField;
    strngfld_WZCP492INV_NAME: TStringField;
    atncfld_WZCP492Rkey17: TAutoIncField;
    strngfld_WZCP492CUT_NO: TStringField;
    strngfld_WZCP492SO_NO: TStringField;
    intgrfld_WZCP492PLANNED_QTY: TIntegerField;
    intgrfld_WZCP492ISSUED_QTY: TIntegerField;
    intgrfld_WZCP492FG_QTY: TIntegerField;
    atncfld_WZCP492Rkey: TAutoIncField;
    wrdfld_WZCP492TSTATUS: TWordField;
    strngfld_WZCP492unit_name: TStringField;
    intgrfld_WZCP492dQUAN_BOM2: TIntegerField;
    intgrfldADO468wzcp0492_ptr: TIntegerField;
    procedure ADO268AfterScroll(DataSet: TDataSet);
    procedure ADO136AfterScroll(DataSet: TDataSet);
    procedure qry_WZCP492AfterScroll(DataSet: TDataSet);
  private

  public
  function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;


  procedure OpenQry(qry:TADOquery;ssql:string);
  procedure execsql(qry:TADOquery;ssql:string);
  function GetOne(FN,ssql:string;qry:TADOquery):Variant;  

  end;

var
  DM: TDM;
  dept_code,dept_name,rkey05:string;
  Frkey268,dept_rkey:integer;
implementation

{$R *.dfm}
procedure Tdm.OpenQry(qry:TADOquery;ssql:string);
begin
   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;
end;

procedure Tdm.execsql(qry:TADOquery;ssql:string);
begin

   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;
end;
function Tdm.GetOne(FN,ssql:string;qry:TADOquery):Variant;
begin

 result:='';

  with qry do
  begin
   close;
   sql.clear;
   sql.text:=ssql;
   Open;
  end;
  if not qry_temp.IsEmpty  then
  Result:=qry_temp.fieldbyname(fn).Value;
end;

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

procedure TDM.ADO136AfterScroll(DataSet: TDataSet);
begin
  ADO154_1.Close;
  ADO154_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO154_1.Open;
  ADO155_1.Close;
  ADO155_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO155_1.Open;
end;



procedure TDM.qry_WZCP492AfterScroll(DataSet: TDataSet);
begin
    dm.tmp.Close;
//    dm.tmp.SQL.clear;
//    dm.tmp.sqL.Text:='SELECT  data0023.rkey as rkey23,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place'
//                    +' FROM dbo.Data0022 INNER JOIN'
//                    +'  dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
//                    +'  dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'
//                    +'  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
//                    +'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'
//                    +'  where INVENTORY_PTR=:Rkey17'
//                    +'  group by  data0023.rkey,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place';
//    dm.tmp.Parameters[0].value:=dm.qry_WZCP492.FieldBYName('Rkey17').asinteger;
//    dm.tmp.Open;
//
//    if DM.tmp.FieldBYName('ABBR_NAME').asstring<>''  then
//    begin
//      dm.qry_WZCP492.Edit;
//      dm.qry_WZCP492.FieldByName('vendor2').AsString:=DM.tmp.FieldBYName('ABBR_NAME').asstring+' '+DM.tmp.FieldBYName('LOCATION').asstring+' '+DM.tmp.FieldBYName('spec_place').asstring;
//      dm.qry_WZCP492.FieldByName('rkey23').AsString:=DM.tmp.FieldBYName('rkey23').asstring;
//      dm.qry_WZCP492.Post;
//     end;
end;

end.
