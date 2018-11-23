unit qk10000Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls,
  RzPanel, Vcl.Menus, qk10000MainFrm;

type
  Tfrmqk10000Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;

implementation

{$R *.dfm}

{ Tfrmqk10000Fram }


procedure Tfrmqk10000Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk10000Main);
end;

end.
