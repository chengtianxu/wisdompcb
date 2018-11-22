unit MainFrm_Mod599;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod599 = class(TfrmBaseMain)
    Panel1: TPanel;
    ehDetail: TDBGridEh;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NAuth: TMenuItem;
    NDel: TMenuItem;
    N1: TMenuItem;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure btnQryClick(Sender: TObject);
    procedure NAddClick(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure NAuthClick(Sender: TObject);
  private
    { Private declarations }
    LEDate:TDateTime;

  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmMain_Mod599: TfrmMain_Mod599;

implementation

uses uCommFunc, ModifyFrm_Mod599,System.DateUtils;

{$R *.dfm}

{ TfrmMain_Mod599 }

procedure TfrmMain_Mod599.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'D174.proposer_Date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-15)) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1));
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod599.cdsMainAfterScroll(DataSet: TDataSet);
var
  LSql:string;
begin
  inherited;
  if DataSet.IsEmpty then
  begin
    cdsDetail.Active:= False;
    Exit;
  end
  else
  begin
    LSql:= cdsDetail.CommandText + ' WHERE rkey174 = ' + IntToStr(cdsMain.FieldByName('rkey174').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cdsDetail) then Exit;
  end;
end;

procedure TfrmMain_Mod599.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime(dtdate);
    FMainWhere:= ' AND D174.proposer_Date BETWEEN '
          + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-15)))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
  end;
  FOrderby:= 'ORDER BY D174.RKEY,D60.SALES_ORDER';
  inherited;
end;

procedure TfrmMain_Mod599.NAddClick(Sender: TObject);
var
  LFrm:TfrmModify_Mod599;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,599) then  exit;
  LFrm:= TfrmModify_Mod599.Create(nil);
  try
    LFrm.FDetailType:= 0;
    LFrm.GetData(0);
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod599.NAuthClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
  LDataPost:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,599) then  exit;
  LSql:= 'SELECT status FROM DATA0174 WHERE RKEY = ' + cdsMain.FieldByName('rkey174').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      if not LCds.IsEmpty then
      begin
        if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
        begin
          ShowMessage('状态发生改变，可能多人同时操作！');
          Exit;
        end;
      end;
    end
    else
    begin
      ShowMessage('取得数据失败，请重试');
      Exit;
    end;
    if MessageDlg('你确定要审核些记录吗？', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      LDataPost:= VarArrayCreate([0,2],varVariant);
//      LDataPost[0]:= cdsMain.FieldByName('rkey174').Value;
//      LDataPost[1]:= StrToInt(gVar.rkey73);
//      LDataPost[0]:= cdsMain.FieldByName('rkey174').Value;
      LDataPost[1]:= cdsMain.FieldByName('rkey174').Value;
      LDataPost[2]:= StrToInt(gVar.rkey73);
      if gSvrIntf.IntfspExec('PROC175',LDataPost) then
      begin
        ShowMessage('审核成功！');
        btnRefreshClick(nil);
      end
      else
      begin
        ShowMessage('审核失败！');
      end;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod599.NDelClick(Sender: TObject);
var
  LSql,LSql174,LSql175:string;
  LCds,LCds174,LCds175:TClientDataSet;
  LDataPost:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,599) then  exit;
  LSql174:= 'SELECT * FROM Data0174 where rkey = ' + cdsMain.FieldByName('rkey174').AsString;
  LSql175:= 'SELECT * FROM Data0175 where rkey174 = ' + cdsMain.FieldByName('rkey174').AsString;
  LSql:= 'select 1 from data0174 where status = 2 and rkey ' + cdsMain.FieldByName('rkey174').AsString;
  LCds:= TClientDataSet.Create(nil);
  LCds174:= TClientDataSet.Create(nil);
  LCds175:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql175,LSql174]),[LCds,LCds175,LCds174]) then
    begin
      ShowMessage('取得数据失败，请重试');
      exit;
    end;
    if not LCds.IsEmpty then
    begin
      ShowMessage('状态发生改变，可能多人同时操作');
      exit;
    end;
    if not LCds175.IsEmpty then
      while not LCds175.Eof do LCds175.Delete;
    if not LCds174.IsEmpty then  LCds174.Delete;

    LDataPost:= VarArrayCreate([0,1],varVariant);
    if LCds175.ChangeCount > 0 then LDataPost[0]:= LCds175.Delta;
    if LCds174.ChangeCount > 0 then LDataPost[1]:= LCds174.Delta;
    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['DATA0175','DATA0174']),LDataPost) then
    begin
      ShowMessage('删除成功！');
      btnRefreshClick(nil);
    end
    else
    begin
      ShowMessage('删除失败，请重试');
    end;
  finally
    LCds174.Free;
    LCds175.Free;
  end;

end;

procedure TfrmMain_Mod599.NEditClick(Sender: TObject);
var
  LFrm:TfrmModify_Mod599;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,599) then  exit;
  LFrm:= TfrmModify_Mod599.Create(nil);
  try
    LFrm.FDetailType:= 1;
    LFrm.GetData(cdsMain.FieldByName('rkey174').AsInteger);
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod599.pmMainPopup(Sender: TObject);
begin
  inherited;
  NEdit.Enabled:= not cdsMain.IsEmpty AND cdsMain.FieldByName('status').Value = 0;
  NAuth.Enabled:= (not cdsMain.IsEmpty) AND cdsMain.FieldByName('status').Value = 0;
  NDel.Enabled:= not cdsMain.IsEmpty AND cdsMain.FieldByName('status').Value = 0;
end;

end.
