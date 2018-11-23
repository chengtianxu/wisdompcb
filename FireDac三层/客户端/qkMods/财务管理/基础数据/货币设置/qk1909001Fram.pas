unit qk1909001Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel;

type
  Tfrmqk1909001Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

uses
  qk1909001Main;

{$R *.dfm}

{ Tfrmqk1909001Fram }

procedure Tfrmqk1909001Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk1909001Main);
end;

end.
