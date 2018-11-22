unit UnitReturnDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmReturnDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReturnDetail: TFrmReturnDetail;

implementation

{$R *.dfm}

procedure TFrmReturnDetail.Edit4Exit(Sender: TObject);
begin
  edit4.Text:=formatfloat('0.000',strtocurr(edit4.Text));
end;

procedure TFrmReturnDetail.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then bitbtn1.OnClick(sender);
end;

procedure TFrmReturnDetail.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
    if (key = chr(46)) then
      if pos('.',edit4.Text)>0 then
        abort;
end;

procedure TFrmReturnDetail.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit4.Text)='' then edit4.Text:='0.000';
  if strtocurr(edit4.Text)>strtocurr(edit3.Text) then
     edit4.Text:=edit3.Text;
end;

procedure TFrmReturnDetail.BitBtn1Click(Sender: TObject);
begin
  if strtocurr(edit4.Text)=0 then
  begin
    messagedlg('对不起,退回数量不能为零!',mterror,[mbcancel],0);
    edit4.SetFocus;
  end
  else
    ModalResult:=mrok;
end;

end.

