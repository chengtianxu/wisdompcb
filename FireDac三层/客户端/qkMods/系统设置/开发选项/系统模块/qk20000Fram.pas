unit qk20000Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkSvrIntf.ClientIntf,qkFunc.Commfunc,qkBaseTabFrm,
  FireDAC.Comp.Client,FireDAC.Stan.Param, RzTabs, Vcl.ExtCtrls, RzPanel, qk20000MainFrm;

type
  Tfrmqk20000Fram = class(TfrmqkTabFormbase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;


implementation

{$R *.dfm}

{ Tfrmqk20000Fram }

procedure Tfrmqk20000Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20000MainFrm);
end;

end.
