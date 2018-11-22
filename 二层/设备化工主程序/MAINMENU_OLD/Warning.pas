unit Warning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmWarning = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWarning: TFrmWarning;

implementation

{$R *.dfm}

procedure TFrmWarning.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
