unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,mask,Dialogs,Variants,StrUtils, Provider,
  DBClient, Forms, Controls;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    D08: TADOQuery;
    DS1: TDataSource;
    wzcp01: TADOQuery;
    DS2: TDataSource;
    Tmp: TADOQuery;
    D08_1: TADOQuery;
    DS3: TDataSource;
    D08RKEY: TIntegerField;
    D08PROD_CODE: TStringField;
    D08PRODUCT_NAME: TStringField;
    D08PRODUCT_DESC: TStringField;
    D08PR_GRP_POINTER: TIntegerField;
    D08DEPT_PTR: TIntegerField;
    D08new_price: TBCDField;
    D08qty_onhand: TBCDField;
    D08min_qty: TBCDField;
    D08max_qty: TBCDField;
    D08TTYPE: TWordField;
    D08PR_GRP_CODE: TStringField;
    D08PRODUCT_GROUP_NAME: TStringField;
    D08UNIT_CODE: TStringField;
    D08UNIT_NAME: TStringField;
    D08DEPT_CODE: TStringField;
    D08DEPT_NAME: TStringField;
    D08_1RKEY: TAutoIncField;
    D08_1PROD_CODE: TStringField;
    D08_1PRODUCT_NAME: TStringField;
    D08_1PRODUCT_DESC: TStringField;
    D08_1PR_GRP_POINTER: TIntegerField;
    D08_1unit_ptr: TIntegerField;
    D08_1DEPT_PTR: TIntegerField;
    D08_1new_price: TBCDField;
    D08_1qty_onhand: TBCDField;
    D08_1min_qty: TBCDField;
    D08_1max_qty: TBCDField;
    D08_1TTYPE: TWordField;
    wzcp01rkey: TAutoIncField;
    wzcp01proc_ptr: TIntegerField;
    wzcp01location_ptr: TIntegerField;
    wzcp01qty_on_hand: TBCDField;
    wzcp01LOCATION: TStringField;
    wzcp01CODE: TStringField;
    wzcp01rkey16: TAutoIncField;
    D08ttype_c: TStringField;
    ADO140: TADOQuery;
    ADO148: TADOQuery;
    DS140: TDataSource;
    DS148: TDataSource;
    Tmp1: TADOQuery;
    D08remark: TMemoField;
    D08_1remark: TMemoField;
    D08total_cost: TBCDField;
    D08rkey140: TIntegerField;
    tmp2: TADOQuery;
    D08rkey0053: TIntegerField;
    ADO492: TADOQuery;
    DS492: TDataSource;
    ADO492CUT_NO: TStringField;
    ADO492PLANNED_QTY: TIntegerField;
    ADO492ISSUED_QTY: TIntegerField;
    ADO492SCH_COMPL_DATE: TDateTimeField;
    ADO492ISSUE_DATE: TDateTimeField;
    ADO492rkey: TAutoIncField;
    ADO492TSTATUS: TWordField;
    ADO492remark: TStringField;
    ADO492FG_QTY: TIntegerField;
    ADO492WIP_QTY: TIntegerField;
    ADO492QTY_REJECT: TIntegerField;
    ADO492ORD_REQ_QTY: TIntegerField;
    ADO492EMPLOYEE_NAME: TStringField;
    ADO492PROD_CODE: TStringField;
    ADO492PRODUCT_NAME: TStringField;
    ADO492PRODUCT_DESC: TStringField;
    ADO492DEPT_CODE: TStringField;
    ADO492DEPT_NAME: TStringField;
    ADO492cutno: TStringField;
    ADO492v_ttype: TStringField;
    ADO492v_status: TStringField;
    ADO492WHOUSE_PTR: TIntegerField;
    ADO492PRINTED_BY_PTR: TSmallintField;
    ADO492mrb_ptr: TIntegerField;
    ADO492BOM_PTR: TIntegerField;
    ADO492WAREHOUSE_CODE: TStringField;
    ADO492SO_NO: TStringField;
    ADO492CUST_CODE: TStringField;
    ADO492ABBR_NAME: TStringField;
    DS468_Delete: TDataSource;
    ADS468Delete: TADODataSet;
    ADS468DeleteINV_PART_NUMBER: TStringField;
    ADS468DeleteINV_NAME: TStringField;
    ADS468DeleteINV_DESCRIPTION: TStringField;
    ADS468DeleteQUAN_ON_HAND: TBCDField;
    ADS468DeleteRKEY: TIntegerField;
    ADS468DeleteCUT_NO: TStringField;
    ADS468DeleteQUAN_BOM: TFloatField;
    ADS468DeleteQUAN_ISSUED: TFloatField;
    ADS468DeleteUNIT_NAME: TStringField;
    ADS468DeleteSTATUS: TSmallintField;
    ADS468DeleteDSDesigner: TStringField;
    ADS468DeleteDSDesigner2: TStringField;
    ADS468DeleteVENDOR: TStringField;
    ADS468Deletenumber: TStringField;
    ADS468Deleteemployee_name: TStringField;
    dsCP140: TDataSource;
    dsCP148: TDataSource;
    aqCP148: TADOQuery;
    aqCP140: TADOQuery;
    aqCP140rkey: TAutoIncField;
    aqCP140part_ptr: TIntegerField;
    aqCP140part_name: TStringField;
    aqCP140amount: TBCDField;
    aqCP140user_ptr: TIntegerField;
    aqCP140auth_date: TDateTimeField;
    aqCP140status: TWordField;
    aqCP140status_c: TStringField;
    aqCP140EMPL_CODE: TStringField;
    aqCP140EMPLOYEE_NAME: TStringField;
    D08WORKHOUSE: TBCDField;
    D08_1WORKHOUSE: TBCDField;
    ADOQuery2: TADOQuery;
    ADO140rkey: TAutoIncField;
    ADO140part_name: TStringField;
    ADO140part_ptr: TIntegerField;
    ADO140user_ptr: TIntegerField;
    ADO140auth_date: TDateTimeField;
    ADO140status: TWordField;
    ADO140status_c: TStringField;
    ADO140EMPL_CODE: TStringField;
    ADO140EMPLOYEE_NAME: TStringField;
    ADO148rkey: TIntegerField;
    ADO148PART_PTR: TIntegerField;
    ADO148INVENT_PTR: TIntegerField;
    ADO148repl_invt_ptr: TIntegerField;
    ADO148QUAN_BOM: TFloatField;
    ADO148VENDOR: TStringField;
    ADO148Invent_or: TSmallintField;
    ADO148STD_COST: TBCDField;
    ADO148invent_tp: TStringField;
    ADO148inv_part_number: TStringField;
    ADO148inv_name: TStringField;
    ADO148INV_DESCRIPTION: TStringField;
    ADO148TotalCost: TFloatField;
    ADO148inv_part_number_r: TStringField;
    ADO148inv_name_r: TStringField;
    ADO148INV_DESCRIPTION_r: TStringField;
    ADO148unit_name: TStringField;
    ADO148QUAN_ON_HAND: TBCDField;
    ADO148CRITICAL_MATL_FLAG: TIntegerField;
    ADO148QUAN_ISSUED: TFloatField;
    aqCP148rkey_cp140: TIntegerField;
    aqCP148INVENT_PTR: TIntegerField;
    aqCP148QUAN_BOM: TBCDField;
    aqCP148STD_COST: TBCDField;
    aqCP148VENDOR: TStringField;
    aqCP148invent_or: TIntegerField;
    aqCP148INV_PART_NUMBER: TStringField;
    aqCP148INV_NAME: TStringField;
    aqCP148INV_DESCRIPTION: TStringField;
    aqCP148QUAN_ON_HAND: TBCDField;
    aqCP148DSDesigner: TStringField;
    aqCP148UNIT_NAME: TStringField;
    CDS148: TClientDataSet;
    DSP148: TDataSetProvider;
    CDS148rkey_cp140: TIntegerField;
    CDS148INVENT_PTR: TIntegerField;
    CDS148QUAN_BOM: TBCDField;
    CDS148STD_COST: TBCDField;
    CDS148VENDOR: TStringField;
    CDS148invent_or: TIntegerField;
    CDS148INV_PART_NUMBER: TStringField;
    CDS148INV_NAME: TStringField;
    CDS148INV_DESCRIPTION: TStringField;
    CDS148QUAN_ON_HAND: TBCDField;
    CDS148CDSDesigner: TStringField;
    CDS148UNIT_NAME: TStringField;
    ADO140user2_ptr: TIntegerField;
    ADO140auth2_date: TDateTimeField;
    ADO140EMPL_CODE_1: TStringField;
    ADO140EMPLOYEE_NAME_1: TStringField;
    ADO148s: TADOQuery;
    ds148s: TDataSource;
    ADO148srkey: TAutoIncField;
    ADO148sPART_PTR: TIntegerField;
    ADO148sINVENT_PTR: TIntegerField;
    ADO148srepl_invt_ptr: TIntegerField;
    ADO148sQUAN_BOM: TFloatField;
    ADO148sVENDOR: TStringField;
    ADO148sInvent_or: TSmallintField;
    ADO148sSTD_COST: TBCDField;
    ADO148sinvent_tp: TStringField;
    ADO148sinv_part_number: TStringField;
    ADO148sinv_name: TStringField;
    ADO148sINV_DESCRIPTION: TStringField;
    ADO148sTotalCost: TFloatField;
    ADO148sinv_part_number_r: TStringField;
    ADO148sinv_name_r: TStringField;
    ADO148sINV_DESCRIPTION_r: TStringField;
    ADO148sunit_name: TStringField;
    ADO148sQUAN_ON_HAND: TBCDField;
    ADO148sCRITICAL_MATL_FLAG: TWordField;
    ADO148sQUAN_ISSUED: TBCDField;

    D08_1create_user_ptr: TIntegerField;
    D08_1create_date: TDateTimeField;
    D08create_date: TDateTimeField;
    D08employee_name: TStringField;
    ADO148seq_no: TIntegerField;
    ADO148p_code: TIntegerField;
    cdsdata17_all: TClientDataSet;
    cdsdata17_allRKEY: TIntegerField;
    cdsdata17_allINV_PART_NUMBER: TStringField;
    cdsdata17_allINV_NAME: TStringField;
    cdsdata17_allINV_DESCRIPTION: TStringField;
    cdsdata17_allQUAN_ON_HAND: TBCDField;
    cdsdata17_allstd_cost: TBCDField;
    cdsdata17_allunit_name: TStringField;
    cdsdata17_allFisMAt: TIntegerField;
    cdsdata17_08: TClientDataSet;
    cdsdata17_08RKEY: TIntegerField;
    cdsdata17_08INV_PART_NUMBER: TStringField;
    cdsdata17_08INV_NAME: TStringField;
    cdsdata17_08INV_DESCRIPTION: TStringField;
    cdsdata17_08QUAN_ON_HAND: TBCDField;
    cdsdata17_08std_cost: TBCDField;
    cdsdata17_08unit_name: TStringField;
    cdsdata17_08FisMAt: TIntegerField;
    cdsdata17_17: TClientDataSet;
    cdsdata17_17RKEY: TIntegerField;
    cdsdata17_17INV_PART_NUMBER: TStringField;
    cdsdata17_17INV_NAME: TStringField;
    cdsdata17_17INV_DESCRIPTION: TStringField;
    cdsdata17_17QUAN_ON_HAND: TBCDField;
    cdsdata17_17std_cost: TBCDField;
    cdsdata17_17unit_name: TStringField;
    cdsdata17_17FisMAt: TIntegerField;
    ADO148sseq_no: TIntegerField;
    ADO148sP_CODE: TIntegerField;
    qrydata17_all: TADOQuery;
    qrydata17_08: TADOQuery;
    qrydata17_17: TADOQuery;
    qrydata17_allRKEY: TIntegerField;
    qrydata17_allINV_PART_NUMBER: TStringField;
    qrydata17_allINV_NAME: TStringField;
    qrydata17_allINV_DESCRIPTION: TStringField;
    qrydata17_allQUAN_ON_HAND: TBCDField;
    qrydata17_allstd_cost: TBCDField;
    qrydata17_allunit_name: TStringField;
    qrydata17_allFisMAt: TIntegerField;
    qrydata17_08RKEY: TIntegerField;
    qrydata17_08INV_PART_NUMBER: TStringField;
    qrydata17_08INV_NAME: TStringField;
    qrydata17_08INV_DESCRIPTION: TStringField;
    qrydata17_08QUAN_ON_HAND: TBCDField;
    qrydata17_08std_cost: TBCDField;
    qrydata17_08unit_name: TStringField;
    qrydata17_08FisMAt: TIntegerField;
    qrydata17_17RKEY: TIntegerField;
    qrydata17_17INV_PART_NUMBER: TStringField;
    qrydata17_17INV_NAME: TStringField;
    qrydata17_17INV_DESCRIPTION: TStringField;
    qrydata17_17QUAN_ON_HAND: TBCDField;
    qrydata17_17std_cost: TBCDField;
    qrydata17_17unit_name: TStringField;
    qrydata17_17FisMAt: TIntegerField;
    dsqrydata17_all: TDataSource;
    dsqrydata17_08: TDataSource;
    dsqrydata17_17: TDataSource;
    D08specific_location: TWideStringField;
    D08_1specific_location: TWideStringField;
    ADO148sproduction_teamname: TWideStringField;
    ADO148production_teamname: TWideStringField;
    cmd1: TADOCommand;
    wzcp0492: TADODataSet;
    wzcp0492INV_PART_NUMBER: TStringField;
    wzcp0492INV_NAME: TStringField;
    wzcp0492INV_DESCRIPTION: TStringField;
    wzcp0492QUAN_ON_HAND: TBCDField;
    wzcp0492D17_QUAN_ASSIGN: TBCDField;
    wzcp0492UNIT_CODE: TStringField;
    wzcp0492Rkey: TAutoIncField;
    wzcp0492D492_ptr: TIntegerField;
    wzcp0492D017_ptr: TIntegerField;
    wzcp0492STD_QTY: TBCDField;
    wzcp0492App_QTY: TBCDField;
    wzcp0492Con_QTY: TBCDField;
    wzcp0492QUAN_ASSIGN: TBCDField;
    wzcp0492part_name: TStringField;
    wzcp0492P_CODE: TIntegerField;
    wzcp0492production_teamname: TWideStringField;
    wzcp0492D148_PTR: TIntegerField;
    dsWzcp0492: TDataSource;
    cds_wzcp0492: TClientDataSet;
    cds_wzcp0492part_name: TStringField;
    cds_wzcp0492INV_PART_NUMBER: TStringField;
    cds_wzcp0492INV_NAME: TStringField;
    cds_wzcp0492INV_DESCRIPTION: TStringField;
    cds_wzcp0492QUAN_ON_HAND: TBCDField;
    cds_wzcp0492QUAN_ASSIGN: TBCDField;
    cds_wzcp0492UNIT_CODE: TStringField;
    cds_wzcp0492Rkey: TAutoIncField;
    cds_wzcp0492D492_ptr: TIntegerField;
    cds_wzcp0492D017_ptr: TIntegerField;
    cds_wzcp0492STD_QTY: TBCDField;
    cds_wzcp0492App_QTY: TBCDField;
    cds_wzcp0492Con_QTY: TBCDField;
    cds_wzcp0492D17_QUAN_ASSIGN: TBCDField;
    cds_wzcp0492P_CODE: TIntegerField;
    cds_wzcp0492production_teamname: TWideStringField;
    cds_wzcp0492D148_PTR: TIntegerField;
    dsp_wzcp0492: TDataSetProvider;
    D08_1total_cost: TBCDField;
    D08_1if_control: TBooleanField;
    D08create_user_ptr: TIntegerField;
    D08if_control: TBooleanField;
    D08create_date_1: TDateTimeField;
    D08if_contro: TStringField;
    ADO148STOP_PURCH: TStringField;
    ADO148STOP_PURCH1: TStringField;
    ADO148sSTOP_PURCH: TStringField;
    ADO148sSTOP_PURCH1: TStringField;
    ADO140user3_ptr: TIntegerField;
    ADO140auth3_date: TDateTimeField;
    ADO140EMPL_CODE_2: TStringField;
    ADO140EMPLOYEE_NAME_2: TStringField;
    ADO148_detail: TADOQuery;
    DS148_detail: TDataSource;
    ADO148_detailinv_part_number: TStringField;
    ADO148_detailinv_name: TStringField;
    ADO148_detailINV_DESCRIPTION: TStringField;
    ADO148_detailQUAN_ISSUED: TBCDField;
    ADO148_detailQUAN_BOM: TFloatField;
    ADO148_detailQUAN_ON_HAND: TBCDField;
    ADO148_detailinvent_tp: TStringField;
    ADO148_detailproduction_teamname: TWideStringField;
    ADO148_detailunit_name: TStringField;
    ADO148_detailSTD_COST: TBCDField;
    ADO148_detailTotalCost: TFloatField;
    ADO148_detailVENDOR: TStringField;
    ADO148_detailSTOP_PURCH: TStringField;
    ADO148_detailpart_name: TStringField;
    ADO148_detailEMPLOYEE_NAME: TStringField;
    ADO148_detailauth3_date: TDateTimeField;
    ADO148_detailEMPLOYEE_NAME_1: TStringField;
    ADO148_detailauth_date: TDateTimeField;
    ADO148_detailstatus_c: TStringField;
    ADO148_detailINVENT_PTR: TIntegerField;
    ADO148_detailpart_ptr: TIntegerField;
    ADO148_detailPRODUCT_GROUP_NAME: TStringField;
    qrydata17_allSTOP_PURCH: TStringField;
    qrydata17_17STOP_PURCH: TStringField;
    D08unit_ptr: TIntegerField;
    qry_WZCP494: TADOQuery;
    qry_WZCP494rkey: TAutoIncField;
    qry_WZCP494part_name: TStringField;
    intgrfld_WZCP494part_ptr: TIntegerField;
    intgrfld_WZCP494user_ptr: TIntegerField;
    qry_WZCP494auth_date: TDateTimeField;
    qry_WZCP494status: TWordField;
    qry_WZCP494user2_ptr: TIntegerField;
    qry_WZCP494auth2_date: TDateTimeField;
    intgrfld_WZCP494user3_ptr: TIntegerField;
    qry_WZCP494auth3_date: TDateTimeField;
    qry_WZCP494status_c: TStringField;
    qry_WZCP494EMPL_CODE: TStringField;
    qry_WZCP494EMPLOYEE_NAME: TStringField;
    qry_WZCP494EMPL_CODE_1: TStringField;
    qry_WZCP494EMPLOYEE_NAME_1: TStringField;
    qry_WZCP494EMPL_CODE_2: TStringField;
    qry_WZCP494EMPLOYEE_NAME_2: TStringField;
    ds_WZCp494: TDataSource;
    qry_WZCP495: TADOQuery;
    intgrfld_WZCP495seq_no: TIntegerField;
    qry_WZCP495rkey: TAutoIncField;
    intgrfld_WZCP495PARTBOM_PTR: TIntegerField;
    intgrfld_WZCP495INVENT_PTR: TIntegerField;
    intgrfld_WZCP495repl_invt_ptr: TIntegerField;
    qry_WZCP495QUAN_BOM: TBCDField;
    qry_WZCP495VENDOR: TStringField;
    qry_WZCP495STD_COST: TBCDField;
    qry_WZCP495inv_part_number: TStringField;
    qry_WZCP495inv_name: TStringField;
    qry_WZCP495INV_DESCRIPTION: TStringField;
    qry_WZCP495TotalCost: TBCDField;
    qry_WZCP495STOP_PURCH: TStringField;
    qry_WZCP495STOP_PURCH1: TStringField;
    qry_WZCP495inv_part_number_r: TStringField;
    qry_WZCP495inv_name_r: TStringField;
    qry_WZCP495INV_DESCRIPTION_r: TStringField;
    qry_WZCP495unit_name: TStringField;
    qry_WZCP495QUAN_ON_HAND: TBCDField;
    qry_WZCP495CRITICAL_MATL_FLAG: TWordField;
    intgrfld_WZCP495p_code: TIntegerField;
    qry_WZCP495production_teamname: TWideStringField;
    qry_WZCP495QUAN_ISSUED: TBCDField;
    ds_WZCp495: TDataSource;
    qry_WZCP494prod_code: TStringField;
    qry_WZCP494product_name: TStringField;
    qry_WZCP495s: TADOQuery;
    IntegerField1: TIntegerField;
    AutoIncField1: TAutoIncField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    BCDField1: TBCDField;
    StringField1: TStringField;
    BCDField2: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    BCDField3: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    BCDField4: TBCDField;
    WordField1: TWordField;
    IntegerField5: TIntegerField;
    WideStringField1: TWideStringField;
    BCDField5: TBCDField;
    ds_wzcp495s: TDataSource;
    wrdfldD08status140: TWordField;
    wrdfldD08status494: TWordField;
    procedure ADO492AfterOpen(DataSet: TDataSet);
    procedure aqCP140AfterScroll(DataSet: TDataSet);
    procedure aqCP140BeforeClose(DataSet: TDataSet);
    procedure aqCP148CalcFields(DataSet: TDataSet);
    procedure ADO140AfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ADO492AfterScroll(DataSet: TDataSet);
    procedure qry_WZCP494AfterScroll(DataSet: TDataSet);
  private

  public
    Num148: string;
    Vdata0017 : OleVariant;
    cdsdata17_cur08rkey1,cdsdata17_cur08rkey2 : Integer;//17提供的当前rkey
    pxflag1,pxflag2,pxflag3,pxflag4,pxflag5,pxflag6 :Integer;  //3个Tclientdataset 的排序
     function OpenQry(qry:TADOquery;ssql:string):string;
   function  execsql(qry:TADOquery;ssql:string):string;
   function  GetOne(FN,ssql:string;qry:TADOquery):Variant;

  end;

var
  DM: TDM;


implementation
uses Frm_BOM_u,UBOMMtrl;


{$R *.dfm}

procedure TDM.ADO492AfterOpen(DataSet: TDataSet);
begin
//  DM.ADS468.Close;
//  DM.ADS468.Parameters[0].Value := DM.ADO492.FieldValues['CUT_NO'];
//  DM.ADS468.Parameters[1].Value := DM.ADO492.FieldValues['CUT_NO'];
//  DM.ADS468.Open;
end;

procedure TDM.aqCP140AfterScroll(DataSet: TDataSet);
begin
  aqCP148.Close;
  CDS148.Close;
  aqCP148.Parameters[0].Value:= aqCP140rkey.Value;
  aqCP148.Parameters[1].Value:= aqCP140rkey.Value;
  aqCP148.Open;
  CDS148.Open;
end;

procedure TDM.aqCP140BeforeClose(DataSet: TDataSet);
begin
  aqCP148.Close;
end;

procedure TDM.aqCP148CalcFields(DataSet: TDataSet);
begin
  aqCP148.FieldByName('COST').AsFloat:= aqCP148.FieldByName('STD_COST').AsFloat*aqCP148.FieldByName('QUAN_BOM').AsFloat;
end;

procedure TDM.ADO140AfterScroll(DataSet: TDataSet);
begin

  Frm_BOM_u.Frm_BOM.DBGridEh2.DataSource:=DM.DS148;
  DM.ADO148.Close;
  DM.ADO148.Parameters[0].Value := DM.ADO140rkey.Value;
  DM.ADO148.Parameters[1].Value := DM.ADO140rkey.Value;
  DM.ADO148.Open;
  Frm_BOM_u.Frm_BOM.LBOMName.Caption := '当前显示物料清单所属BOM名称: '
    + DM.ADO140part_name.AsString + '   材料清单总数目: ' +IntToStr(dm.ADO148.RecordCount);



end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 // if VarIsEmpty(Vdata0017) then  Vdata0017:=VarArrayCreate([0,0],VarVariant);
 //   Vdata0017[0]:=DM.cdsdata17_all.Data;
 cdsdata17_cur08rkey1 := 0 ;
  cdsdata17_cur08rkey2 := 0 ;
 pxflag1:=0;
 pxflag2:=0;
 pxflag3:=0;
 pxflag4:=0;
 pxflag5:=0;
 pxflag6:=0; 
end;

procedure TDM.ADO492AfterScroll(DataSet: TDataSet);
begin
  with cds_wzcp0492  do
  begin
    Close;
    Params.ParamByName('D492Rkey').Value := DataSet.fieldByName('rkey').AsInteger;
    Open;
  end;
end;

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
  if not qry.IsEmpty  then
  Result:=qry.fieldbyname(fn).Value;
end;

procedure TDM.qry_WZCP494AfterScroll(DataSet: TDataSet);
begin
  if  qry_WZCP494.IsEmpty then   qry_WZCP495.close;

 // Frm_BOM_u.Frm_BOM.DBGridEh2.DataSource:=DM.DS148;
  UBOMMtrl.frmBOMMtrl.eh495.DataSource:=dm.ds_WZCp495;
 qry_WZCP495.Close;
 qry_WZCP495.Parameters[0].Value:=qry_WZCP494rkey.AsInteger;
 qry_WZCP495.Open;

 UBOMMtrl.frmBOMMtrl.eh495.DataSource.DataSet.Filtered:=false;

 if   Trim(UBOMMtrl.frmBOMMtrl.edt_value2.Text)<>'' then
    UBOMMtrl.frmBOMMtrl.edt_value2Change(UBOMMtrl.frmBOMMtrl.edt_value2);

end;

end.
