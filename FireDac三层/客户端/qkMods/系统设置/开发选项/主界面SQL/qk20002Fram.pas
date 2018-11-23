unit qk20002Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, qk20002MainFrm;

type
  Tfrmqk20002Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;



implementation

{$R *.dfm}

{ Tfrmqk20002Fram }

procedure Tfrmqk20002Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20002Main);
end;

end.
