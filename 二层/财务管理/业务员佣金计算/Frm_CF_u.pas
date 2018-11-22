unit Frm_CF_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_CF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Shape1: TShape;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CF: TFrm_CF;

implementation

{$R *.dfm}

procedure TFrm_CF.BitBtn1Click(Sender: TObject);
begin
  if strtofloat('0'+Edit4.Text)=0 then
    showmessage('ÇëÊäÈë²ð·Ö½ð¶î!')
  else
    modalresult:=mrok;
end;

procedure TFrm_CF.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',Edit4.Text)>0)) then abort;
end;

procedure TFrm_CF.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if strtofloat('0'+Edit4.Text)>=strtofloat('0'+Edit5.Text) then
  begin
    Edit4.Text:=copy(Edit4.Text,1,length(Edit4.Text)-1);
    abort;
  end;
end;

end.
