unit qk20000003Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, Vcl.ExtCtrls;

type
  Tfrmqk20000003Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

uses
  qk20000003MainFrm;

{$R *.dfm}

{ Tfrmqk2000000Fram }

procedure Tfrmqk20000003Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20000003Main);
end;

end.
