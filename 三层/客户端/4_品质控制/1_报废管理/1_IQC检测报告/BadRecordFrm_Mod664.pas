unit BadRecordFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmBadRecord_Mod664 = class(TfrmBaseMain)
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniCheck: TMenuItem;
    mniDel: TMenuItem;
    N2: TMenuItem;
    mniDone: TMenuItem;
    procedure btnQryClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniDoneClick(Sender: TObject);
  private
    LEDate:TDateTime;
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmBadRecord_Mod664: TfrmBadRecord_Mod664;

implementation

uses
  uCommFunc,System.DateUtils, BadDetail_Mod664;

{$R *.dfm}

{ TfrmBadRecord_Mod664 }

procedure TfrmBadRecord_Mod664.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'QC_IQCBadRecord.DiscoverDate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-3)) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1));
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  FMainWhereID:=1;
  inherited;
end;

procedure TfrmBadRecord_Mod664.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 1 then
     ehMain.Canvas.Font.Color := clred;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmBadRecord_Mod664.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime;
    FMainWhere:= ' AND QC_IQCBadRecord.DiscoverDate BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncMonth(LEDate,-3)))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
  end;
  FOrderby:= ' ORDER BY QC_IQCBadRecord.DiscoverDate DESC';
//  ShowMessage(FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby);
  inherited;
end;

procedure TfrmBadRecord_Mod664.mniAddClick(Sender: TObject);
var
  LFrm:TFrmBadDetail_Mod664;
begin
  inherited;
  LFrm:= TFrmBadDetail_Mod664.Create(Application);
  try
    LFrm.GetData('0');
    LFrm.InitData;
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;

  finally
    LFrm.Free;
  end;
end;

procedure TfrmBadRecord_Mod664.mniCheckClick(Sender: TObject);
var
  LFrm:TFrmBadDetail_Mod664;
begin
  inherited;
  LFrm:= TFrmBadDetail_Mod664.Create(Application);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFrm.InitUi;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBadRecord_Mod664.mniEditClick(Sender: TObject);
var
  LFrm:TFrmBadDetail_Mod664;
begin
  inherited;
  LFrm:= TFrmBadDetail_Mod664.Create(Application);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBadRecord_Mod664.mniDelClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if MessageDlg('确定要删除记录吗？',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    LSql:= 'SELECT * FROM QC_IQCBadRecord WHERE RKEY= ' + cdsMain.FieldByName('rkey').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        LCds.Delete;
        if gSvrIntf.IntfPostDataByTable('QC_IQCBadRecord',LCds.Delta) then
        begin
          LCds.MergeChangeLog;
          ShowMessage('删除成功！');
        end
        else ShowMessage('删除失败！');
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmBadRecord_Mod664.mniDoneClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if MessageDlg('确定要完成吗？', mtWarning, [mbYes,mbNo],0) = mrYes then
  begin
    LSql:= 'SELECT * FROM QC_IQCBadRecord WHERE RKEY= ' + cdsMain.FieldByName('rkey').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        if LCds.FieldByName('status').Value <> cdsMain.FieldByName('status').Value then
        begin
          ShowMessage('状态已经发生改变，可能多人同时操作！');
          Exit;
        end;
        LCds.Edit;
        LCds.FieldByName('status').Value:= 1;
        LCds.FieldByName('ModiDate').Value:= gFunc.GetSvrDateTime;
        LCds.Post;
        if gSvrIntf.IntfPostDataByTable('QC_IQCBadRecord',LCds.Delta) then
        begin
          LCds.MergeChangeLog;
          ShowMessage('操作成功！');
        end
        else ShowMessage('操作失败！');
      end;
    finally
      LCds.Free;
    end;
  end;

end;

procedure TfrmBadRecord_Mod664.pmMainPopup(Sender: TObject);
begin
  inherited;
  mniEdit.Enabled:= (not cdsMain.IsEmpty)and (cdsMain.FieldByName('status').Value=0);
  mniCheck.Enabled:= (not cdsMain.IsEmpty);
  mniDel.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').Value=0);
  mniDone.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').Value=0);
end;

end.
