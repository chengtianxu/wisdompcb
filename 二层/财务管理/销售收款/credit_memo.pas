unit credit_memo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_credit = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    procedure Button1Click(Sender: TObject);
    function memo_number_error(number: string): boolean;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_credit: TForm_credit;

implementation

uses DAMO;

{$R *.dfm}

function TForm_credit.memo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0116');
  sql.Add('where MEMO_NUMBER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm_credit.Button1Click(Sender: TObject);
begin

  if trim(edit1.Text)='' then
   begin
    messagedlg('备忘编号不允许为空',mterror,[mbok],0);
    edit1.SetFocus;
    exit;
   end;

  if (dm.ADO04SEED_FLAG.Value<>1) then
  if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
   begin
    messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    edit1.SetFocus;
    exit;
   end;

  if self.memo_number_error(trim(edit1.Text)) then
   begin
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     begin
      Edit1.Text:=dm.ADO04SEED_VALUE.Value;
      messagedlg('备忘编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
     end
    else
     begin
      messagedlg('备忘编号重复!请手工重新输入',mterror,[mbok],0);
      edit1.SetFocus;
      exit;
     end;
   end;

self.ModalResult:=mrok;
end;

procedure TForm_credit.FormActivate(Sender: TObject);
begin
button1.SetFocus;
end;

end.
