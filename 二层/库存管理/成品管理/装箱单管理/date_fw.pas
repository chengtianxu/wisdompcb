unit date_fw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm10 = class(TForm)
    DTPk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure DTPk1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPk2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses damo;

{$R *.dfm}

procedure TForm10.FormActivate(Sender: TObject);
begin
dtpk1.Date:=dm.ADO0439.Parameters[0].Value;
dtpk2.Date:=dm.ADO0439.Parameters[1].Value;
end;

procedure TForm10.DTPk1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dtpk2.SetFocus;
end;

procedure TForm10.DTPk2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

end.
