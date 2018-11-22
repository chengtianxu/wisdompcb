unit Mainfrm_Mod705CheckMrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB, RzTabs,
  BaseCheck_Mod705;

type
  TFrmMain_Mod705CheckMrg = class(TfrmBaseMain)
    pnl2: TPanel;
    pnl4: TPanel;
    qry1: TADOQuery;
    cdsMMain: TClientDataSet;
    dsMMain: TDataSource;
    qry1ID: TIntegerField;
    qry1TypeName: TStringField;
    qry1TypeDesc: TStringField;
    pgcPackPrint: TRzPageControl;
    N_ModelMrg: TMenuItem;
    mniN_RecordMrg: TMenuItem;
    mni_Report: TMenuItem;
    procedure ehRDetailDblClick(Sender: TObject);
    procedure N_ModelMrgClick(Sender: TObject);
    procedure mniN_RecordMrgClick(Sender: TObject);
    procedure pgcPackPrintClose(Sender: TObject; var AllowClose: Boolean);
    procedure mni_ReportClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function GetQCFrm(ATypeName: string; AOwner: TControl)
      : TfrmBaseCheck_Mod705;
  public
    { Public declarations }
    procedure GetData; override;
  end;

var
  FrmMain_Mod705CheckMrg: TFrmMain_Mod705CheckMrg;

implementation

uses CheckMrg_705FQC1, CheckMrg_705FQC2, CheckModeledit_705,
  uCommFunc,CheckRecordMrg_705,CheckRecordReport_705,Check_705Electron1,Check_705Electron2,
  CheckMrg_705InnerAOI1,CheckMrg_705InnerAOI2,CheckMrg_705OuterAOI1,CheckMrg_705OuterAOI2,CheckMrg_705SecOuterAOI2,
  CheckMrg_705InnerAOI_MZ,CheckMrg_705OuterAOI_MZ,CheckMrg_705SecOuterAOI_MZ ;
{$R *.dfm}
{ TFrmMain_Mod705FQCCheckMrg }

procedure TFrmMain_Mod705CheckMrg.ehRDetailDblClick(Sender: TObject);
var
  LTS: TRZTabSheet;
  I: Integer;
  LFrm: TfrmBaseCheck_Mod705;
begin
  inherited;
  if not cdsMain.IsEmpty then
  begin
    for I := 0 to pgcPackPrint.PageCount - 1 do
    begin
      if pgcPackPrint.Pages[I].Caption = cdsMain.FieldByName('TypeName').AsString
      then
      begin
        pgcPackPrint.ActivePageIndex := I;
        Exit;
      end;
    end;

    LTS := TRZTabSheet.Create(pgcPackPrint);
    LTS.PageIndex := pgcPackPrint.PageCount;
    LTS.Caption := cdsMain.FieldByName('TypeName').AsString;
    LTS.PageControl := pgcPackPrint;


      LFrm := GetQCFrm(LTS.Caption, LTS);

    if LFrm = nil then
    begin
      ShowMessage('不支持该部门的检测结果录入.');
      LTS.Free;
      Exit;
    end;
    LTS.Data := LFrm;
    LFrm.FModID := FModID;
    LFrm.FModelID := cdsMain.FieldByName('ID').asinteger;
    LFrm.Pnldisplay.Parent := LTS;
    LFrm.Pnldisplay.Visible := True;
    LFrm.InitModel(cdsMain.FieldByName('ID').asinteger,1,'');
    if LFrm.cbb_QCTestName.Items.Count>1 then
    LFrm.cbb_QCTestName.ItemIndex:=0;
    pgcPackPrint.ActivePage := LTS;

  end;
end;

procedure TFrmMain_Mod705CheckMrg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    FrmMain_Mod705CheckMrg := nil;
end;

procedure TFrmMain_Mod705CheckMrg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift )  and  (key=19) then     //     and  (key= 19) then     //
  //btn_SaveClick(btn_Save);
  showmessage('test');

end;

procedure TFrmMain_Mod705CheckMrg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if (Key = #13)  then
      begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
end;

function TFrmMain_Mod705CheckMrg.GetQCFrm(ATypeName: string; AOwner: TControl)
  : TfrmBaseCheck_Mod705;
begin
//Result := TFrmCheckMrg_FQC1.Create(AOwner);

 if (ATypeName = '1厂FQC') and (gFunc.CheckUserAuth(1,705) ) then
  begin
    Result := TFrmCheckMrg_705FQC1.Create(AOwner);
  end
  else if (ATypeName = '2厂FQC') and (gFunc.CheckUserAuth(2,705) ) then
  begin
    Result := TFrmCheckMrg_705FQC2.Create(AOwner);
  end
  else if (ATypeName = '1厂电测') and (gFunc.CheckUserAuth(3,705) ) then
  begin
    Result := TfrmCheck_705Eelctron1.Create(AOwner);
  end
  else if (ATypeName = '2厂电测') and (gFunc.CheckUserAuth(4,705) ) then
  begin
    Result := TFrmCheck_705Electron2.Create(AOwner);
  end
  else if (ATypeName = '1厂内层AOI') and (gFunc.CheckUserAuth(5,705) ) then
  begin
     Result := TfrmCheckMrg_705InnerAOI1.Create(AOwner);
  end
  else if (ATypeName = '1厂外层AOI') and (gFunc.CheckUserAuth(6,705) ) then
  begin
     Result := TFrmCheckMrg_705OuterAOI1.Create(AOwner);
  end
    else if (ATypeName = '2厂内层AOI') and (gFunc.CheckUserAuth(7,705) ) then
  begin
     Result := TfrmCheckMrg_705InnerAOI2.Create(AOwner);
  end
  else if (ATypeName = '2厂外层AOI') and (gFunc.CheckUserAuth(8,705) ) then
  begin
     Result := TFrmCheckMrg_705OuterAOI2.Create(AOwner);
  end
   else if (ATypeName = '2厂次外层AOI') and (gFunc.CheckUserAuth(9,705) ) then
  begin
     Result := TFrmCheckMrg_705SecOuterAOI2.Create(AOwner);
  end
  //梅州的：
  else if (ATypeName = '志浩FQC') and (gFunc.CheckUserAuth(1,705) ) then
  begin
    Result := TFrmCheckMrg_705FQC1.Create(AOwner);
  end
  else if (ATypeName = '志浩电测') and (gFunc.CheckUserAuth(2,705) ) then
  begin
    Result :=TfrmCheck_705Eelctron1.Create(AOwner);
  end
   else if (ATypeName = '志浩内层AOI') and (gFunc.CheckUserAuth(3,705) ) then
  begin
    Result :=TfrmCheckMrg_705InnerAOI_MZ.Create(AOwner);
  end
   else if (ATypeName = '志浩外层AOI') and (gFunc.CheckUserAuth(4,705) ) then
  begin
    Result :=TFrmCheckMrg_705OuterAOI_MZ.Create(AOwner);
  end
  else if (ATypeName = '志浩次外层AOI') and (gFunc.CheckUserAuth(5,705) ) then
  begin
     Result := TFrmCheckMrg_705SecOuterAOI_MZ.Create(AOwner);
  end
  else
    Result := nil;
end;

procedure TFrmMain_Mod705CheckMrg.mni_ReportClick(Sender: TObject);
begin
  inherited;
 if  (not gFunc.CheckUserAuth(999,705)) then Exit;

    if FrmCheckRecordReport_705 = nil then
    FrmCheckRecordReport_705 := TFrmCheckRecordReport_705.Create(Application);
  FrmCheckRecordReport_705.FModelID := cdsMain.FieldByName('ID').AsInteger;
  FrmCheckRecordReport_705.FTypeName := cdsMain.FieldByName('TypeName').asstring;
  FrmCheckRecordReport_705.FModID := FModID;
  FrmCheckRecordReport_705.Show;
end;

procedure TFrmMain_Mod705CheckMrg.mniN_RecordMrgClick(Sender: TObject);
begin
  inherited;

   if  (not gFunc.CheckUserAuth(999,705)) then Exit;

  if FrmCheckRecordMrg_705 = nil then
  FrmCheckRecordMrg_705 := TFrmCheckRecordMrg_705.Create(Application);
  FrmCheckRecordMrg_705.FModelID := cdsMain.FieldByName('ID').AsInteger;
  FrmCheckRecordMrg_705.FTestName := cdsMain.FieldByName('TypeName').asstring;
  FrmCheckRecordMrg_705.FModID := FModID;
  FrmCheckRecordMrg_705.GetData;
  FrmCheckRecordMrg_705.Show;
end;


procedure TFrmMain_Mod705CheckMrg.GetData;
begin
  FMainFrmSql := 'select   * from dbo.QC_DeptBugDef ';
  FOrderby := ' ORDER BY ID asc';
  inherited;
end;

procedure TFrmMain_Mod705CheckMrg.N_ModelMrgClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(0,705) then Exit;

  if frmCheckModeledit_705 = nil then
    frmCheckModeledit_705 := TfrmCheckModeledit_705.Create(Self);

  frmCheckModeledit_705.FModelID := cdsMain.FieldByName('ID').AsInteger;
  frmCheckModeledit_705.GetData;
  frmCheckModeledit_705.Show;
end;


procedure TFrmMain_Mod705CheckMrg.pgcPackPrintClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  inherited;
 AllowClose := True;
end;

end.
