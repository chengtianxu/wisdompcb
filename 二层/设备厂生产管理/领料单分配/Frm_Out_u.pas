unit Frm_Out_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrm_out = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Edit5: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_out: TFrm_out;

implementation

{$R *.dfm}

procedure TFrm_out.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort ;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
begin
  if strtofloat('0'+trim(edit5.Text))=0 then
  begin
    showmessage('分配数量不能为0...');
    edit5.SetFocus;
    exit;
  end;
  if strtofloat('0'+trim(edit5.Text))>strtofloat(edit1.Text) then
  begin
    showmessage('分配数量不能不能大于有效库存...');
    edit5.SetFocus;
    exit;
  end;
  if strtofloat('0'+trim(edit5.Text))>strtofloat(edit2.Text) then
  begin
    showmessage('分配数量不能不能大于需求欠数...');
    edit5.SetFocus;
    exit;
  end;
  modalresult:=mrok;
end;                         

end.
