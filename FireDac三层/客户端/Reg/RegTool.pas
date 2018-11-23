unit RegTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Unit2;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    mmo1: TMemo;
    dtp1: TDateTimePicker;
    lbl3: TLabel;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  Larr: array [0..43] of Char;
  n: Integer;
  nCount: Integer;
  s1: string;
  I: Integer;
  s2: string;
begin
  edt1.Text := '';
  mmo1.Text := '';
  for I := 0 to 43 do
  begin
    larr[I] := char(48+I);
  end;


  Randomize;
  n :=0;
  nCount := Length(Larr)-1;
  s1 := '';
  for I := 0 to 8 do
  begin
    s1 := s1 + Larr[Random(43)];
  end;

  s2 := FormatDateTime('yyyy-mm-dd',dtp1.Date);
  edt1.Text := s1;
  mmo1.Lines.Text := func1(s2,s1);
  //ShowMessage(s1);

end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  ShowMessage(func2(mmo1.Lines.Text,edt1.Text));
end;

end.
