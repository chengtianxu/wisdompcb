unit PasPowerMX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmPowerMX = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPowerMX: TfrmPowerMX;

implementation

{$R *.dfm}

procedure TfrmPowerMX.Button1Click(Sender: TObject);
begin
  close;
end;

end.
