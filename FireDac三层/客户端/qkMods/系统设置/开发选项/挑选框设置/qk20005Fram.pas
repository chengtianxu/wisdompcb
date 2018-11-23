unit qk20005Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, qk20005MainFrm;

type
  Tfrmqk20005Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;

implementation

{$R *.dfm}

{ Tfrm20005Fram }

procedure Tfrmqk20005Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20005Main);
end;

end.
