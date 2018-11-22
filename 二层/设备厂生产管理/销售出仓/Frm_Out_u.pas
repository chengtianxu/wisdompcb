unit Frm_Out_u;

interface

uses
  Windows, messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrm_out = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Shape1: TShape;
    Label10: TLabel;
    Edit9: TEdit;
    Label3: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Edit10: TEdit;
    Label9: TLabel;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    FQty: Double;
  end;

var
  Frm_out: TFrm_out;

implementation
uses DM_u;
{$R *.dfm}

procedure TFrm_out.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then abort;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
begin
  if strtofloat('0'+trim(edit5.Text))=0 then
  begin
    showmessage('下单数量不能为0...');
    edit5.SetFocus;
    exit;
  end;

  if strtofloat(edit5.Text)>strtofloat(edit6.Text)-FQty then
  begin
    showmessage('出库总数不能大于订单数...');
    edit5.SetFocus;
    exit;
  end;

  if strtofloat(edit5.Text)>strtofloat(edit4.Text) then
  begin
    showmessage('出库数量不能大于当前库存...');
    edit5.SetFocus;
    exit;
  end;
  
  if StrToFloat(Trim(edit5.Text)) > StrToFloat(Trim(edit6.Text)) then
  begin
    showmessage('出库数量不能大于当前订单欠数...');
    edit5.SetFocus;
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrm_out.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true) ;
end;

end.
