unit UAuditInfoFrm_Mod497;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh,uCommFunc,
  DBAxisGridsEh, DBGridEh, Data.Win.ADODB;

type
  TFrmAuditInfo_Mod497 = class(TfrmBase)
    eh368: TDBGridEh;
    cds368: TClientDataSet;
    ds368: TDataSource;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GetData(ARkey:string);

  end;

var
  FrmAuditInfo_Mod497: TFrmAuditInfo_Mod497;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFrmAuditInfo_Mod497.GetData(ARkey: string);
var
Lsql:string;
begin
//
Lsql:= 'SELECT     Data0073.USER_FULL_NAME as ‘≠…Û≈˙»À, Data0073_1.USER_FULL_NAME AS RPL_USER_FULL_NAME,DATA0368.auth_date, DATA0368.ranking, '+
'  DATA0368.auth_flag, DATA0368.remark, DATA0368.apply_ptr,DATA0368.user_ptr, dbo.Data0073.draw_materiel_ptr '+
' FROM  dbo.DATA0368   '+
' INNER JOIN dbo.Data0073 ON dbo.DATA0368.user_ptr = dbo.Data0073.RKEY '+
' INNER JOIN dbo.Data0073 AS Data0073_1 ON dbo.Data0073.draw_materiel_ptr = Data0073_1.RKEY '+
' where  DATA0368.apply_ptr=' +ARkey;

  gSvrintf.IntfGetDataBySql(Lsql,cds368);
end;

end.
