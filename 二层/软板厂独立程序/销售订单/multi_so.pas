unit multi_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TForm6 = class(TForm)
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses addsa_order;

{$R *.dfm}

procedure TForm6.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
     abort;
end;

procedure TForm6.Edit1Click(Sender: TObject);
begin
 edit1.SelectAll;
end;

procedure TForm6.Edit2Click(Sender: TObject);
begin
 edit2.SelectAll;
end;

procedure TForm6.Edit3Click(Sender: TObject);
begin
 edit3.SelectAll;
end;

procedure TForm6.Edit3Exit(Sender: TObject);
begin
if trim(edit3.Text)='' then edit3.Text:='0';
 edit4.Text:=inttostr(strtoint(edit3.Text)*form2.set_qty);
end;

procedure TForm6.Edit1Exit(Sender: TObject);
begin
if trim(edit1.Text)='' then edit1.Text:='0';
end;

procedure TForm6.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then edit2.Text:='1';
end;

procedure TForm6.Edit4Exit(Sender: TObject);
begin
 if edit4.Text='' then edit4.Text:='0';   //数量pcs
if (strtoint(edit4.Text) mod form2.set_qty) <> 0 then
 begin
  if messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mryes then
   edit3.Text:=inttostr(round(strtoint(edit4.Text)/form2.set_qty))
  else
   edit4.SetFocus;
 end
else
 edit3.Text:=floattostr(strtoint(edit4.Text)/form2.set_qty);
end;

procedure TForm6.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit1.SetFocus;
end;

procedure TForm6.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm6.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit3.SetFocus;
end;

procedure TForm6.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit4.SetFocus;
end;

procedure TForm6.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

end.
