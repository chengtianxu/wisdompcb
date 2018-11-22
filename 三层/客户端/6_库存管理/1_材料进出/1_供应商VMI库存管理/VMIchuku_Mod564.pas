unit VMIchuku_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmVMIchuku_Mod564 = class(TfrmBaseMain)
    N1: TMenuItem;
    CheckBox1: TCheckBox;
    procedure btnQryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

//var
//  frmVMIchuku_Mod564: TfrmVMIchuku_Mod564;

implementation
uses SupplieReturnMX;
{$R *.dfm}

procedure TfrmVMIchuku_Mod564.btnQryClick(Sender: TObject);
begin
  FMainWhereID:=1;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0133.CREATE_DATE';
    cdsMainWhereInit.FieldByName('Oper').AsString := 'Çø¼ä';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmVMIchuku_Mod564.getdata;
begin
  if (CheckBox1.Checked) then
    FMainFrmSql := cdsMain.CommandText+' and data0134.quan_on_hand>0 '
  else
    FMainFrmSql := cdsMain.CommandText;

  if FMainWhere.Trim = '' then
    FMainWhere := ' AND data0133.CREATE_DATE BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1));
  FWhere2 := '';

  FOrderby := ' order by data0133.rkey desc ';
  inherited;
end;

procedure TfrmVMIchuku_Mod564.N1Click(Sender: TObject);
var LsName:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(9,564) then Exit;
  frmSupplieReturnMX := TfrmSupplieReturnMX.Create(Self);
  try
    frmSupplieReturnMX.getdate('0');
    frmSupplieReturnMX.LGRName:=frmSupplieReturnMX.update04('data0724',LsName);
    frmSupplieReturnMX.Edit11.Text:=LsName;
    frmSupplieReturnMX.Edit11.Tag:=cdsMain.FieldByName('RKEY_1').AsInteger;
    frmSupplieReturnMX.Edit1.Text:=cdsMain.FieldByName('INV_PART_NUMBER').AsString;
    frmSupplieReturnMX.Edit1.Tag:=cdsMain.FieldByName('INVENTORY_PTR').AsInteger;
    frmSupplieReturnMX.Edit2.Text:=cdsMain.FieldByName('SUPPLIER_NAME').AsString;
    frmSupplieReturnMX.Edit2.Tag:=cdsMain.FieldByName('SUPP_PTR').AsInteger;
    frmSupplieReturnMX.Edit3.Text:=cdsMain.FieldByName('WAREHOUSE_NAME').AsString;
    frmSupplieReturnMX.Edit3.Tag:=cdsMain.FieldByName('warehouse_ptr').AsInteger;
    frmSupplieReturnMX.Edit4.Text:=cdsMain.FieldByName('quantity').AsString;
    frmSupplieReturnMX.Edit5.Text:=cdsMain.FieldByName('QUAN_RETURNED').AsString;
    frmSupplieReturnMX.Edit6.Text:=cdsMain.FieldByName('quan_on_hand').AsString;
    frmSupplieReturnMX.Edit7.Text:=cdsMain.FieldByName('tax_2').AsString;
    frmSupplieReturnMX.Edit9.Text:=cdsMain.FieldByName('tax_price').AsString;
    if frmSupplieReturnMX.ShowModal = mrOk then
    begin

    end;
    btnRefreshClick(nil);
  finally
    frmSupplieReturnMX.Free;
  end;
end;

procedure TfrmVMIchuku_Mod564.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    N1.Enabled:=False;
  end else
  begin
    N1.Enabled:=True;
  end;
end;

end.
