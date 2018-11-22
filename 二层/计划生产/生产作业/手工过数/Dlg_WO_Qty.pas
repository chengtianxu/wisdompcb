unit Dlg_WO_Qty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDlg_WO_Qty = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtEmpCode: TEdit;
    edtRemainPCS: TEdit;
    edtRemainPNL: TEdit;
    edtPcs: TEdit;
    edtPNL: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure edtPNLChange(Sender: TObject);
    procedure edtPNLKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure enter(remainPcs,remainPNL:integer;Emp:string);
  end;

var
  frmDlg_WO_Qty: TfrmDlg_WO_Qty;

implementation
uses dm,common;
{$R *.dfm}

{ TfrmDlg_WO_Qty }

procedure TfrmDlg_WO_Qty.enter(remainPcs,remainPNL:integer;Emp:string);
begin
  edtEmpCode.Text := Emp;
  edtRemainPCS.Text:=IntToStr(remainPcs);
  edtRemainPNL.Text:=IntToStr(remainPNL);
  edtPNL.Text:=IntToStr(remainPNL);
  edtPcs.Text:=IntToStr(remainPcs);
end;

procedure TfrmDlg_WO_Qty.edtPNLChange(Sender: TObject);
begin
  if trim(edtPnl.Text) = '' then exit;
  edtPcs.Text := IntToStr(dmcon.adsWOInfo.fieldbyName('PARTS_PER_PANEL').asinteger*StrToInt(edtPnl.Text));
end;

procedure TfrmDlg_WO_Qty.edtPNLKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(sender)
  else
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end;
end;

procedure TfrmDlg_WO_Qty.BitBtn1Click(Sender: TObject);
begin
  if (trim(edtPcs.Text)='') or (trim(edtPNL.Text)='') then
  begin
    ShowMsg('数量不能为空',1);
    exit;
  end;
  if StrToInt(edtPcs.Text)<= 0 then
  begin
    ShowMsg('Pcs数量必须大于零',1);
    exit;
  end;
  if StrToInt(edtPcs.Text)<= 0 then
  begin
    ShowMsg('PNL数量必须大于零',1);
    exit;
  end;
  if StrToInt(edtPcs.Text)> StrToInt(edtRemainPCS.text) then
  begin
    ShowMsg('分配数量不能大于剩余数量',1);
    exit;
  end;
  if StrToInt(edtPNL.Text)> StrToInt(edtRemainPNL.text) then
  begin
    ShowMsg('分配数量不能大于剩余数量',1);
    exit;
  end;
  Modalresult := mrok;
end;

end.
