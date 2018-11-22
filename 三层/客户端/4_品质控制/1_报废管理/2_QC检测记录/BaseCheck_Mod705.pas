unit BaseCheck_Mod705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.Menus,
  System.StrUtils;

type
  TAfterAppendEvent = procedure of object;

  TfrmBaseCheck_Mod705 = class(TfrmBase)
    pnlDisplay: TPanel;
    Panel1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    cdsRDetail: TClientDataSet;
    dsRDetail: TDataSource;
    CdsRMain: TClientDataSet;
    pnl4: TPanel;
    pnl5: TPanel;
    btn_Cancel: TButton;
    dsRMain: TDataSource;
    cdsModel: TClientDataSet;
    cdsTemp: TClientDataSet;
    test: TADOQuery;
    testBugQty: TIntegerField;
    testREJECT_DESCRIPTION: TStringField;
    btn_Save: TButton;
    pnl1: TPanel;
    ehRDetail: TDBGridEh;
    pnl6: TPanel;
    lblBugCode: TLabel;
    edtFilter: TEdit;
    pmDetail: TPopupMenu;
    mni_Add: TMenuItem;
    pnl7: TPanel;
    pnl8: TPanel;
    lbl3: TLabel;
    edt_WorkNo: TRKeyRzBtnEdit;
    lbl5: TLabel;
    edt_ProdNo: TRKeyRzBtnEdit;
    lbl1: TLabel;
    dtpQC: TDateTimePicker;
    lbl2: TLabel;
    Label5: TLabel;
    cbb_ClassNo: TComboBox;
    lbl12: TLabel;
    edt_PassQty: TRKeyRzBtnEdit;
    edt_FailQty: TRKeyRzBtnEdit;
    Label2: TLabel;
    edt_Remark: TRKeyRzBtnEdit;
    edt_AllQty: TRKeyRzBtnEdit;
    lbl4: TLabel;
    lbl7: TLabel;
    edt_CheckCount: TRKeyRzBtnEdit;
    lbl6: TLabel;
    cbb_QCTestName: TComboBox;
    lbl15: TLabel;
    edt_MachineNo: TRKeyRzBtnEdit;
    Label6: TLabel;
    lbl11: TLabel;
    lbl8: TLabel;
    edt_PnlQty: TRKeyRzBtnEdit;
    Label3: TLabel;
    edt_PPassQty: TRKeyRzBtnEdit;
    lbl10: TLabel;
    edt_SideQty: TRKeyRzBtnEdit;
    Label4: TLabel;
    edt_SPassQty: TRKeyRzBtnEdit;
    Label1: TLabel;
    edt_BTime: TRKeyRzBtnEdit;
    Label7: TLabel;
    edt_ETime: TRKeyRzBtnEdit;
    lbl16: TLabel;
    edt_WManNo: TRKeyRzBtnEdit;
    lbl17: TLabel;
    edt_PBCount: TRKeyRzBtnEdit;
    cbb_LayerNo: TComboBox;
    cbb_HDDesc: TComboBox;
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure edt_WorkNoButtonClick(Sender: TObject);
    procedure edt_WorkNoExit(Sender: TObject);
    procedure edt_FailQtyExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_AllQtyExit(Sender: TObject);
    procedure edt_AllQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_FailQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_AllQtyKeyPress(Sender: TObject; var Key: Char);

    procedure FormCreate(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure ehRDetailTitleClick(Column: TColumnEh);
    procedure ehRDetailColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure mni_AddClick(Sender: TObject);
    procedure edt_WorkNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PnlQtyExit(Sender: TObject);
    procedure edt_PnlQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_SideQtyExit(Sender: TObject);
    procedure edt_SideQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PnlQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PPassQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SideQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SPassQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PBCountKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PassQtyExit(Sender: TObject);
    procedure edt_PBCountExit(Sender: TObject);
    procedure edt_PBCountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
  protected

  public
    FModelID: Integer;
    FEType: Integer;
    FIDKey: string;
    AddRefresh: TAfterAppendEvent;
    procedure GetData(AModelID: Integer; AEType: Integer; AIDKey: string);
      virtual; // AEType: 1为新增， 2为编辑，3为浏览
    procedure GetData2(AModelID: Integer; AEType: Integer; AIDKey: string);
      virtual; // AEType: 1为新增， 2为编辑，3为浏览

    procedure InitData(AModelID: Integer; AEType: Integer;
      AIDKey: string); virtual;
    procedure InitData2(Ads: TClientDataSet); virtual;

    procedure InitModel(AModelID: Integer; AEType: Integer;
      AIDKey: string); virtual;
    function BeforeSaveToDB: Boolean; virtual;
    function SaveToDB: Boolean; virtual;
    procedure iniRDetail;

  end;

var
  frmBaseCheck_Mod705: TfrmBaseCheck_Mod705;

implementation

uses
  uCommFunc, uBaseSinglePickListFrm;

{$R *.dfm}
{ TfrmBaseFQCCheck_Mod705 }



procedure TfrmBaseCheck_Mod705.GetData(AModelID: Integer; AEType: Integer;
  AIDKey: string);
var
  LSqlMain: string;
  LSqlDetail: string;
  LSqlModel: string;
begin
  FModelID := AModelID;
  if AEType = 1 then
  begin
    LSqlMain := 'select * from QC_ReportMain where 1=0';

    LSqlDetail := '  select   b.* ,d39.REJ_CODE,d39.REJECT_DESCRIPTION  ' +
      ' from  dbo.QC_ReportDetail b               ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY ' + '  where 1=0 ';

    LSqlModel :=
      'select d39.rkey, b.SeqNo,d39.REJECT_DESCRIPTION,d39.REJ_CODE,0 as BadQty '
      + ' from  dbo.QC_DeptBugDefDetail b                   ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY  ' +
      '  where b.TypeID=' + IntToStr(AModelID) + ' ' +
      ' order by  b.SeqNo';
  end
  else
  begin
    LSqlMain := 'select * from QC_ReportMain where IDKey=''' + AIDKey + ''' ';

    LSqlDetail := '  select   b.* ,d39.REJ_CODE,d39.REJECT_DESCRIPTION  ' +
      ' from  dbo.QC_ReportDetail b  ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY ' +
      '  where b.M_IDKey=''' + AIDKey + ''' ';
    LSqlModel :=
      'select d39.rkey, b.SeqNo,d39.REJECT_DESCRIPTION,d39.REJ_CODE,0 as BadQty '
      + ' from  dbo.QC_DeptBugDefDetail b                   ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY  ' +
      '  where b.TypeID=' + IntToStr(FModelID) + ' ' +
      ' order by  d39.REJ_CODE';
  end;

  if not gSvrIntf.IntfGetDataBySqlArr
    (VarArrayOf([LSqlMain, LSqlDetail, LSqlModel]),
    [CdsRMain, cdsRDetail, cdsModel]) then
  begin
    ShowMessage('错误');
    exit;
  end;

  cdsRDetail.First;

end;

procedure TfrmBaseCheck_Mod705.GetData2(AModelID, AEType: Integer;
  AIDKey: string);
var
  LSqlMain: string;
  LSqlDetail: string;
  LSqlModel: string;
begin
  FModelID := AModelID;
  if AEType = 1 then
  begin

    LSqlDetail := '  select   b.* ,d39.REJ_CODE,d39.REJECT_DESCRIPTION  ' +
      ' from  dbo.QC_ReportDetail b               ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY ' + '  where 1=0 ';

    LSqlModel :=
      'select d39.rkey, b.SeqNo,d39.REJECT_DESCRIPTION,d39.REJ_CODE,0 as BadQty '
      + ' from  dbo.QC_DeptBugDefDetail b                   ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY  ' +
      '  where b.TypeID=' + IntToStr(AModelID) + ' ' +
      ' order by  b.SeqNo';
  end
  else
  begin

    LSqlDetail := '  select   b.* ,d39.REJ_CODE,d39.REJECT_DESCRIPTION  ' +
      ' from  dbo.QC_ReportDetail b  ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY ' +
      '  where b.M_IDKey=''' + AIDKey + ''' ';
    LSqlModel :=
      'select d39.rkey, b.SeqNo,d39.REJECT_DESCRIPTION,d39.REJ_CODE,0 as BadQty '
      + ' from  dbo.QC_DeptBugDefDetail b                   ' +
      '  inner join  Data0039   d39  on b.D39_ptr=d39.RKEY  ' +
      '  where b.TypeID=' + IntToStr(FModelID) + ' ' +
      ' order by  d39.REJ_CODE';
  end;

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlDetail, LSqlModel]),
    [cdsRDetail, cdsModel]) then
  begin
    ShowMessage('错误');
    exit;
  end;

  cdsRDetail.First;

end;

procedure TfrmBaseCheck_Mod705.iniRDetail;
begin
  cdsModel.First;
  while not cdsModel.Eof do
  begin
    cdsRDetail.Append;
    cdsRDetail.FieldByName('M_IDKey').value :=
      CdsRMain.FieldByName('IDKey').value;
    // cdsRDetail.FieldByName('SEQNO').AsString := cdsModel.FieldByName('SEQNO').AsString;
    cdsRDetail.FieldByName('REJ_CODE').AsString :=
      cdsModel.FieldByName('REJ_CODE').AsString;
    cdsRDetail.FieldByName('REJECT_DESCRIPTION').value :=
      cdsModel.FieldByName('REJECT_DESCRIPTION').value;
    cdsRDetail.FieldByName('BugQty').value := 0;
    cdsRDetail.FieldByName('D39_ptr').value :=
      cdsModel.FieldByName('rkey').value;
    cdsModel.Next;
  end;
end;

procedure TfrmBaseCheck_Mod705.InitModel(AModelID: Integer; AEType: Integer;
  AIDKey: string);
begin
  FModelID := AModelID;
  FEType := AEType;
  FIDKey := AIDKey;
  GetData(AModelID, AEType, AIDKey);
  InitData(AModelID, AEType, AIDKey);
end;

procedure TfrmBaseCheck_Mod705.mni_AddClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(705, 2);
    if LFrm.showmodal = mrok then
    begin
      if cdsModel.Locate('rkey', LFrm.cdsPick.FieldByName('rkey').AsInteger, [])
      then
      begin
        ShowMessage('已存在该不良项目，请重选。');
        mni_AddClick(mni_Add);
        exit;
      end;
      cdsRDetail.Append;
      cdsRDetail.FieldByName('M_IDKey').value :=
        CdsRMain.FieldByName('IDKey').value;
      cdsRDetail.FieldByName('d39_ptr').value :=
        LFrm.cdsPick.FieldByName('rkey').value;
      cdsRDetail.FieldByName('Rej_Code').value :=
        LFrm.cdsPick.FieldByName('Rej_Code').value;
      cdsRDetail.FieldByName('BugQty').value := 0;
      cdsRDetail.FieldByName('reject_description').value :=
        LFrm.cdsPick.FieldByName('reject_description').value;
      cdsRDetail.Post;

    end;
  finally
    LFrm.Free;
  end;

end;

function TfrmBaseCheck_Mod705.BeforeSaveToDB: Boolean;
begin

end;

procedure TfrmBaseCheck_Mod705.btn_CancelClick(Sender: TObject);
begin
  inherited;
  try
    cdsRDetail.DisableControls;
    GetData(FModelID, FEType, FIDKey);
    InitData(FModelID, FEType, FIDKey);

  finally
    cdsRDetail.EnableControls;
  end;
end;

procedure TfrmBaseCheck_Mod705.btn_SaveClick(Sender: TObject);
var
  FDate: TDate;
begin
  inherited;
  FDate := dtpQC.Date;
  cdsRDetail.DisableControls;
  try
    if BeforeSaveToDB then
    begin
      if SaveToDB then
      begin
        GetData(FModelID, FEType, FIDKey);
        btn_CancelClick(btn_Cancel);
        dtpQC.Date := FDate;
        ShowMessage('保存成功 ！');
      end;
    end;

  finally
    cdsRDetail.EnableControls;

  end;
end;

procedure TfrmBaseCheck_Mod705.edtFilterChange(Sender: TObject);
var
  LFilter: string;
begin
  if VarType(cdsRDetail.Data) = varEmpty then
    exit;
  LFilter := Trim(edtFilter.Text);

  if FHotColumn = nil then
    FHotColumn := ehRDetail.Columns[0];
  if Trim(LFilter) = '' then
  begin
    cdsRDetail.Filter := '';
    cdsRDetail.Filtered := false;
  end
  else
  begin
    if FHotColumn.Field.DataType in [ftString, ftWideString, ftMemo] then
    begin
      cdsRDetail.Filter := FHotColumn.FieldName + ' like ' +
        QuotedStr('%' + LFilter + '%');
      cdsRDetail.Filtered := True;
    end;
  end;
end;

procedure TfrmBaseCheck_Mod705.edt_AllQtyExit(Sender: TObject);
begin
  inherited;
  // edt_FailQtyExit(edt_FailQty);
end;

procedure TfrmBaseCheck_Mod705.edt_AllQtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edt_FailQty.Focused;
end;

procedure TfrmBaseCheck_Mod705.edt_AllQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmBaseCheck_Mod705.edt_FailQtyExit(Sender: TObject);
var
  Li: Integer;
begin
  inherited;
  if (Trim(edt_AllQty.Text) = '') or (Trim(edt_FailQty.Text) = '') then
    exit;

  if (strtoint(Trim(edt_AllQty.Text)) < 0) or
    (strtoint(Trim(edt_FailQty.Text)) < 0) then
  begin
    ShowMessage('数量不能为负数！');
    exit;
  end;

  if (Trim(edt_AllQty.Text) = '') and (Trim(edt_FailQty.Text) <> '') then
  begin
    ShowMessage('请先录入送检数量！');
    exit;
  end;

  if (Trim(edt_AllQty.Text) <> '') and (Trim(edt_FailQty.Text) <> '') then
  begin
    Li := strtoint(Trim(edt_AllQty.Text)) - strtoint(Trim(edt_FailQty.Text));
    if Li < 0 then
    begin
      ShowMessage('不良数不能大于送检数！');
      exit;
    end
    else
      edt_PassQty.Text := IntToStr(Li);
    CdsRMain.edit;
    CdsRMain.FieldByName('PassQty').value := Li;
    CdsRMain.Post;
  end;

end;

procedure TfrmBaseCheck_Mod705.edt_FailQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0); //
  if Key = #13 then
    edt_Remark.SetFocus;
end;

procedure TfrmBaseCheck_Mod705.edt_PassQtyExit(Sender: TObject);
var
  Li: Integer;
begin
  inherited;
  if (Trim(edt_AllQty.Text) = '') or (Trim(edt_PassQty.Text) = '') then
    exit;

  if (strtoint(Trim(edt_AllQty.Text)) < 0) or
    (strtoint(Trim(edt_PassQty.Text)) < 0) then
  begin
    ShowMessage('数量不能为负数！');
    exit;
  end;

  if (Trim(edt_AllQty.Text) = '') and (Trim(edt_PassQty.Text) <> '') then
  begin
    ShowMessage('请先录入送检数量！');
    exit;
  end;

  if (Trim(edt_AllQty.Text) <> '') and (Trim(edt_PassQty.Text) <> '') then
  begin
    Li := strtoint(Trim(edt_AllQty.Text)) - strtoint(Trim(edt_PassQty.Text));
    if Li < 0 then
    begin
      ShowMessage('良品数不能大于送检数！');
      exit;
    end
    else
      edt_FailQty.Text := IntToStr(Li);
    CdsRMain.edit;
    CdsRMain.FieldByName('FailQty').value := Li;
    CdsRMain.Post;
  end;

end;

procedure TfrmBaseCheck_Mod705.edt_PBCountExit(Sender: TObject);
begin
  inherited;
  if Trim(edt_PnlQty.Text) = '' then
    exit;
  if (Trim(edt_PBCount.Text) = '') then
    exit;

  edt_AllQty.Text := FloatToStr(StrToFloat(Trim(edt_PnlQty.Text)) *
    StrToFloat(Trim(edt_PBCount.Text)));
  edt_SideQty.Text := FloatToStr(StrToFloat(Trim(edt_PnlQty.Text)) );

  CdsRMain.edit;
  CdsRMain.FieldByName('ALLQty').value := StrToFloat(edt_AllQty.Text);
  CdsRMain.FieldByName('SideQty').value := StrToFloat(edt_SideQty.Text);
  CdsRMain.Post;
end;

procedure TfrmBaseCheck_Mod705.edt_PBCountKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key <> 13 then
    exit;
  edt_PBCountExit(edt_PBCount);
end;

procedure TfrmBaseCheck_Mod705.edt_PBCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmBaseCheck_Mod705.edt_PnlQtyExit(Sender: TObject);
begin
  inherited;
  if Trim(edt_PnlQty.Text) = '' then
    exit;
  if (Trim(edt_PBCount.Text) = '') then
    exit;

  edt_AllQty.Text := FloatToStr(StrToFloat(Trim(edt_PnlQty.Text)) *
    StrToFloat(Trim(edt_PBCount.Text)));
  edt_SideQty.Text := FloatToStr(StrToFloat(Trim(edt_PnlQty.Text)) );

  CdsRMain.edit;
  CdsRMain.FieldByName('ALLQty').value := StrToFloat(edt_AllQty.Text);
  CdsRMain.FieldByName('SideQty').value := StrToFloat(edt_SideQty.Text);
  CdsRMain.Post;
end;

procedure TfrmBaseCheck_Mod705.edt_PnlQtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key <> 13 then
    exit;
  edt_PnlQtyExit(edt_PnlQty);
end;

procedure TfrmBaseCheck_Mod705.edt_WorkNoButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
  i:integer;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(705, 1);
    if LFrm.showmodal = mrok then
    begin
      CdsRMain.edit;
      edt_ProdNo.Text := LFrm.cdsPick.FieldByName('MANU_PART_NUMBER').value;
      i:= LFrm.cdsPick.FieldByName('rkey').value;
     CdsRMain.FieldByName('d06_ptr').value := LFrm.cdsPick.FieldByName('rkey').value;
    // edt_WorkNo.Text:= LFrm.cdsPick.FieldByName('WORK_ORDER_NUMBER').value;
    // edt_WorkNo.Tag:=LFrm.cdsPick.FieldByName('RKEY').value;
    //  edt_AllQty.Text := LFrm.cdsPick.FieldByName('QTY_BACKLOG').value;
      // showmessage(LFrm.cdsPick.FieldByName('QTY_BACKLOG').asstring);
     // CdsRMain.FieldByName('AllQty').value :=
      //  LFrm.cdsPick.FieldByName('QTY_BACKLOG').value;
      CdsRMain.Post;
      // edt_FailQty.SetFocus;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TfrmBaseCheck_Mod705.edt_WorkNoExit(Sender: TObject);
var
  Lsql: string;
begin
  inherited;

  if Trim(edt_WorkNo.Text) = '' then exit;


  Lsql := ' select D06.RKEY as rkey06, d06.WORK_ORDER_NUMBER,d25.MANU_PART_NUMBER,isnull(d56.QTY_BACKLOG,0) as QTY_BACKLOG  '
    + ' from Data0006 d06                                                     '
    + 'inner join data0025 d25 on d06.BOM_PTR=d25.RKEY                          '
    + ' left  join data0056  d56  on d06.rkey=d56.WO_PTR ' +
    ' where d06.WORK_ORDER_NUMBER=''' + Trim(edt_WorkNo.Text) + ''' ';

  gSvrIntf.IntfGetDataBySql(Lsql, cdsTemp);

  if not cdsTemp.IsEmpty then
  begin
    CdsRMain.edit;
     edt_ProdNo.Text := cdsTemp.FieldByName('MANU_PART_NUMBER').value;
      CdsRMain.FieldByName('D06_ptr').value := cdsTemp.FieldByName('rkey06').value;
    //edt_AllQty.Text := cdsTemp.FieldByName('QTY_BACKLOG').value;
    CdsRMain.Post;
  end;

end;

procedure TfrmBaseCheck_Mod705.edt_WorkNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key <> 13 then   exit;
  edt_WorkNoExit(edt_WorkNo);
end;

procedure TfrmBaseCheck_Mod705.ehRDetailColumns0EditButtons0Click
  (Sender: TObject; var Handled: Boolean);
// var
// LFrm: TfrmSinglePickList;
begin
  inherited;
  // LFrm := TfrmSinglePickList.Create(self);
  // try
  // LFrm.InitWithPickID(705, 2);
  // if LFrm.showmodal = mrok then
  // begin
  // CdsRDetail.edit;
  // cdsRDetail.FieldByName('M_IDKey').Value:=CdsRMain.FieldByName('IDKey').Value ;
  // CdsRDetail.FieldByName('d39_ptr').Value :=LFrm.cdsPick.FieldByName('rkey').Value;
  // CdsRDetail.FieldByName('Rej_Code').Value :=LFrm.cdsPick.FieldByName('Rej_Code').Value;
  // CdsRDetail.FieldByName('reject_description').Value :=LFrm.cdsPick.FieldByName('reject_description').Value;
  // CdsRDetail.Post;
  // end;
  // finally
  // LFrm.Free;
  // end;

end;

procedure TfrmBaseCheck_Mod705.ehRDetailTitleClick(Column: TColumnEh);
begin
  inherited;
  FHotColumn := Column;
  lblBugCode.Caption := Column.Title.Caption;
end;

procedure TfrmBaseCheck_Mod705.FormCreate(Sender: TObject);
begin
  inherited;
  FHotColumn := ehRDetail.Columns[0];
  lblBugCode.Caption := FHotColumn.Title.Caption;
end;

procedure TfrmBaseCheck_Mod705.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (Key = 19) then // and  (key= 19)
    // btn_SaveClick(btn_Save);
    ShowMessage('test');

end;

procedure TfrmBaseCheck_Mod705.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmBaseCheck_Mod705.InitData(AModelID: Integer; AEType: Integer;
  AIDKey: string);
var
  Lsql: string;
begin
  if AEType = 1 then
  begin
    Lsql := 'select  ID,TypeName from dbo.QC_DeptBugDef where ID=' +
      IntToStr(FModelID) + ' ';

    gSvrIntf.IntfGetDataBySql(Lsql, cdsTemp);
     dtpQC.Date := gfunc.GetSvrDateTime-1;
    edt_ProdNo.Text := '';

    CdsRMain.edit;
    CdsRMain.FieldByName('IDkey').value := gfunc.CreateIDKey;
    CdsRMain.FieldByName('TypeID').value := AModelID;
    CdsRMain.FieldByName('D05_ptr').value := gVar.rkey05;
    CdsRMain.FieldByName('QCDateTime').value := gfunc.GetSvrDateTime;
   // CdsRMain.FieldByName('QCDate').value :=
    //  StrToDateTime(FormatDateTime('yyyy-MM-dd', now - 1));
    CdsRMain.FieldByName('QCTestRound').value := 1;
    //CdsRMain.FieldByName('PassQty').value := 0;
    //CdsRMain.FieldByName('FailQty').value := 0;
    //CdsRMain.FieldByName('SPassQty').value := 0;
    //CdsRMain.FieldByName('PPassQty').value := 0;

    // CdsRMain.fieldbyname('QtyUnitName').value:='PCS';
    if not cdsTemp.IsEmpty then
    begin
      if cbb_QCTestName.Items.Count < 1 then
      begin
        cbb_QCTestName.Text := cdsTemp.FieldByName('TypeName').value;
        CdsRMain.FieldByName('QCTestName').value :=
          cdsTemp.FieldByName('TypeName').value;
      end;
      CdsRMain.Post;
    end;
    iniRDetail;
  end
  else
  begin
    Lsql := ' select D06.RKEY as rkey06, d06.WORK_ORDER_NUMBER,d25.MANU_PART_NUMBER '
      + ' from Data0006 d06                                                     '
      + 'inner join data0025 d25 on d06.BOM_PTR=d25.RKEY                          '
      + ' where   d06.WORK_ORDER_NUMBER=''' + Trim(edt_WorkNo.Text) + ''' ';

    gSvrIntf.IntfGetDataBySql(Lsql, cdsTemp);

    if not cdsTemp.IsEmpty then
    begin
      CdsRMain.edit;
      edt_ProdNo.Text := cdsTemp.FieldByName('MANU_PART_NUMBER').value;
      CdsRMain.Post;
    end;

    cbb_QCTestName.Text := CdsRMain.FieldByName('QCTestName').AsString;
    dtpQC.Date := CdsRMain.FieldByName('QCDate').AsDateTime;
    cbb_ClassNo.Text := CdsRMain.FieldByName('classNO').AsString;
    cbb_LayerNo.Text := CdsRMain.FieldByName('LayerNO').AsString;
    cbb_HDDesc.Text := CdsRMain.FieldByName('HDDesc').AsString;

  end;

end;

procedure TfrmBaseCheck_Mod705.InitData2(Ads: TClientDataSet);
var
  FField: TField;
begin

  CdsRMain.Append;
  for FField in CdsRMain.Fields do
  begin
    if IndexText(FField.FieldName, ['rkey']) <> -1 then
      Continue;
    if Ads.FindField(FField.FieldName) <> nil then
    begin
      FField.value := Ads.FindField(FField.FieldName).value;
    end;
  end;
  CdsRMain.FieldByName('IDKey').value := gfunc.CreateIDKey;;
  CdsRMain.Post;

  cdsModel.First;
  while not cdsModel.Eof do
  begin
    cdsRDetail.Append;
    cdsRDetail.FieldByName('M_IDKey').value :=
      CdsRMain.FieldByName('IDKey').value;
    // cdsRDetail.FieldByName('SEQNO').AsString := cdsModel.FieldByName('SEQNO').AsString;
    cdsRDetail.FieldByName('REJ_CODE').AsString :=
      cdsModel.FieldByName('REJ_CODE').AsString;
    cdsRDetail.FieldByName('REJECT_DESCRIPTION').value :=
      cdsModel.FieldByName('REJECT_DESCRIPTION').value;
    cdsRDetail.FieldByName('BugQty').value := 0;
    cdsRDetail.FieldByName('D39_ptr').value :=
      cdsModel.FieldByName('rkey').value;
    cdsModel.Next;
  end;
end;

function TfrmBaseCheck_Mod705.SaveToDB: Boolean;
var
  LData: OleVariant;
begin
  Result := false;

  if cdsRDetail.IsEmpty then
  begin
    ShowMessage('请录入明细资料！');
    exit;
  end;

  LData := VarArrayCreate([0, 1], varVariant);
  if CdsRMain.State in [dsEdit, dsInsert] then
    CdsRMain.Post;
  if cdsRDetail.State in [dsEdit, dsInsert] then
    cdsRDetail.Post;

  if CdsRMain.ChangeCount > 0 then
    LData[0] := CdsRMain.Delta;
  if cdsRDetail.ChangeCount > 0 then
    LData[1] := cdsRDetail.Delta;

  if gSvrIntf.IntfPostDataBySqlArr
    (VarArrayOf(['QC_ReportMain', 'QC_ReportDetail']), LData) then
  begin
    Result := True;
    CdsRMain.MergeChangeLog;
    cdsRDetail.MergeChangeLog;
  end;

end;

procedure TfrmBaseCheck_Mod705.edt_SideQtyExit(Sender: TObject);
begin
  inherited;
  // if Trim(edt_SideQty.Text)='' then exit;
  // if (Trim(edt_PBCount.Text)='')   then Exit;
  //
  // edt_AllQty.Text:= FloatToStr(StrToFloat(Trim(edt_PnlQty.Text))*StrToFloat(Trim(edt_PBCount.Text))) ;
  // edt_PnlQty.Text:= FloatToStr(StrToFloat(Trim(edt_PnlQty.Text))/2) ;
end;

procedure TfrmBaseCheck_Mod705.edt_SideQtyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key <> 13 then
    exit;
  edt_SideQtyExit(edt_SideQty);
end;

procedure TfrmBaseCheck_Mod705.edt_SideQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmBaseCheck_Mod705.edt_SPassQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmBaseCheck_Mod705.edt_PnlQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmBaseCheck_Mod705.edt_PPassQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

end.
