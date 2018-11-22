unit editplanned;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm_editplanned = class(TForm)
    Edit1: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   host_flag:boolean; 
  end;

var
  Form_editplanned: TForm_editplanned;

implementation

{$R *.dfm}

procedure TForm_editplanned.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm_editplanned.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as tedit).Text)='' then
 (sender as tedit).Text:='0';
end;

procedure TForm_editplanned.FormActivate(Sender: TObject);
begin
if self.host_flag then
 label4.Caption:='主订单'
else
 label4.Caption:='从订单';
end;

procedure TForm_editplanned.BitBtn1Enter(Sender: TObject);
begin
if (self.host_flag) and (strtoint(edit2.Text)=0) then
 begin
  showmessage('主订单本次计划不允许为零!');
  edit2.SetFocus;
  exit;
 end;

if (not host_flag) and (strtoint(edit2.Text) > strtoint(edit1.Text)) then
 begin
  showmessage('从订单本次计划不允许大于待计划数量!');
  edit2.SetFocus;
  exit;
 end;

end;

end.
