unit qk1005002Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, Vcl.ExtCtrls;

type
  Tfrmqk1005002Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

uses
  qk1005002Main;

{$R *.dfm}

{ Tfrmqk1005002Fram }

procedure Tfrmqk1005002Fram.Init(AModID: Int64);
begin
  ModID := AModID;
  InitFram(AModID,Tfrmqk1005002Main);
end;

end.
