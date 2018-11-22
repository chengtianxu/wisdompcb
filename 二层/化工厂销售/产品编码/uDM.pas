unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB,Messages,Dialogs;

type
  TDataModule1 = class(TDataModule)
    ADOTable1: TADOTable;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1PROD_CODE: TStringField;
    ADOTable1PRODUCT_NAME: TStringField;
    ADOTable1PR_GRP_POINTER: TIntegerField;
    ADOTable1unit_ptr: TIntegerField;
    ADOTable1new_price: TBCDField;
    ADOTable1qty_onhand: TBCDField;
    ADOTable1min_qty: TBCDField;
    ADOTable1max_qty: TBCDField;
    ADOTabl_search: TADOTable;
    ADOTabl_searchRKEY: TAutoIncField;
    ADOTabl_searchPR_GRP_CODE: TStringField;
    ADOTabl_searchPRODUCT_GROUP_NAME: TStringField;
    ADODataSet1: TADODataSet;
    ADODataSet1RKEY: TAutoIncField;
    ADODataSet1PROD_CODE: TStringField;
    ADODataSet1PRODUCT_NAME: TStringField;
    ADODataSet1PR_GRP_POINTER: TIntegerField;
    ADODataSet1unit_ptr: TIntegerField;
    ADODataSet1new_price: TBCDField;
    ADODataSet1qty_onhand: TBCDField;
    ADODataSet1min_qty: TBCDField;
    ADODataSet1max_qty: TBCDField;
    ADODataSet1cpdw: TStringField;
    ADODataSet1cpitem: TStringField;
    ADOConnection1: TADOConnection;
    ADODSCW: TADODataSet;
    ADOTBKCMX: TADOTable;
    ADOTBKCMXrkey: TAutoIncField;
    ADOTBKCMXproc_ptr: TIntegerField;
    ADOTBKCMXlocation_ptr: TIntegerField;
    ADOTBKCMXqty_on_hand: TBCDField;
    ADODSCWMAX_UNIT_VALUE: TFloatField;
    ADODSCWRKEY: TAutoIncField;
    ADODSCWLOCATION: TStringField;
    ADODataSet1unit_code: TStringField;
    ADODataSet1pr_grp_code: TStringField;
    procedure ADODataSet1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  //procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
  //UpdateKind: TUpdateKind; var Action: TDataAction);

  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation



{$R *.dfm}
 //错误处理
{procedure TDataModule1.HandleError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var Action: TDataAction);
var
  i:integer;
begin

  showmessage(e.message);

  //主键重复
  if pos('Violation of PRIMARY KEY constraint',e.Message)=1 then
    i:=messagebox(handle,pchar(ViolationKey),pchar(infomsg),MB_ABORTRETRYIGNORE or mb_iconerror)
  else
  //外键引用无法删除
  if pos('DELETE statement conflicted with COLUMN REFERENCE constraint',e.message)=1 then
    i:=messagebox(handle,pchar(DeleteError),pchar(infomsg),MB_ok or mb_iconerror)
  else
  //插入时外键不存在
  if pos('INSERT statement conflicted with COLUMN FOREIGN KEY constraint',e.message)=1 then
    i:=messagebox(handle,pchar(InsForeignkey),pchar(infomsg),MB_ABORTRETRYIGNORE or mb_iconerror)
  else
  //修改时外键引用
  if pos('UPDATE statement conflicted with COLUMN REFERENCE constraint',e.message)=1 then
    i:=messagebox(handle,pchar(UpdateError),pchar(infomsg),MB_ABORTRETRYIGNORE or mb_iconerror);
  //Action:=raCancel;
  if i=id_abort then
    abort
  else
  if i=id_retry then
    action:=raCorrect
  else
  if i=id_cancel then
    action:=raCancel;
end; }

procedure TDataModule1.ADODataSet1DeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
 //主键重复
 { if pos('Violation of PRIMARY KEY constraint',e.Message)=1 then
    messagedlg('主键重复!',mtWarning,[mbOk],0)
  else
  //外键引用无法删除
  if pos('DELETE statement conflicted with COLUMN REFERENCE constraint',e.message)=1 then
     messagedlg('外键引用无法删除!',mtWarning,[mbOk],0)
  else
  //插入时外键不存在
  if pos('INSERT statement conflicted with COLUMN FOREIGN KEY constraint',e.message)=1 then
    messagedlg('插入时外键不存在!',mtWarning,[mbOk],0)
  else
  //修改时外键引用
  if pos('UPDATE statement conflicted with COLUMN REFERENCE constraint',e.message)=1 then
    messagedlg('修改时外键引用!',mtWarning,[mbOk],0);}
  messagedlg('外键引用无法删除!',mtWarning,[mbOk],0);
  Abort;
end;

end.
