unit PackPrintHisFrm_525;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPackPrintHis_525 = class(TfrmBaseMain)
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FPackID: Integer;
    procedure GetData;override;
    procedure InLineInitUI;override;
  end;

var
  frmPackPrintHis_525: TfrmPackPrintHis_525;

implementation

uses
  uCommFunc, System.DateUtils;

{$R *.dfm}

{ TfrmPackPrintHis_525 }

procedure TfrmPackPrintHis_525.btnExitClick(Sender: TObject);
begin
  Close;
//  inherited;
end;

procedure TfrmPackPrintHis_525.btnRefreshClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to ehMain.Columns.Count - 1 do
  begin
    ehMain.Columns[I].Width := 100;
  end;
end;

procedure TfrmPackPrintHis_525.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  Action := caFree;
  frmPackPrintHis_525 := nil;
end;

procedure TfrmPackPrintHis_525.FormCreate(Sender: TObject);
begin
  inherited;
  dtp2.DateTime := gFunc.GetSvrDateTime();
  dtp1.DateTime := IncDay(dtp2.DateTime,-7);
end;

procedure TfrmPackPrintHis_525.GetData;
var
  LSql: string;
  LT1,LT2: string;
begin
  LT1 := '''' + QuotedStr(gFunc.DateTimeToStr(dtp1.DateTime,'YYYY-MM-DD hh:mm:ss')) + '''';
  LT2 := '''' + QuotedStr(gFunc.DateTimeToStr(dtp2.DateTime,'YYYY-MM-DD hh:mm:ss')) + '''';
  LSql := StringReplace(cdsMain.CommandText,':PPackID',IntToStr(FPackID),[rfReplaceAll, rfIgnoreCase]);
  LSql := StringReplace(LSql,':T1',LT1,[rfReplaceAll, rfIgnoreCase]);
  LSql := StringReplace(LSql,':T2',LT2,[rfReplaceAll, rfIgnoreCase]);
  FMainFrmSql := LSql;
  inherited;
end;

procedure TfrmPackPrintHis_525.InLineInitUI;
var
  I: Integer;
begin
  inherited;
  for I := 0 to ehMain.Columns.Count - 1 do
  begin
    ehMain.Columns[I].Width := 100;
  end;

end;

end.
