unit PasAllOldVersion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.ExtCtrls,
  Vcl.StdCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmAllOldVersion = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    dsOldECN: TDataSource;
    cdsOldECN: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(AllVersion:string);
  end;

var
  frmAllOldVersion: TfrmAllOldVersion;

implementation

{$R *.dfm}

procedure TfrmAllOldVersion.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAllOldVersion.GetData(AllVersion: string);
var LSQL60:string;
begin
  LSQL60:=cdsOldECN.CommandText+' and Data0025.RKEY in '+AllVersion;
  gSvrIntf.IntfGetDataBySql(LSQL60,cdsOldECN);
end;

end.
