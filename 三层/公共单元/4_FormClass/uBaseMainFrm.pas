unit uBaseMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.XPMan, Data.DB, Datasnap.DBClient,
  Vcl.Menus, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uCommFunc, EhLibVCL, uBaseDBGridEhListFrm;

type
  TfrmBaseMain = class(TfrmBaseDBGridEhList)
    pmZD: TPopupMenu;
    xpmnfst1: TXPManifest;
    pmMain: TPopupMenu;
    cdsMainWhereInit: TClientDataSet;
    strngfldRetFieldName: TStringField;
    strngfldRetOper: TStringField;
    strngfldRetFieldValue: TStringField;
    intgrfldRetSeqNo: TIntegerField;
    pnlTopOperator: TPanel;
    lblFilter: TLabel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExportToExcel: TBitBtn;
    btnQry: TBitBtn;
    btnZD: TBitBtn;
    edtFliter: TEdit;
    btnDY: TBitBtn;
    btnAuthDispatch: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure btnZDClick(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure edtFliterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ehMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAuthDispatchClick(Sender: TObject);
  private
    { Private declarations }
    procedure ZDItemClick(Sender: TObject);

  public
    { Public declarations }
    FMainFrmSql: string;
    FMainWhere,FWhere2,FWhere3,FOrderby: string;
    FFilter2: string;
    FMainWhereID: Integer;
    FHotColumn: TColumnEh;
    procedure InLineInitUI;virtual;
    procedure BeforeGetData;virtual;
    procedure GetData;override;
    procedure AfterGetData;virtual;
    constructor Create(AParent: TWinControl;AModID: Integer);reintroduce;overload;
  end;

implementation

uses
  uBaseMainWhereFrm, uBaseDispachAuthFrm;

{$R *.dfm}

procedure TfrmBaseMain.AfterGetData;
begin

end;

procedure TfrmBaseMain.BeforeGetData;
begin

end;

procedure TfrmBaseMain.btnAuthDispatchClick(Sender: TObject);
var
  LSql: string;
  LCds: TClientDataSet;
  LFrm: TfrmBaseDispchAuth;
begin
  inherited;
  LSql := 'SELECT * FROM Tier3_UserModAuthCards WHERE ModID = ' + IntToStr(FModID) + ' and D73_Ptr = ' + gVar.rkey73;
  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      if LCds.IsEmpty then
      begin
        ShowMessage('您没有此模块委托授权的令牌');
        Exit;
      end;
    end else
      Exit;
  finally
    LCds.Free;
  end;

  LFrm := TfrmBaseDispchAuth.Create(Self);
  LFrm.FModID := FModID;
  try
    LFrm.GetData;
    LFrm.InLineInitUI;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBaseMain.btnExitClick(Sender: TObject);
begin
  inherited;
  pnlMain.Parent := Self;
  Close;
end;

procedure TfrmBaseMain.btnExportToExcelClick(Sender: TObject);
begin
  inherited;
  if MessageBox(Handle,'是否导出到EXCEL','提示',MB_YESNO) = IDYES then
  begin
    if not ehMain.DataSource.DataSet.IsEmpty then
    begin
      gFunc.Export_dbGridEH_to_Excel(ehMain);
    end else
      ShowMessage('导出数据为空');
  end;
end;

procedure TfrmBaseMain.btnQryClick(Sender: TObject);
var
  LFrm: TfrmMainWhere;
begin
  inherited;
  LFrm := TfrmMainWhere.Create(Self);
  try
    if not VarIsEmpty(cdsMainWhereInit.Data) then
      LFrm.cdsRet.Data := cdsMainWhereInit.Data;
    LFrm.GetData(FModID,FMainWhereID);
    if LFrm.ShowModal = mrOk then
    begin
      FMainWhere := LFrm.GetRetWhereSql;
      cdsMainWhereInit.Data := LFrm.cdsRet.Data;
      GetData;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBaseMain.btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmBaseMain.btnZDClick(Sender: TObject);
begin
  inherited;
  pmZD.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;


constructor TfrmBaseMain.Create(AParent: TWinControl; AModID: Integer);
begin
  inherited Create(Application);
  pnlMain.Parent := AParent;
  FModID := AModID;
  BeforeGetData;
  GetData;
  AfterGetData;
  InLineInitUI;
end;

procedure TfrmBaseMain.edtFliterChange(Sender: TObject);
var
  LFilter: string;
begin
  if VarType(cdsMain.Data) = varEmpty then Exit;
  LFilter := Trim(edtFliter.Text);

  if FHotColumn = nil then
    FHotColumn := ehMain.Columns[0];
  if Trim(LFilter) = '' then
  begin
    if FFilter2 <> '' then
    begin
      cdsMain.Filter := FFilter2;
      cdsMain.Filtered := True;
    end else
    begin
      cdsMain.Filter := '';
      cdsMain.Filtered := False;
    end;
  end else
  begin
    if FHotColumn.Field.DataType in [ftString, ftWideString, ftMemo] then
    begin
      if FFilter2 <> '' then
        cdsMain.Filter := FHotColumn.FieldName + ' like ' + QuotedStr('%' + LFilter + '%') + ' and ' + FFilter2
      else
        cdsMain.Filter := FHotColumn.FieldName + ' like ' + QuotedStr('%' + LFilter + '%');
      cdsMain.Filtered := True;
    end;
    // else
//    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftLargeint, ftAutoInc] then
//    begin
//      if FFilter2 <> '' then
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + LFilter + ' and ' + FFilter2
//      else
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + LFilter;
//      cdsMain.Filtered := True;
//    end else
//    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
//    begin
//      if FFilter2 <> '' then
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + QuotedStr(LFilter) + ' and ' + FFilter2
//      else
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + QuotedStr(LFilter);
//      cdsMain.Filtered := True;
//    end;
  end;
end;


procedure TfrmBaseMain.ehMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssAlt in Shift)  and  (Key=86) then
  begin
    showmessage(FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby);
  end;
end;

procedure TfrmBaseMain.ehMainTitleClick(Column: TColumnEh);
begin
  inherited;
  lblFilter.Caption := Column.Title.Caption;
  FHotColumn := Column;
end;

procedure TfrmBaseMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  LModFrmData: TModFrmInfo;
begin
  inherited;
  Action := caFree;
  if gActiveModList.TryGetValue(FModID,LModFrmData) then
  begin
    LModFrmData.ModTab.Free;
    gActiveModList.Remove(LModFrmData.ModID);
    gMainFrmModPageCtr.ActivePageIndex := 0;
  end;
end;
procedure TfrmBaseMain.FormCreate(Sender: TObject);
begin
  cdsMainWhereInit.CreateDataSet;
  inherited;
end;


procedure TfrmBaseMain.GetData;
var
  LSql: string;
begin
  cdsMain.IndexDefs.Update;
  if cdsMain.IndexDefs.IndexOf('MainDefIndex') >= 0 then
    cdsMain.DeleteIndex('MainDefIndex');

  if FMainFrmSql = '' then Exit;

  LSql := FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby;
  gSvrIntf.IntfGetDataBySql(LSql,cdsMain);
end;

procedure TfrmBaseMain.InLineInitUI;
var
  I: Integer;
  LItem: TMenuItem;
  //LSql: string;
  //LCds: TClientDataSet;
begin
  inherited;
  //显示列
  for I := 0 to ehMain.Columns.Count - 1 do
  begin
    LItem := TMenuItem.Create(pmZD);
    LItem.Caption := ehMain.Columns[I].Title.Caption;
    if ehMain.Columns[I].Visible then
      LItem.Checked := True;
    LItem.OnClick := ZDItemClick;
    pmZD.Items.Add(LItem);
    ehMain.Columns[I].ReadOnly := True;
  end;

  //
  if ehMain.Columns.Count > 0 then
  begin
    lblFilter.Caption := ehMain.Columns[0].Title.Caption;
    FHotColumn := ehMain.Columns[0];
  end;
    //ehMainTitleClick(ehMain.Columns[0]);

  //
  btnAuthDispatch.Visible := False;
  (*
  if btnAuthDispatch.Visible then
  begin
    LCds := TClientDataSet.Create(Self);
    LSql := ' SELECT 1 FROM Tier3_UserModAuthCards ' +
            ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
            ' WHERE ' +
            ' Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND ' +
            ' Tier3_UserModAuthCards.ModID = ' + IntToStr(FModID) + ' and Tier3_UserModAuthCards.D73_Ptr = ' + gVar.rkey73;
    try
      if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
      begin
        btnAuthDispatch.Visible := not LCds.IsEmpty;
      end;
    finally
      LCds.Free;
    end;
  end;
  *)
end;

procedure TfrmBaseMain.ZDItemClick(Sender: TObject);
var
  I: Integer;
  LItem: TMenuItem;
begin
  LItem := Sender as TMenuItem;
  LItem.Checked := not LItem.Checked;
  if LItem.Checked then
  begin
    for I := 0 to ehMain.Columns.Count - 1 do
    begin
      if ehMain.Columns[I].Title.Caption = LItem.Caption then
      begin
        ehMain.Columns[I].Visible := True;
        Break;
      end;
    end;
  end else
  begin
    for I := 0 to ehMain.Columns.Count - 1 do
    begin
      if ehMain.Columns[I].Title.Caption = LItem.Caption then
      begin
        ehMain.Columns[I].Visible := False;
        Break;
      end;
    end;
  end;
end;

end.
