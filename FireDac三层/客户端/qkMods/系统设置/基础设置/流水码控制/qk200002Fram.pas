unit qk200002Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel;

type
  Tfrmqk200002Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

uses
  qk200002Main;

{$R *.dfm}

{ Tfrmqk200002Fram }

procedure Tfrmqk200002Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk200002Main);
end;

end.
