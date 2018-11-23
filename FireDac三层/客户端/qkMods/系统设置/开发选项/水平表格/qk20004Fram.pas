unit qk20004Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, qk20004MainFrm;

type
  Tfrmqk20004Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

{$R *.dfm}

{ Tfrmqk20004Fram }

procedure Tfrmqk20004Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20004Main);
end;

end.
