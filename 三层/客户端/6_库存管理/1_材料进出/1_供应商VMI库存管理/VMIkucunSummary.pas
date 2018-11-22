unit VMIkucunSummary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmVMIkucunSummary = class(TfrmBaseMain)
    procedure btnQryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmVMIkucunSummary: TfrmVMIkucunSummary;

implementation

{$R *.dfm}

uses VMIQuery_Mod564;

{ TfrmVMIkucunSummary }

procedure TfrmVMIkucunSummary.btnQryClick(Sender: TObject);
var
  LstrText:string;
  i:Integer;
begin
//  if frmVMIQuery_Mod564=nil then
//  frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  frmVMIQuery_Mod564.RadioGroup1.ItemIndex:=2;
  frmVMIQuery_Mod564.RGp4.ItemIndex:=1;
  if frmVMIQuery_Mod564.ShowModal = mrOk then
  begin
    for i:=1 to frmVMIQuery_Mod564.SGrid1.RowCount-2 do
    if frmVMIQuery_Mod564.sgrid1.Cells[2,i]<> '' then LstrText:=LstrText+frmVMIQuery_Mod564.sgrid1.Cells[2,i];
    FMainFrmSql:='';
    FMainFrmSql := cdsMain.CommandText;
    FMainWhere :=LstrText;
    FOrderby := ' ORDER BY Data0017.INV_PART_NUMBER';
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIkucunSummary.GetData;
begin
  FWhere3 :=' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
           +'  dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
           +'   dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,'
           +'   dbo.Data0019.inv_group_name,'
           +'   dbo.Data0017.STOCK_SELL,Data0134.supplier2,'
           +'   data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY,data0016.location';
  FMainFrmSql := cdsMain.CommandText;
  FOrderby := ' ORDER BY dbo.Data0017.INV_PART_NUMBER';
  inherited;
end;

end.
