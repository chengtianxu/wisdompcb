unit Dlg_Chng_Qty;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms;

type
  TfrmDlg_Chng_Qty = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtPcs: TEdit;
    edtPNL: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure edtPNLKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    PNLQty:integer;
  end;

var
  frmDlg_Chng_Qty: TfrmDlg_Chng_Qty;

implementation
uses common,dm;
{$R *.DFM}

procedure TfrmDlg_Chng_Qty.edtPNLKeyPress(Sender: TObject; var Key: Char);
begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
end;

procedure TfrmDlg_Chng_Qty.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modalresult <> mrok then exit;
  if trim(edtPNL.Text) = '' then
  begin
    canclose:=false;
    ShowMsg('PNL数量不能为空',1);
  end
  else
  begin
    if not IS_INteger(edtPNL.Text) then
    begin
      canclose:=false;
      ShowMsg('PNL数量不是有效的数值',1);
    end;
  end;
  if StrToINt(edtPNL.Text)> dmcon.adsProdList.FieldByName('panels').AsInteger then
  begin
    canclose:=false;
    ShowMsg('PNL数量不能大于原作业单PNL数量',1);
  end
  else
  if StrToINt(edtPNL.Text) < 0 then
  begin
    canclose:=false;
    ShowMsg('PNL数量不能小于零',1);
  end
  else
  if ((StrToINt(edtPNL.Text)) > 0) and ((StrToINt(edtPcs.Text))= 0) then
  begin
    canclose:=false;
    ShowMsg('PNL数量不符合逻辑，请重新输入',1);
  end
  else
  if not (StrToINt(edtPNL.Text) >= (StrToINt(edtPcs.Text)/StrToInt(Trim(Self.Label4.Caption)))) then
  begin
    canclose:=false;
    ShowMsg('PNL数量不符合逻辑，请重新输入',1);
  end;

end;

end.
