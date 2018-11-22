unit UAuditInfoFrm_Mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, ucommfunc, uBaseFrm,
  Data.Win.ADODB;

type
  TFrmAuditInfo_Mod496 = class(TfrmBase)
    pnl1: TPanel;
    eh1: TDBGridEh;
    ds1: TDataSource;
    cds1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getData(srkey: string);
  end;

var
  FrmAuditInfo_Mod496: TFrmAuditInfo_Mod496;

implementation

{$R *.dfm}
{ TFrmAuditInfo_Mod496 }

procedure TFrmAuditInfo_Mod496.getData(srkey: string);
var
  ssql: string;
begin
  ssql := 'SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0368.user_ptr,'
    + 'data0368.auth_date,data0368.ranking,data0368.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '
    + 'ON dbo.Data0073.RKEY = dbo.data0368.user_ptr ' +
    'WHERE dbo.data0368.apply_ptr=' + srkey + ' order by dbo.data0368.ranking';
  gSvrintf.IntfGetDataBySql(ssql, cds1);
end;

end.
