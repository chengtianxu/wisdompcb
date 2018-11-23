unit qk20003Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkSvrIntf.ClientIntf,qkFunc.Commfunc,qkBaseTabFrm,
  RzTabs, Vcl.ExtCtrls, RzPanel, qk20003MainFrm, Vcl.Menus;

type
  Tfrmqk20003Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

{$R *.dfm}

{ Tfrmqk20003Fram }

procedure Tfrmqk20003Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20003Main);
end;

end.
