unit MaterZt_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,Vcl.Menus,uCommFunc, Data.DB,
  Datasnap.DBClient, uBaseFrm, Vcl.XPMan;

type
  TfrmMaterZt_Mod280 = class(TfrmBaseMain)
    cmbfac: TComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cmbfacChange(Sender: TObject);
  private
    { Private declarations }
  function GetAddWhere1: string;
  public
    { Public declarations }
  procedure GetData();override;
  end;

var
  frmMaterZt_Mod280: TfrmMaterZt_Mod280;

implementation

{$R *.dfm}


procedure TfrmMaterZt_Mod280.cmbfacChange(Sender: TObject);
begin
  inherited;
 GetData;
end;

procedure TfrmMaterZt_Mod280.FormShow(Sender: TObject);
var
Lcds15:TClientDataSet;
begin
  inherited;
  Cmbfac.Items.Append('所有');
  CmbFac.ItemIndex:=0;
  Lcds15:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select abbr_name from data0015' ,Lcds15);
   if Lcds15.IsEmpty  then
   begin
     ShowMessage('不存在有效的工厂,请联系管理员!');
     Exit;
   end;
   while not Lcds15.Eof do
   begin
    CmbFac.Items.Append(Lcds15.Fields[0].asstring);
    Lcds15.Next;
   end;
  finally
   Lcds15.Free;
  end;
end;

function TfrmMaterZt_Mod280.GetAddWhere1:string;
begin
if cmbfac.ItemIndex=0 then
Result:=''
else
Result:=' and data0015.abbr_name='''+Cmbfac.Text+''''
end;

procedure TfrmMaterZt_Mod280.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  FWhere2 := GetAddWhere1;

  FOrderby := ' order by data0068.rkey desc ';
  inherited;
end;
end.
