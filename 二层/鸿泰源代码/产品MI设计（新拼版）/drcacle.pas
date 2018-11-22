unit drcacle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_drcalc = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_drcalc: TForm_drcalc;

implementation

uses product_MIDetail;

{$R *.dfm}

procedure TForm_drcalc.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then abort
end;

procedure TForm_drcalc.Button1Click(Sender: TObject);
begin
 if strtoint(edit2.Text) < strtoint(edit1.Text) then
  messagedlg('结束行不能大于开始行',mterror,[mbcancel],0)
 else
  if strtoint(edit2.Text) > form2.StringGrid1.RowCount-2 then
   messagedlg('结束行不能当前钻咀表总行数',mterror,[mbcancel],0)
  else
   self.ModalResult:=mrok;
end;

procedure TForm_drcalc.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as tedit).Text)='' then
 (sender as Tedit).Text:='1';
end;

procedure TForm_drcalc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm_drcalc.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

end.
