unit pasMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmMemo = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    ComboBox2: TComboBox;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMemo: TFrmMemo;

implementation

{$R *.dfm}

procedure TFrmMemo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',(sender as tedit).Text)>0 then
   abort;
end;

procedure TFrmMemo.Edit1Exit(Sender: TObject);
begin
 if Trim(Edit1.Text)='' then
 Edit1.Text:='0';
end;

end.
