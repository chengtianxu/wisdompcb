unit qk1005001Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel;

type
  Tfrmqk1005001Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;



implementation

uses
  qk1005001Main;

{$R *.dfm}

{ Tfrmqk1005001Fram }

procedure Tfrmqk1005001Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk1005001Main);
end;

end.
