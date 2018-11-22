unit UMainfrm_Mod38OutToCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus, Data.Win.ADODB,
  Data.DB, Datasnap.DBClient, uCommFunc, uBaseSinglePickListFrm,
  USel17Materialfrm_Mod38, uMod38Common;

type
  TfrmMain_Mod38OutToCheck = class(TFrmBaseEdit)
    pnl4: TPanel;
    eh95: TDBGridEh;
    pm95: TPopupMenu;
    mniAdd: TMenuItem;
    mniDel: TMenuItem;
    ds95: TDataSource;
    cds95: TClientDataSet;
    cdstemp: TClientDataSet;
    cdsLookUp17: TClientDataSet;
    qry1: TADOQuery;
    qry1INV_PART_NUMBER: TStringField;
    qry1INV_NAME: TStringField;
    qry1INV_DESCRIPTION: TStringField;
    qry1rohs: TStringField;
    qry1UNIT_NAME: TStringField;
    qry1QUANTITY: TFloatField;
    lbl1: TLabel;
    procedure mniAddClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private

    procedure GetData17(AFrm: TfrmSel17Material_Mod38);
    function IsStockCheck(out ABillNo: string): Boolean;
  public
    { Public declarations }
    procedure init;
    procedure GetData;
  end;

var
  frmMain_Mod38OutToCheck: TfrmMain_Mod38OutToCheck;

implementation

{$R *.dfm}

procedure TfrmMain_Mod38OutToCheck.btnCloseClick(Sender: TObject);
begin
  inherited;
  //pnlmain.Visible := False;
  close;
// frmMain_Mod38OutToCheck:=nil;
 //frmSel17Material_Mod38:=nil;
end;

procedure TfrmMain_Mod38OutToCheck.btnSaveClick(Sender: TObject);
var
  Lnumber: string;
//  i: integer;
  cds22: TClientDataSet;
  //cdstemp22: TClientDataSet;
  cds17: TClientDataSet;
  cdstemp95: TClientDataSet;
  //Lsql: string;
  LrkeyStr22: string;
  LrkeyStr17: string;
  LDSArr: OleVariant;

begin
  inherited;
  cds22 := TClientDataSet.Create(nil);
  cds17 := TClientDataSet.Create(nil);
  cdstemp95 := TClientDataSet.Create(nil);
  try
  try
  if Self.IsStockCheck(Lnumber) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' + Lnumber, mtinformation,
      [mbcancel], 0);
    exit;
  end;

    LrkeyStr22 := ffunc.GetRkeyStr(cds95, 'srce_ptr');
    LrkeyStr17 := ffunc.GetRkeyStr(cds95, 'invt_ptr');

    gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey in ' +
      LrkeyStr22, cds22);

    gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey in ' +
      LrkeyStr17, cds17);

   cds95.DisableControls;
    cds95.First;
    while not cds95.Eof do
    begin
      if cds22.Locate('rkey', cds95.FieldByName('srce_ptr').AsInteger, []) then
      begin
        cds22.edit;
        cds22.FieldByName('QUAN_IN_INSP').Value :=
          cds22.FieldByName('QUAN_IN_INSP').Value +
          cds95.FieldByName('QUANTITY').Value;
        cds22.FieldByName('QUAN_ON_HAND').Value :=
          cds22.FieldByName('QUAN_ON_HAND').Value -
          cds95.FieldByName('QUANTITY').Value;
        cds22.Post;
      end;

      if cds22.FieldByName('QUAN_ON_HAND').Value -
        cds22.FieldByName('QUAN_TO_BE_STOCKED').Value < 0 then
      begin
        messagedlg('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发', mterror, [mbcancel], 0);
        GetData;
        exit;
      end;

      if cds17.Locate('rkey', cds95.FieldByName('invt_ptr').AsInteger, []) then
      begin
        cds17.edit;
        cds17.FieldByName('QUAN_ON_HAND').Value :=
          cds17.FieldByName('QUAN_ON_HAND').Value -
          cds95.FieldByName('QUANTITY').Value;
        cds17.Post;
      end;
      cds95.next;
    end;

    LDSArr := VarArrayCreate([0, 2], varVariant);
    if cds95.ChangeCount > 0 then
      LDSArr[0] := cds95.delta;
    if cds22.ChangeCount > 0 then
      LDSArr[1] := cds22.delta;
    if cds17.ChangeCount > 0 then
      LDSArr[2] := cds17.delta;

    if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr, 4) then
    begin
      cds95.MergeChangeLog;
      // cds22.MergeChangeLog;
      ShowMessage('发料成功!');

    end;

    GetData;

  except on e:exception do
  begin
  showmessage('错误:'+e.Message);
  exit;
  end;
  end;

  finally
  cds95.EnableControls;
  cds22.free;
  cds17.free;;
  cdstemp95.free;;
  end;

end;

procedure TfrmMain_Mod38OutToCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // pnlmain.Visible := False;
   Action := caFree;
   frmMain_Mod38OutToCheck:=nil;
   frmSel17Material_Mod38:=nil;

end;

procedure TfrmMain_Mod38OutToCheck.GetData;
var
  Lsql17, Lsql95: string;
begin
  inherited;
  Lsql17 := '  select  D17.rkey, d17.INV_PART_NUMBER ,d17.INV_NAME ,d17.INV_DESCRIPTION , '
    + ' d22.rohs , d02.UNIT_NAME' + ' from data0095 d95' +
    ' inner join data0017 d17 on d95.INVT_PTR=d17.RKEY' +
    ' inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.RKEY' +
    ' inner join data0022 d22 on  d95.SRCE_PTR=d22.rkey' + ' where d95.rkey=0 ';
  // showmessage(Lsql17);
  Lsql95 := 'select * from data0095  where rkey=0';

  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql17, Lsql95]),
    [cdsLookUp17, cds95]);
end;

procedure TfrmMain_Mod38OutToCheck.GetData17(AFrm: TfrmSel17Material_Mod38);
begin

  gSvrIntf.IntfGetDataBySql
    ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);
  // showmessage(cdsLookUp17.commandtext);
  cdsLookUp17.FieldByName('rkey').ReadOnly := false;

  cdsLookUp17.Append;
  cdsLookUp17.FieldByName('rkey').Value :=
    AFrm.cdsPick.FieldByName('INVENTORY_PTR').AsInteger;
  cdsLookUp17.FieldByName('INV_PART_NUMBER').Value :=
    AFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
  cdsLookUp17.FieldByName('INV_NAME').Value :=
    AFrm.cdsPick.FieldByName('INV_NAME').AsString;
  cdsLookUp17.FieldByName('INV_DESCRIPTION').Value :=
    AFrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
  cdsLookUp17.FieldByName('rohs').Value :=
    AFrm.cdsPick.FieldByName('rohs').Value;
  cdsLookUp17.FieldByName('unit_name').Value :=
    AFrm.cdsPick.FieldByName('unit_name').AsString;
  cdsLookUp17.Post;

  cds95.Append;
  cds95.FieldByName('TRAN_TP').Value := 6;
  cds95.FieldByName('INVT_PTR').Value := AFrm.cdsPick.FieldByName
    ('INVENTORY_PTR').AsInteger;
  cds95.FieldByName('SRCE_PTR').Value := AFrm.cdsPick.FieldByName('RKEY')
    .AsInteger;
  cds95.FieldByName('TRAN_by').Value := gVar.rkey05;
  if not cdstemp.IsEmpty then
    cds95.FieldByName('TRAN_Date').Value := cdstemp.FieldByName('NDate').Value;

  cds95.FieldByName('QUANTITY').Value := AFrm.Fqty;
  cds95.Post;

  eh95.DataSource := nil;
  eh95.DataSource := ds95;

end;

procedure TfrmMain_Mod38OutToCheck.init;
var
  LLKField: TField;
  i: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0095 WHERE 1=0', cds95);
  // 在数据集关闭的情况下新增加一个字段
  try
    cds95.Close;
    cds95.FieldDefs.BeginUpdate;
    for i := 0 to cds95.FieldDefList.Count - 1 do
    begin
      cds95.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    // Add New Field
    // 增加新的字段
    LLKField := TStringField.Create(cds95);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds95;

    LLKField := TStringField.Create(cds95);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds95;

    LLKField := TStringField.Create(cds95);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds95;

    LLKField := TStringField.Create(cds95);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds95;

    LLKField := TStringField.Create(cds95);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'rohs';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'rohs';
    LLKField.DataSet := cds95;

  finally
    cds95.FieldDefs.EndUpdate;
  end;
end;

function TfrmMain_Mod38OutToCheck.IsStockCheck(out ABillNo: string): Boolean;
var
  Lsql: string;
  cds92: TClientDataSet;
begin
  result := false;
   cds92 := TClientDataSet.Create(nil);
  try
  Lsql := 'SELECT top 1 dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,' + #13 +
    'dbo.Data0005.EMPLOYEE_NAME' + #13 + 'FROM dbo.Data0005 INNER JOIN' + #13 +
    'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR' + #13 +
    'WHERE (dbo.Data0092.STATUS = ''0'')';
  gSvrIntf.IntfGetDataBySql(Lsql, cds92);

  if not cds92.IsEmpty then
  begin
    ABillNo := cds92.FieldByName('PHY_COUNT_NO').AsString +
      cds92.FieldByName('EMPLOYEE_NAME').AsString;
    result := true;
  end;
  finally
    cds92.free;
  end;

end;

procedure TfrmMain_Mod38OutToCheck.mniAddClick(Sender: TObject);

begin
  inherited;

  if cds95.IsEmpty then
    frmSel17Material_Mod38:=nil;

  if frmSel17Material_Mod38 = nil then
  begin
    frmSel17Material_Mod38 := TfrmSel17Material_Mod38.Create(Self);
    frmSel17Material_Mod38.InitWithPickID(38, 3);
    frmSel17Material_Mod38.width := 1200;
    frmSel17Material_Mod38.height := 800;
  end;

  frmSel17Material_Mod38.FFlag := 2; // 编码物料2来料检查

  frmSel17Material_Mod38.FParentCallBack := GetData17;
  frmSel17Material_Mod38.edtFilter.Text:='';
  frmSel17Material_Mod38.showmodal;

end;

procedure TfrmMain_Mod38OutToCheck.mniDelClick(Sender: TObject);
begin
  inherited;
  if cds95.IsEmpty then exit;
    cdsLookUp17.Delete;
    cds95.Delete;


  end;

end.
