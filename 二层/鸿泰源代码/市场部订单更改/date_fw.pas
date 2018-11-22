unit date_fw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm5 = class(TForm)
    DTpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses damo;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
begin
dtpk1.Date:=dm.ADO60.Parameters[0].Value;
dtpk2.Date:=dm.ADO60.Parameters[1].Value;
end;

end.
