unit qk1604001Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, qk1604001MainFrm;

type
  Tfrmqk1604001Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;



implementation

{$R *.dfm}

{ Tfrmqk1604001Fram }

procedure Tfrmqk1604001Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk1604001MainFrm);
end;



end.
