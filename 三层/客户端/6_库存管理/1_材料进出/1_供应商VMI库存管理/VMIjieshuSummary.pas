unit VMIjieshuSummary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmVMIjieshuSummary = class(TfrmBaseMain)
  private
    { Private declarations }
  public
    Lw3:string;
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmVMIjieshuSummary: TfrmVMIjieshuSummary;

implementation

{$R *.dfm}

{ TfrmVMIjieshuSummary }

procedure TfrmVMIjieshuSummary.GetData;
begin
  FWhere2:=Lw3;
  FWhere3:=' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
           +' dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
           +' dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,Data0023.code,'
           +' dbo.Data0019.inv_group_name,'
           +' dbo.Data0017.STOCK_SELL,'
           +' data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY';
  FMainFrmSql := cdsMain.CommandText;
  FOrderby := ' ORDER BY dbo.Data0017.INV_PART_NUMBER';
  inherited;
end;

end.
