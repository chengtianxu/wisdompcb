unit wait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmWait = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWait: TfrmWait;

implementation

{$R *.dfm}

procedure TfrmWait.FormCreate(Sender: TObject);
begin
//  Animate1.Active:=True;
end;

end.
