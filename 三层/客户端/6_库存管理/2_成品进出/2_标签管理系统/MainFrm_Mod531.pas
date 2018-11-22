unit MainFrm_Mod531;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzTabs, BaseOperatorFrm_Mod531;

type
  TfrmMain_Mod531 = class(TfrmBaseMain)
    pnl1: TPanel;
    cdsMainOperator: TStringField;
    pgcTagOperator: TRzPageControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ehMainDblClick(Sender: TObject);
    procedure pgcTagOperatorClose(Sender: TObject; var AllowClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
    function GetTagOperatorFrm(AReportFile: string;AOwner: TControl): TfrmBaseOperator_Mod531;
  end;

implementation

uses
  TagOperator_DecodeFrm, uCommFunc;

{$R *.dfm}

{ TfrmMain_Mod531 }

procedure TfrmMain_Mod531.ehMainDblClick(Sender: TObject);
var
  I: Integer;
  LTS: TRZTabSheet;
  LFrm: TfrmBaseOperator_Mod531;
begin
  inherited;
  for I := 0 to pgcTagOperator.PageCount - 1 do
  begin
    if pgcTagOperator.Pages[I].Caption = cdsMain.FieldByName('Operator').AsString then
    begin
      pgcTagOperator.ActivePageIndex := I;
      Exit;
    end;
  end;

  LTS := TRZTabSheet.Create(pgcTagOperator);
  LTS.PageIndex := pgcTagOperator.PageCount;
  LTS.Caption := cdsMain.FieldByName('Operator').AsString;
  LTS.PageControl := pgcTagOperator;

  LFrm := GetTagOperatorFrm(LTS.Caption,LTS);
  if LFrm = nil then
  begin
    ShowMessage('不支持该操作');
    LTS.Free;
    Exit;
  end;

  LTS.Data := LFrm;
  LFrm.FModID := FModID;
  LFrm.Pnldisplay.Parent := LTS;
  LFrm.pnlDisplay.Visible := True;

  pgcTagOperator.ActivePage := LTS;
  LTS.SetFocus;


end;

procedure TfrmMain_Mod531.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Action := caFree;
end;

procedure TfrmMain_Mod531.GetData;
begin
  cdsMain.CreateDataSet;
  cdsMain.AppendRecord(['标签信息解析']);
  cdsMain.AppendRecord(['仓库标箱管理']);
  cdsMain.AppendRecord(['华为标签对比']);
  cdsMain.AppendRecord(['华为ASN标签打印']);
  cdsMain.First;
end;

function TfrmMain_Mod531.GetTagOperatorFrm(AReportFile: string;
  AOwner: TControl): TfrmBaseOperator_Mod531;
begin
  Result := nil;
  if AReportFile = '标签信息解析' then
  begin
    if not gFunc.CheckUserAuth(1,FModID) then Exit;

    Result := TfrmTagOperator_Decode.Create(AOwner);
  end else
  if AReportFile = '仓库标箱管理' then
  begin

  end else
  if AReportFile = '华为标签对比' then
  begin

  end else
  if AReportFile = '华为ASN标签打印' then
  begin

  end;

end;

procedure TfrmMain_Mod531.pgcTagOperatorClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  inherited;
  AllowClose := True;
end;

end.
