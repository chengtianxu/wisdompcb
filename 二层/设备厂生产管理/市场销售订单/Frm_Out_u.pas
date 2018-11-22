unit Frm_Out_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
    Label3: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    Shape1: TShape;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    if not (key in ['0'..'9', '.', #8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort ;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
begin
  if strtofloat('0'+trim(edit5.Text))=0 then
  begin
    showmessage('下单数量不能为0...');
    edit5.SetFocus;
    exit;
  end;
 { if strtofloat('0'+trim(edit6.Text))=0 then
  begin
    showmessage('单价不能为0...');
    edit6.SetFocus;
    exit;
  end; }
  if edit6.Text='' then edit6.Text:='0';
  if edit7.Text='' then edit7.Text:='0';
  if strtofloat(edit7.Text)>=100 then
  begin
    showmessage('税率不能大于100...');
    edit7.SetFocus;
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
