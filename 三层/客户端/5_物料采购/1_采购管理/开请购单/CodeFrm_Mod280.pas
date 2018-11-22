unit CodeFrm_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmCode_Mod280 = class(TfrmBaseMain)
    pnl1: TPanel;
    pnl2: TPanel;
    ehDetail: TDBGridEh;
    lbl1: TLabel;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    FDept_Code:string;
    procedure GetData;override;
    { Public declarations }
  end;

var
  frmCode_Mod280: TfrmCode_Mod280;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmCode }

procedure TfrmCode_Mod280.cdsMainAfterScroll(DataSet: TDataSet);
var
  LSql:string;
begin
    LSql:= cdsDetail.CommandText + ' WHERE dbo.DATA0275.auth_group_ptr= '
              + IntToStr(cdsMain.FieldByName('rkey').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cdsDetail) then  Exit;
end;

procedure TfrmCode_Mod280.ehMainDblClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrOk;
end;

procedure TfrmCode_Mod280.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText + ' AND	dbo.Data0034.DEPT_CODE= ' + QuotedStr(FDept_Code);
  inherited;
end;

end.
