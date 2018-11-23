unit qk20001Fram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseTabFrm, RzTabs, Vcl.ExtCtrls, qkBaseGridFrm,
  RzPanel, Vcl.Menus, FireDAC.Comp.Client,FireDAC.Stan.Param, FireDAC.Comp.DataSet,
  qkFunc.Commfunc, qk20001MainFrm, qk20001EditFrm;

type
  Tfrmqk20001Fram = class(TfrmqkTabFormbase)
    pm1: TPopupMenu;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniDele: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AModID: Int64);
  end;

implementation

uses
  qkBaseEditVGridFrm, qkSvrIntf.ClientIntf;

{$R *.dfm}

{ Tfrmqk20001Fram }

procedure Tfrmqk20001Fram.Init(AModID: Int64);
begin
  InitFram(AModID,Tfrmqk20001Main);
end;

end.
