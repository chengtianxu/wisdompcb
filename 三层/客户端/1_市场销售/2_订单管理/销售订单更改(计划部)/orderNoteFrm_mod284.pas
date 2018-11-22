unit orderNoteFrm_mod284;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmorderNote_mod284 = class(TfrmBase)
    pnl1: TPanel;
    lbl1: TLabel;
    mmo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    btn3: TBitBtn;
    edt_no: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FNType:integer;
  end;

var
  frmorderNote_mod284: TfrmorderNote_mod284;

implementation

{$R *.dfm}

procedure TfrmorderNote_mod284.btn1Click(Sender: TObject);
begin
  inherited;
  if (FNType=0) then
  begin
    if (Trim(edt_no.Text)='') or (length(Trim(edt_no.Text))<5) then
    begin
      ShowMessage('暂停原因不能小于5个汉字！');
      Exit;
    end;
  end;
  ModalResult:=mrOk;
end;

end.
