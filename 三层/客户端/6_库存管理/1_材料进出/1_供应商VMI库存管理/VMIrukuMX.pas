unit VMIrukuMX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmVMIrukuMX = class(TfrmBaseMain)
    procedure btnQryClick(Sender: TObject);
    procedure pmZDPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmVMIrukuMX: TfrmVMIrukuMX;

implementation

{$R *.dfm}

uses VMIQuery_Mod564;

{ TfrmVMIrukuMX }

procedure TfrmVMIrukuMX.btnQryClick(Sender: TObject);
var
  LstrText:string;
  i:Integer;
begin
//  if frmVMIQuery_Mod564=nil then
//  begin
//    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
//    for i:=1 to frmVMIQuery_Mod564.sgrid1.RowCount-1 do
//      frmVMIQuery_Mod564.sgrid1.Rows[i].Clear;
//    frmVMIQuery_Mod564.sgrid1.RowCount:=2;
//  end;
  frmVMIQuery_Mod564.RadioGroup1.ItemIndex:=0;
  frmVMIQuery_Mod564.RGp4.ItemIndex:=0;
  if frmVMIQuery_Mod564.ShowModal = mrOk then
  begin
    for i:=1 to frmVMIQuery_Mod564.SGrid1.RowCount-2 do
    if frmVMIQuery_Mod564.sgrid1.Cells[2,i]<> '' then LstrText:=LstrText+frmVMIQuery_Mod564.sgrid1.Cells[2,i];
    FMainWhere :=LstrText;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIrukuMX.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' AND data0133.create_date BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
  FOrderby := '  ';
  inherited;
end;

procedure TfrmVMIrukuMX.pmZDPopup(Sender: TObject);
var
  LArr: TArray<Integer>;
  I: Integer;
begin
  inherited;
  pmZD.Items[14].Enabled := False;
  pmZD.Items[15].Enabled := False;
  pmZD.Items[16].Enabled := False;
  pmZD.Items[17].Enabled := False;
  pmZD.Items[18].Enabled := False;
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),564);
  for I := 0 to Length(LArr) - 1 do
  begin
    if  LArr[I]=6 then
    begin
      pmZD.Items[14].Enabled := True;
      pmZD.Items[15].Enabled := True;
      pmZD.Items[16].Enabled := True;
      pmZD.Items[17].Enabled := True;
      pmZD.Items[18].Enabled := True;
      Break;
    end;
  end;
end;

end.
