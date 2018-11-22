unit MainFrm_Mod525;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzTabs, frxClass, RzCmboBx, Vcl.Printers,
  frxDesgn, frxBarcode, frxBarcode2D, frxDBSet, BasePackPrintFrm_525;

type
  TfrmMainMod_525 = class(TfrmBaseMain)
    pnl1: TPanel;
    pgcPackPrint: TRzPageControl;
    pnl2: TPanel;
    lbl1: TLabel;
    cbxPrinter: TRzComboBox;
    mniDesignTag: TMenuItem;
    mniPrintHistory: TMenuItem;
    procedure ehMainDblClick(Sender: TObject);
    procedure pgcPackPrintClose(Sender: TObject; var AllowClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure mniDesignTagClick(Sender: TObject);
    procedure mniPrintHistoryClick(Sender: TObject);
  private
    { Private declarations }
    function GetPackPrintFrm(AReportFile: string;AOwner: TControl): TfrmBasePackPrint_525;
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmMainMod_525: TfrmMainMod_525;

implementation

uses
  PackPrintFrm_HWJS, PackPrintFrm_SanDiHOTYI, PackPrintfrm_SanDiDaYan,
  PackPrintFrm_SanDiSDSM, uCommFunc, PackPrintEditFrn_525, PackPrintHisFrm_525,
  PackPrintFrm_Common, PackPrintFrm_FanGuDaDi;

{$R *.dfm}

function TfrmMainMod_525.GetPackPrintFrm(AReportFile: string;AOwner: TControl): TfrmBasePackPrint_525;
begin
  if (AReportFile = '闪迪HOTAYI_外箱') or (AReportFile = '闪迪HOTAYI_内箱') then
  begin
    Result := TfrmPackReportFrm_SanDiHOTYI.Create(AOwner);
  end else
  if (AReportFile = '闪迪达研_外箱') or (AReportFile = '闪迪达研_内箱') then
  begin
    Result := TfrmPackPrint_SanDiDaYan.Create(AOwner);
  end else
  if (AReportFile = '闪迪SDSM_外箱') or (AReportFile = '闪迪SDSM_内箱') then
  begin
    Result := TfrmPackPrint_SanDiSDSM.Create(AOwner);
  end else
  if (AReportFile = '通用_内箱') or (AReportFile = '通用_外箱') then
  begin
    Result := tfrmpackprint_common.Create(AOwner);
  end else
  if (AReportFile = '凡谷大地_内箱') or (AReportFile = '凡谷大地_外箱') then
  begin
    Result := TfrmPackPrint_FanGuDaDi.Create(AOwner);
  end else
    Result := nil;
  if Result <> nil then
  begin
    Result.FPackType := cdsMain.FieldByName('PackType').AsInteger;
    Result.frxDBDataset1.UserName := AReportFile + '.frxDBDataSet1';
    //Result.frxReport1.DataSets.Clear;
    //Result.frxReport1.DataSets.Add(Result.frxDBDataset1);
  end;
end;


{ TfrmMainMod_525 }

procedure TfrmMainMod_525.btnDYClick(Sender: TObject);
var
  I: Integer;
  bFind: Boolean;
  LFrm: TfrmBasePackPrint_525;
begin
  inherited;
  if not gFunc.CheckUserAuth(100,FModID) then Exit;

  bFind := False;
  LFrm := nil;
  for I := 0 to pgcPackPrint.PageCount - 1 do
  begin
    if pgcPackPrint.Pages[I].Caption = cdsMain.FieldByName('reportfile').AsString then
    begin
      LFrm := pgcPackPrint.Pages[I].Data;
      bFind := True;
      Break;
    end;
  end;

  if bFind then
  begin
    LFrm.DesignReportFile;
  end else
  begin
    ShowMessage('请先进入该标签的页面在进行设计');
  end;

//  frxReport1.Clear;
//  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Reports\库存管理_成品进出\新包装标签打印\' + cdsMain.FieldByName('reportfile').AsString + '.fr3');
//  frxReport1.DesignReport();
end;

procedure TfrmMainMod_525.ehMainDblClick(Sender: TObject);
var
  LTS: TRZTabSheet;
  I: Integer;
  LFrm: TfrmBasePackPrint_525;
begin
  inherited;
  if not cdsMain.IsEmpty then
  begin
    for I := 0 to pgcPackPrint.PageCount - 1 do
    begin
      if pgcPackPrint.Pages[I].Caption = cdsMain.FieldByName('reportfile').AsString then
      begin
        pgcPackPrint.ActivePageIndex := I;
        Exit;
      end;
    end;

    LTS := TRZTabSheet.Create(pgcPackPrint);
    LTS.PageIndex := pgcPackPrint.PageCount;
    LTS.Caption := cdsMain.FieldByName('reportfile').AsString;
    LTS.PageControl := pgcPackPrint;

    LFrm := GetPackPrintFrm(LTS.Caption,LTS);
    if LFrm = nil then
    begin
      ShowMessage('不支持该格式的标签');
      LTS.Free;
      Exit;
    end;
    LTS.Data := LFrm;
    LFrm.FModID := FModID;
    LFrm.Pnldisplay.Parent := LTS;
    LFrm.pnlDisplay.Visible := True;
    LFrm.InitPack(cdsMain.FieldByName('PackID').AsInteger);
    LFrm.FPrinterCBX := cbxPrinter;
    LFrm.FReportFile := ExtractFilePath(ParamStr(0)) + 'Reports\库存管理_成品进出\新包装标签打印\' + cdsMain.FieldByName('reportfile').AsString + '.fr3';

//    LFrm.pnlPackIDScan.Visible := cdsMain.FieldByName('PackType').AsInteger = 1;
//    LFrm.lbl4.Visible := cdsMain.FieldByName('PackType').AsInteger = 1;
//    lfrm.edtMaxPCSNum.Visible := cdsMain.FieldByName('PackType').AsInteger = 1;
//
//    LFrm.edtCreateNum.Visible := cdsMain.FieldByName('PackType').AsInteger <> 1;
//    LFrm.lbl1.Visible := cdsMain.FieldByName('PackType').AsInteger <> 1;
//    LFrm.pnlScanWO.Visible := cdsMain.FieldByName('PackType').AsInteger <> 1;

    pgcPackPrint.ActivePage := LTS;
    LTS.SetFocus;

  end;
end;

procedure TfrmMainMod_525.FormCreate(Sender: TObject);
begin
  inherited;
  cbxPrinter.Items.Assign(Vcl.Printers.Printer.Printers);
  if cbxPrinter.Count > 0 then
    cbxPrinter.ItemIndex := 0;
end;

procedure TfrmMainMod_525.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  FOrderby := ' ORDER BY PackID asc,ReportFile asc';
  inherited;
end;

procedure TfrmMainMod_525.mniDesignTagClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(100,525) then Exit;

  if frmPackPrintEdit_525 = nil then
    frmPackPrintEdit_525 := TfrmPackPrintEdit_525.Create(Self);

  frmPackPrintEdit_525.FPackID := cdsMain.FieldByName('PackID').AsInteger;
  frmPackPrintEdit_525.GetData;
  frmPackPrintEdit_525.Show;
end;

procedure TfrmMainMod_525.mniPrintHistoryClick(Sender: TObject);
begin
  inherited;
  if frmPackPrintHis_525 = nil then
    frmPackPrintHis_525 := TfrmPackPrintHis_525.Create(Application);
  frmPackPrintHis_525.FPackID := cdsMain.FieldByName('PackID').AsInteger;
  frmPackPrintHis_525.FModID := FModID;
  frmPackPrintHis_525.GetData;
  frmPackPrintHis_525.InLineInitUI;
  frmPackPrintHis_525.Show;
end;

procedure TfrmMainMod_525.pgcPackPrintClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  inherited;
  AllowClose := True;
end;

end.
