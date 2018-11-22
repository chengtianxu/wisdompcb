
unit UnitPutOutDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmPutoutDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    Label6: TLabel;
    edtremark: TEdit;
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPutoutDetail: TFrmPutoutDetail;

implementation

{$R *.dfm}

procedure TFrmPutoutDetail.Edit3Exit(Sender: TObject);
begin
  edit3.Text:=formatfloat('0.000',strtocurr(edit3.Text));
end;

procedure TFrmPutoutDetail.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then bitbtn1.OnClick(sender);
end;

procedure TFrmPutoutDetail.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit3.Text)>0 then
    abort;
end;

procedure TFrmPutoutDetail.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit3.Text)='' then edit3.Text:='0.000';
  if strtocurr(edit3.Text)>strtocurr(edit1.Text) then
     edit3.Text:=edit1.Text;
end;

procedure TFrmPutoutDetail.BitBtn1Click(Sender: TObject);
begin
  if (strtocurr(edit3.text)>(strtocurr(edit4.text)-strtocurr(edit5.Text)))  then
  begin
    ShowMessage('超出申请数量！');
    Edit3.SetFocus;
    Exit;
  end;
  
  if strtocurr(edit3.Text)<=0 then
  begin
    messagedlg('对不起,不能发放数量小于零的半成品!',mterror,[mbcancel],0);
    edit3.SetFocus;
  end
  else
    ModalResult:=mrok;
end;

end.

