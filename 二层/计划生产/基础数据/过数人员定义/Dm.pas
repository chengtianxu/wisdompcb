unit Dm;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsWorkerList: TADODataSet;
    dsWorkerList: TDataSource;
    adsWorker: TADODataSet;
    dsWorker: TDataSource;
    adsWorkFlow: TADODataSet;
    dsWorkFlow: TDataSource;
    aqDepartment: TADOQuery;
    adsWorkFlowRKEY: TAutoIncField;
    adsWorkFlowUSER_PTR: TIntegerField;
    adsWorkFlowDEPT_PTR: TIntegerField;
    adsWorkFlowDept_Code: TStringField;
    adsWorkFlowDept_Name: TStringField;
    aqEmployee: TADOQuery;
    adsWorkerRKEY: TAutoIncField;
    adsWorkerEMPL_PTR: TIntegerField;
    adsWorkerLOGIN_NAME: TStringField;
    adsWorkerLOGIN_PASS: TStringField;
    adsWorkerPRIV: TWordField;
    adsWorkerEmpl_Name: TStringField;
    adsPickWorkShop: TADODataSet;
    dsPickWorkShop: TDataSource;
    adsPickWorkShopIsSelected: TBooleanField;
    adsPickWorkShoprKey: TIntegerField;
    adsPickWorkShopDept_Code: TStringField;
    adsPickWorkShopDept_Name: TStringField;
    cdsPickWorkShop: TClientDataSet;
    dspPickWorkShop: TDataSetProvider;
    adsWorkerPswd_Decode: TStringField;
    adsPrintDesc: TADODataSet;
    adsWorkerOutSource: TBooleanField;
    adsWorkerwarehouse_ptr: TIntegerField;
    Read0015: TADOQuery;
    adsWorkerWAREHOUSE_CODE: TStringField;
    adsWorkerWAREHOUSE_NAME: TStringField;
    procedure adsWorkerAfterOpen(DataSet: TDataSet);
    procedure adsWorkerAfterScroll(DataSet: TDataSet);
    procedure adsWorkerEMPL_PTRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure adsWorkerEMPL_PTRSetText(Sender: TField; const Text: String);
    procedure adsWorkerCalcFields(DataSet: TDataSet);
    procedure adsPickWorkShopAfterOpen(DataSet: TDataSet);
    procedure adsWorkFlowBeforeEdit(DataSet: TDataSet);
    procedure adsWorkerAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function DeleteData(rKey:integer):boolean;
    function Get_Print_Dept_Desc(rKey486:integer):string;//返回打印的员工过数工序描述
  end;

var
  dmcon: Tdmcon;

implementation
uses common,MyClass,Worker_Edit,ConstVar;
{$R *.dfm}

procedure Tdmcon.adsWorkerAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    MyDataclass.OpenDataSetByPara(0,adsWorkFlow);
end;

procedure Tdmcon.adsWorkerAfterScroll(DataSet: TDataSet);
begin
  MyDataclass.OpenDataSetByPara(DataSet.FieldByName('rKey').AsInteger,adsWorkFlow);
end;

procedure Tdmcon.adsWorkerEMPL_PTRGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.IsNull then exit;
  if aqEmployee.Locate('rKey',Sender.Value,[]) then
    text := aqEmployee.fieldbyName('Empl_Code').AsString;
end;

procedure Tdmcon.adsWorkerEMPL_PTRSetText(Sender: TField;
  const Text: String);
begin
  if Sender.IsNull then exit;
  if aqEmployee.Locate('Empl_Code',Text,[]) then
    Sender.Value := aqEmployee.fieldbyName('rKey').AsString;
end;

procedure Tdmcon.adsWorkerCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('EMPL_PTR').IsNull then exit;
  if aqEmployee.Locate('rKey',DataSet.FieldByName('EMPL_PTR').Value,[]) then
    DataSet.FieldByName('EMPL_Name').Value := aqEmployee.fieldbyName('employee_name').AsString;

  if not DataSet.FieldByName('warehouse_ptr').IsNull  then
  begin
    if Read0015.Locate('rkey',DataSet.FieldByName('warehouse_ptr').Value,[])then
    begin
      DataSet.FieldByName('WAREHOUSE_CODE').Value:=Read0015.FieldByName('WAREHOUSE_CODE').Value ;
      DataSet.FieldByName('ABBR_NAME').Value:=Read0015.FieldByName('ABBR_NAME').Value ;
    end;
  end
  else
  begin
      DataSet.FieldByName('WAREHOUSE_CODE').Value:='';
      DataSet.FieldByName('ABBR_NAME').Value:='';
  end;
end;

procedure Tdmcon.adsPickWorkShopAfterOpen(DataSet: TDataSet);
begin
  cdsPickWorkShop.Data := dspPickWorkShop.Data;
end;

procedure Tdmcon.adsWorkFlowBeforeEdit(DataSet: TDataSet);
begin
  adsWorker.Edit;
end;

function Tdmcon.DeleteData(rKey: integer): boolean;
var
  sqlstr:string;
begin
  sqlstr:='Delete from data0487 where User_Ptr='+IntToStr(rKey)+#13+' delete from data0486 where rKey='+IntToStr(rKey);
  result := MyDataClass.ExecSql(sqlstr,true);
end;

function Tdmcon.Get_Print_Dept_Desc(rKey486: integer): string;
var
  tmpstr:string;
begin
  MyDataClass.OpenDataSetByPara(rkey486,adsPrintDesc);
  adsPrintDesc.First;
  while not adsPrintDesc.Eof do begin
    if tmpstr='' then
      tmpstr:=adsPrintDesc.fieldbyName('Dept').asstring
    else
      tmpstr:=tmpStr+'/'+adsPrintDesc.fieldbyName('Dept').asstring;
    adsPrintDesc.next;
  end;
  result := tmpstr;
  adsPrintDesc.close;
end;

procedure Tdmcon.adsWorkerAfterInsert(DataSet: TDataSet);
begin
  with  DataSet do
  begin
    FieldByName('OutSource').Value:=False;
  end;
end;

end.
