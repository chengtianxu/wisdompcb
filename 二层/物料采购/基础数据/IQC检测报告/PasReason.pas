unit PasReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmReason = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    mmo1: TMemo;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReason: TfrmReason;

implementation

{$R *.dfm}

procedure TfrmReason.btnSaveClick(Sender: TObject);
begin
  if Trim(mmo1.Text) = '' then
  begin
    ShowMessage('请先输入不合格原因');
  end
  else ModalResult:=mrOk;
end;

end.
