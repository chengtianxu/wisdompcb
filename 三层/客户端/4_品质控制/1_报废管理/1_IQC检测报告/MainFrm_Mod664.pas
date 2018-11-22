unit MainFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod664 = class(TfrmBaseMain)
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniCheck: TMenuItem;
    mniDelete: TMenuItem;
    N1: TMenuItem;
    mniAuth: TMenuItem;
    mniUnAuth: TMenuItem;
    N2: TMenuItem;
    cbxStatus: TCheckBox;
    mniTongZhiDan: TMenuItem;
    mniTongBan: TMenuItem;
    mniDrill: TMenuItem;
    mniCheLiang: TMenuItem;
    mniGaoPingBan: TMenuItem;
    btnType: TBitBtn;
    pmDesign: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    mniAuthFalse: TMenuItem;
    mniBadRecord: TMenuItem;
    btnSum: TBitBtn;
    lbl1: TLabel;
    procedure cbxStatusClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniAuthClick(Sender: TObject);
    procedure mniUnAuthClick(Sender: TObject);
    procedure mniTongZhiDanClick(Sender: TObject);
    procedure mniTongBanClick(Sender: TObject);
    procedure mniDrillClick(Sender: TObject);
    procedure mniCheLiangClick(Sender: TObject);
    procedure mniGaoPingBanClick(Sender: TObject);
    procedure btnTypeClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnQryClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure mniAuthFalseClick(Sender: TObject);
    procedure mniBadRecordClick(Sender: TObject);
    procedure btnSumClick(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
  private
    { Private declarations }
    LEDate:TDateTime;
    function GetStatusWhere:string;
  public
    { Public declarations }
    procedure GetData;override;
    procedure RefreshAfterPostData(ACds:TClientDataSet);
  end;

var
  frmMain_Mod664: TfrmMain_Mod664;

implementation

uses  uCommFunc,system.DateUtils, DetailFrm_Mod664, ReportFrm_Mod664,
  ReportBindFrm_Mod664, ReasonFrm_Mod664, BadRecordFrm_Mod664;

{$R *.dfm}

{ TfrmMain_Mod664 }

procedure TfrmMain_Mod664.btnDYClick(Sender: TObject);
begin
  inherited;
  pmDesign.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain_Mod664.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0391.appl_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-3)) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1));
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '6';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod664.btnSumClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmMain_Mod664.btnTypeClick(Sender: TObject);
var
  LFrm: TfrmReportBind_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(7,664) then Exit;
  LFrm:= TfrmReportBind_Mod664.Create(nil);
  try
    LFrm.GetData;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.cbxStatusClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmMain_Mod664.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('status').AsInteger = 2 then
     ehMain.Canvas.Font.Color := clred;
  if cdsMain.FieldByName('status').AsInteger = 3 then
     ehMain.Canvas.Font.Color := clBlue;
  if not cdsMain.FieldByName('stock_over').AsBoolean then
    ehMain.Canvas.Brush.Color:= clMoneyGreen;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain_Mod664.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime;
    FMainWhere:= ' AND data0391.appl_date BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-7)))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
  end;
  FWhere2:= GetStatusWhere;
  FOrderby:= ' ORDER BY DATA0391.iqc_number DESC';
//  ShowMessage(FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby);
  inherited;
end;

function TfrmMain_Mod664.GetStatusWhere: string;
begin
  if cbxStatus.Checked then Result:= ''
  else Result:= ' AND DATA0391.STATUS = 1 ';
end;

procedure TfrmMain_Mod664.lbl1Click(Sender: TObject);
begin
  inherited;
  ShowMessage('界面中红色字体为IQC审核通过记录，蓝色字体为审核不合格记录；绿色背景为未入库记录');
end;

procedure TfrmMain_Mod664.mniAddClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,664) then Exit;
  if frmDetail_Mod664 = nil  then
  begin
    frmDetail_Mod664:= TfrmDetail_Mod664.Create(Self);
    frmDetail_Mod664.FAfterPost:= RefreshAfterPostData;
  end;
  frmDetail_Mod664.OpenType:= 0;
  frmDetail_Mod664.GetData('0');
  frmDetail_Mod664.Show;
end;

procedure TfrmMain_Mod664.mniAuthClick(Sender: TObject);
var
  LCds391,LCds71:TClientDataSet;
  LSql391,LSql71:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,664) then Exit;
  if MessageDlg('确定要审核合格吗？', mtWarning,[mbYes,mbNo],0) <>  mrYes then Exit;
  if (trim(cdsMain.FieldByName('judge_result').AsString) = '不合格') then
  begin
    ShowMessage('判定结果为不合格不能审核通过，请确认并修改后再试！');
    Exit;
  end;

  LSql391:= ' SELECT * FROM DATA0391 WHERE RKEY= '+ cdsMain.FieldByName('rkey').AsString;
  LSql71:= ' SELECT * FROM DATA0071 WHERE RKEY= ' + cdsMain.FieldByName('rkey71').AsString;
  LCds391:= TClientDataSet.Create(Self);
  LCds71:= TClientDataSet.Create(Self);
  try
    if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql391,LSql71]),[LCds391,LCds71]) then  exit;
    if LCds391.FieldByName('status').Value <> cdsMain.FieldByName('status').Value then
    begin
      ShowMessage('状态已经发生改变，可能多人同时操作！');
      Exit;
    end;

    LCds391.Edit;
    LCds391.FieldByName('status').Value:= 2;
    LCds391.FieldByName('auth_user_ptr').Value:= StrToInt(gVar.rkey05);
    LCds391.FieldByName('auth_date').Value:= gFunc.GetSvrDateTime();
    LCds391.FieldByName('judge_result').Value:= '合格';
    LCds391.FieldByName('appr_date').Value := LCds391.FieldByName('auth_date').Value ;
    LCds391.FieldByName('auth_user_ptr').Value:= StrToInt(gVar.rkey05);
    LCds391.Post;

    LCds71.Edit;
    LCds71.FieldByName('QUAN_IN_INSP').Value:= LCds71.FieldByName('QUAN_IN_INSP').Value + cdsMain.FieldByName('rece_qty').Value ;
    LCds71.FieldByName('printed_date').Value:= LCds391.FieldByName('auth_date').Value;
    LCds71.FieldByName('IQCEMPL_PTR').Value:= StrToInt(gVar.rkey05);
    LCds71.Post;

    LData:= VarArrayCreate([0,1],varVariant);
    if LCds391.ChangeCount > 0 then LData[0]:= LCds391.Delta;
    if LCds71.ChangeCount > 0 then LData[1]:= LCds71.Delta;
    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0391','data0071']),LData) then
    begin
      ShowMessage('审核合格成功！');
      LCds391.MergeChangeLog;
      LCds71.MergeChangeLog;
      btnRefreshClick(nil);
    end;
  finally
    LCds391.Free;
    LCds71.Free;
  end;
end;

procedure TfrmMain_Mod664.mniAuthFalseClick(Sender: TObject);
var
  LFrm:TfrmReason_Mod664;
  LCds391,LCds71:TClientDataSet;
  LSql391,LSql71:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,664) then Exit;
  if MessageDlg('确定要审核不合格吗？', mtWarning,[mbYes,mbNo],0) <>  mrYes then Exit;

  Lfrm:= TfrmReason_Mod664.Create(Application);
  try
    if LFrm.ShowModal = mrok then
    begin
      LSql391:= ' SELECT * FROM DATA0391 WHERE RKEY= '+ cdsMain.FieldByName('rkey').AsString;
      LSql71:= ' SELECT * FROM DATA0071 WHERE RKEY= ' + cdsMain.FieldByName('rkey71').AsString;
      LCds391:= TClientDataSet.Create(Self);
      LCds71:= TClientDataSet.Create(Self);
      try
        if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql391,LSql71]),[LCds391,LCds71]) then  exit;
        if LCds391.FieldByName('status').Value <> cdsMain.FieldByName('status').Value then
        begin
          ShowMessage('状态已经发生改变，可能多人同时操作！');
          Exit;
        end;
        LCds391.Edit;
        LCds391.FieldByName('status').Value:= 3;
        LCds391.FieldByName('auth_user_ptr').Value:= StrToInt(gVar.rkey05);
        LCds391.FieldByName('auth_date').Value:= gFunc.GetSvrDateTime();
        LCds391.FieldByName('judge_result').Value:= '不合格';
        LCds391.FieldByName('appr_date').Value := LCds391.FieldByName('auth_date').Value ;
        LCds391.FieldByName('auth_user_ptr').Value:= StrToInt(gVar.rkey05);
        LCds391.Post;

        LCds71.Edit;
        LCds71.FieldByName('QUAN_REJD').Value:= LCds71.FieldByName('QUAN_REJD').Value - cdsMain.FieldByName('rece_qty').Value ;
//        LCds71.FieldByName('printed_date').Value:= gFunc.GetSvrDateTime();
//        LCds71.FieldByName('IQCEMPL_PTR').Value:= StrToInt(gVar.rkey05);
        LCds71.Post;

        LData:= VarArrayCreate([0,1],varVariant);
        if LCds391.ChangeCount > 0 then LData[0]:= LCds391.Delta;
        if LCds71.ChangeCount > 0 then LData[1]:= LCds71.Delta;
        if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0391','data0071']),LData) then
        begin
          ShowMessage('审核不合格成功！');
          LCds391.MergeChangeLog;
          LCds71.MergeChangeLog;
          btnRefreshClick(nil);
        end;
      finally
        LCds391.Free;
        LCds71.Free;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniBadRecordClick(Sender: TObject);
var
  LFrm:TfrmBadRecord_Mod664;
begin
  inherited;
  Lfrm:=TfrmBadRecord_Mod664.Create(Application);
  try
    LFrm.GetData;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniCheckClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,664) then Exit;
  if frmDetail_Mod664 = nil  then
  begin
    frmDetail_Mod664:= TfrmDetail_Mod664.Create(Self);
    frmDetail_Mod664.FAfterPost:= RefreshAfterPostData;
  end;
  frmDetail_Mod664.OpenType:= 2;
  frmDetail_Mod664.GetData(cdsMain.FieldByName('rkey').AsString);
  frmDetail_Mod664.LoadData;
  frmDetail_Mod664.InitUi;
  frmDetail_Mod664.Show;
end;

procedure TfrmMain_Mod664.mniCheLiangClick(Sender: TObject);
var
  LFrm:TfrmReport_Mod664;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod664.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '来料检验测量报告.fr3';
    LFrm.repCheLiang.LoadFromFile(LFileName, true);
    Lfrm.repCheLiang.PrepareReport(True);
//    LFrm.repCheLiang.Print;
    LFrm.repCheLiang.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniDeleteClick(Sender: TObject);
var
  LCds391,LCds71:TClientDataSet;
  LSql391,LSql71:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,664) then Exit;
 if MessageDlg('确定要删除吗？', mtWarning,[mbYes,mbNo],0) <>  mrYes then Exit;

  LSql391:= ' SELECT * FROM DATA0391 WHERE RKEY= '+ cdsMain.FieldByName('rkey').AsString;
  LSql71:= ' SELECT * FROM DATA0071 WHERE RKEY= ' + cdsMain.FieldByName('rkey71').AsString;
  LCds391:= TClientDataSet.Create(Self);
  LCds71:= TClientDataSet.Create(Self);
  try
    if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql391,LSql71]),[LCds391,LCds71]) then  exit;
    LCds391.Delete;
    LCds71.Edit;
    LCds71.FieldByName('QUAN_REJD').Value:= LCds71.FieldByName('QUAN_REJD').Value - cdsMain.FieldByName('rece_qty').Value ;
    LCds71.Post;

    LData:= VarArrayCreate([0,1],varVariant);
    if LCds391.ChangeCount > 0 then LData[0]:= LCds391.Delta;
    if LCds71.ChangeCount > 0 then LData[1]:= LCds71.Delta;
    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0391','data0071']),LData) then
    begin
      ShowMessage('删除成功！');
      LCds391.MergeChangeLog;
      LCds71.MergeChangeLog;
      btnRefreshClick(nil);
    end;
  finally
    LCds391.Free;
    LCds71.Free;
  end;
end;

procedure TfrmMain_Mod664.mniDrillClick(Sender: TObject);
var
  LFrm:TfrmReport_Mod664;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod664.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '钻咀锣刀检验测量报告.fr3';
    LFrm.repDrill.LoadFromFile(LFileName, true);
    Lfrm.repDrill.PrepareReport(True);
//    LFrm.repDrill.Print;
    LFrm.repDrill.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,664) then Exit;
  if frmDetail_Mod664 = nil  then
  begin
    frmDetail_Mod664:= TfrmDetail_Mod664.Create(Self);
    frmDetail_Mod664.FAfterPost:= RefreshAfterPostData;
  end;
  frmDetail_Mod664.OpenType:= 1;
  frmDetail_Mod664.GetData(cdsMain.FieldByName('rkey').AsString);
  frmDetail_Mod664.LoadData;
  frmDetail_Mod664.InitUi;
  frmDetail_Mod664.Show;
end;

procedure TfrmMain_Mod664.mniGaoPingBanClick(Sender: TObject);
var
  LFrm:TfrmReport_Mod664;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod664.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '高频板来料检验报告.fr3';
    LFrm.repGaoPingBan.LoadFromFile(LFileName, true);
    Lfrm.repGaoPingBan.PrepareReport(True);
//    LFrm.repGaoPingBan.Print;
    LFrm.repGaoPingBan.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniTongBanClick(Sender: TObject);
var
  LFrm:TfrmReport_Mod664;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod664.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '铜板来料检验报告.fr3';
    LFrm.repTongBan.LoadFromFile(LFileName, true);
    Lfrm.repTongBan.PrepareReport(True);
//    LFrm.repTongBan.Print;
    LFrm.repTongBan.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniTongZhiDanClick(Sender: TObject);
var
  LFrm:TfrmReport_Mod664;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod664.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '物料检验通知单.fr3';
    LFrm.repTongZhiDan.LoadFromFile(LFileName, true);
    Lfrm.repTongZhiDan.PrepareReport(True);
    LFrm.repTongZhiDan.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.mniUnAuthClick(Sender: TObject);
var
  LCds391,LCds71:TClientDataSet;
  LSql391,LSql71:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(6,664) then Exit;
  if MessageDlg('确定要退回审核吗？', mtWarning,[mbYes,mbNo],0) <>  mrYes then Exit;

  LSql391:= ' SELECT * FROM DATA0391 WHERE RKEY= '+ cdsMain.FieldByName('rkey').AsString;
  LSql71:= ' SELECT * FROM DATA0071 WHERE RKEY= ' + cdsMain.FieldByName('rkey71').AsString;
  LCds391:= TClientDataSet.Create(Self);
  LCds71:= TClientDataSet.Create(Self);
  try
    if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql391,LSql71]),[LCds391,LCds71]) then  exit;
//    if (LCds71.FieldByName('QUAN_IN_INSP').AsCurrency - cdsMain.FieldByName('rece_qty').AsCurrency) < LCds71.FieldByName('QUAN_RECD').AsCurrency  then
    if LCds391.FieldByName('stock_over').Value then
    begin
      ShowMessage('材料已入仓不能退回审核');
      Exit;
    end;
    if LCds391.FieldByName('status').Value <> cdsMain.FieldByName('status').Value then
    begin
      ShowMessage('状态已经发生改变，可能多人同时操作！');
      Exit;
    end;

    LCds71.Edit;
    if LCds391.FieldByName('status').Value = 2 then
      LCds71.FieldByName('QUAN_IN_INSP').Value:= LCds71.FieldByName('QUAN_IN_INSP').Value - cdsMain.FieldByName('rece_qty').Value
    else if LCds391.FieldByName('status').Value = 3 then
      LCds71.FieldByName('QUAN_REJD').Value:= LCds71.FieldByName('QUAN_REJD').Value + cdsMain.FieldByName('rece_qty').Value;
    LCds71.FieldByName('printed_date').AsVariant:= null;
    LCds71.FieldByName('IQCEMPL_PTR').AsVariant:= null;
    LCds71.Post;

    LCds391.Edit;
    LCds391.FieldByName('status').Value:= 1;
    LCds391.FieldByName('auth_user_ptr').Value:= StrToInt(gVar.rkey05);
    LCds391.FieldByName('auth_date').Value:= gFunc.GetSvrDateTime();
    LCds391.Post;

    LData:= VarArrayCreate([0,1],varVariant);
    if LCds391.ChangeCount > 0 then LData[0]:= LCds391.Delta;
    if LCds71.ChangeCount > 0 then LData[1]:= LCds71.Delta;
    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0391','data0071']),LData) then
    begin
      ShowMessage('退回审核成功！');
      LCds391.MergeChangeLog;
      LCds71.MergeChangeLog;
      btnRefreshClick(nil);
    end;
  finally
    LCds391.Free;
    LCds71.Free;
  end;
end;

procedure TfrmMain_Mod664.N3Click(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReport_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,664) then Exit;
  LFrm:= TfrmReport_Mod664.Create(nil);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '物料检验通知单.fr3';
    LFrm.repTongZhiDan.LoadFromFile(LFileName);
    LFrm.repTongZhiDan.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.N4Click(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReport_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,664) then Exit;
  LFrm:= TfrmReport_Mod664.Create(nil);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '铜板来料检验报告.fr3';
    LFrm.repTongBan.LoadFromFile(LFileName);
    LFrm.repTongBan.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.N5Click(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReport_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,664) then Exit;
  LFrm:= TfrmReport_Mod664.Create(nil);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '钻咀锣刀检验测量报告.fr3';
    LFrm.repDrill.LoadFromFile(LFileName);
    LFrm.repDrill.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.N6Click(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReport_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,664) then Exit;
  LFrm:= TfrmReport_Mod664.Create(nil);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '来料检验测量报告.fr3';
    LFrm.repCheLiang.LoadFromFile(LFileName);
    LFrm.repCheLiang.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.N7Click(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReport_Mod664;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,664) then Exit;
  LFrm:= TfrmReport_Mod664.Create(nil);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\品质控制_报废管理\', [rfReplaceAll]) +
      '高频板来料检验报告.fr3';
    LFrm.repGaoPingBan.LoadFromFile(LFileName);
    LFrm.repGaoPingBan.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod664.pmMainPopup(Sender: TObject);
var
  LRName,LSql:string;
  LCds:TClientDataSet;
  i:Integer;
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    for i:= 0 to pmMain.Items.Count - 1 do
    begin
      if i= 8 then  Continue;
      if i > 0 then
      pmMain.Items[i].Visible:= False;
    end;
  end
  else
  begin
    for i:= 0 to pmMain.Items.Count - 1 do
    begin
      pmMain.Items[i].Visible:= True;
    end;
    mniAuth.Enabled:= cdsMain.FieldByName('status').AsInteger = 1;
    mniAuthFalse.Enabled:=  cdsMain.FieldByName('status').AsInteger = 1;
    mniUnAuth.Enabled:= (cdsMain.FieldByName('status').AsInteger = 2) or (cdsMain.FieldByName('status').AsInteger = 3);
    mniEdit.Enabled:= cdsMain.FieldByName('status').AsInteger = 1;
    mniDelete.Enabled:= cdsMain.FieldByName('status').AsInteger = 1;
    LRName:= '';
    LSql:= 'SELECT rkey496,reportname_e FROM data0395 WHERE rkey496=' + cdsMain.FieldByName('GROUP_PTR').AsString;
    LCds:= TClientDataSet.Create(Self);
    try                                 // 钻咀锣刀检验测量报告.fr3
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        LRName:= Trim(LCds.FieldByName('reportname_e').AsString);
        mniTongBan.Visible:= (uppercase(LRName)=uppercase((Sender as TPopupMenu).Items[11].Hint));
        mniDrill.Visible:= (uppercase(LRName)=uppercase((Sender as TPopupMenu).Items[12].Hint));
        mniCheLiang.Visible:= (uppercase(LRName)=uppercase((Sender as TPopupMenu).Items[13].Hint));
        mniGaoPingBan.Visible:= (uppercase(LRName)=uppercase((Sender as TPopupMenu).Items[14].Hint));
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmMain_Mod664.RefreshAfterPostData(ACds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

end.
