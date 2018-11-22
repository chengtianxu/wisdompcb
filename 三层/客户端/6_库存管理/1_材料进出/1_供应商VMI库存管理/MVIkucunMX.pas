unit MVIkucunMX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMVIkucunMX = class(TfrmBaseMain)
    procedure btnQryClick(Sender: TObject);
    procedure pmZDPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmMVIkucunMX: TfrmMVIkucunMX;

implementation

{$R *.dfm}

uses VMIQuery_Mod564;

{ TfrmMVIkucunMX }

procedure TfrmMVIkucunMX.btnQryClick(Sender: TObject);
var
  LstrText:string;
  i:Integer;
begin
//  frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  frmVMIQuery_Mod564.RadioGroup1.ItemIndex:=2;
  frmVMIQuery_Mod564.RGp4.ItemIndex:=0;
  if frmVMIQuery_Mod564.ShowModal = mrOk then
  begin
    for i:=1 to frmVMIQuery_Mod564.SGrid1.RowCount-2 do
    if frmVMIQuery_Mod564.sgrid1.Cells[2,i]<> '' then LstrText:=LstrText+frmVMIQuery_Mod564.sgrid1.Cells[2,i];
    FMainWhere :=LstrText;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMVIkucunMX.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' AND data0133.CREATE_DATE BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime));
  FOrderby := '  ORDER BY Data0017.INV_PART_NUMBER ';
  inherited;
end;

procedure TfrmMVIkucunMX.pmZDPopup(Sender: TObject);
var
  LArr: TArray<Integer>;
  I: Integer;
begin
  inherited;
  pmZD.Items[9].Enabled := False;
  pmZD.Items[10].Enabled := False;
  pmZD.Items[11].Enabled := False;
  pmZD.Items[12].Enabled := False;
  pmZD.Items[13].Enabled := False;
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),564);
  for I := 0 to Length(LArr) - 1 do
  begin
    if  LArr[I]=6 then
    begin
      pmZD.Items[9].Enabled := True;
      pmZD.Items[10].Enabled := True;
      pmZD.Items[11].Enabled := True;
      pmZD.Items[12].Enabled := True;
      pmZD.Items[13].Enabled := True;
      Break;
    end;
  end;
end;

end.
