unit TS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TFrmTS = class(TForm)
    lb_1: TLabel;
    pb1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTS: TFrmTS;

implementation

uses DM;

{$R *.dfm}

procedure TFrmTS.Timer1Timer(Sender: TObject);
begin
  pb1.Position := pb1.Position + 1;
  if pb1.Position = 49 then
  Close;
end;

end.
