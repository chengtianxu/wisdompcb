unit ReasonFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uBaseFrm;

type
  TfrmReason_Mod664 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnS: TBitBtn;
    btnC: TBitBtn;
    mmo1: TMemo;
    procedure btnSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReason_Mod664: TfrmReason_Mod664;

implementation

{$R *.dfm}

{ TfrmNote_Mod29 }

procedure TfrmReason_Mod664.btnSClick(Sender: TObject);
begin
  if Trim(mmo1.Text) = '' then
  begin
    ShowMessage('请先输入不合格原因');
  end
  else ModalResult:=mrOk;
end;

end.
