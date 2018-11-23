unit qk200000001Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, qk200000001MainFrm;

type
  Tfrmqk200000001Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

{$R *.dfm}

{ Tfrmqk200000001Fram }

procedure Tfrmqk200000001Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk200000001Main);
end;

end.
