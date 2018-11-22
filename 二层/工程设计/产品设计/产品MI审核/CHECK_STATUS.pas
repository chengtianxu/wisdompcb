unit CHECK_STATUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure DBRadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo;

{$R *.dfm}

procedure TForm3.DBRadioGroup2Click(Sender: TObject);
begin
  if   DBRadioGroup2.ItemIndex=1 then
  begin
      DBCheckBox3.Checked:=True;
      DBCheckBox2.Checked:=True;
  end
  else
  begin
       DBCheckBox3.Checked:=False;
      DBCheckBox2.Checked:=False;
  end;
end;

end.
