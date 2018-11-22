unit outnum_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_outnum = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_outnum: TForm_outnum;

implementation

{$R *.dfm}

procedure TForm_outnum.BitBtn2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_outnum.Edit3Exit(Sender: TObject);
begin
 if ((edit3.Text='') or (edit3.Text='0')or(strtofloat(edit3.Text)>strtofloat(edit1.Text))
     and (self.ActiveControl.Name<>'bitbin2')) then
   begin
    messagedlg('请输入合适的调拨数量！',mtinformation,[mbok],0);
    edit3.Text:='0.000';
    edit3.SetFocus;
   end
 else
   edit3.Text:=formatfloat('0.000',strtofloat(edit3.Text));
end;

procedure TForm_outnum.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit3.Text)>0 then
    abort;
end;

procedure TForm_outnum.BitBtn1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

end.
