unit PasMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmMoney = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnComit: TBitBtn;
    btnCanCle: TBitBtn;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnComitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMoney: TfrmMoney;

implementation

{$R *.dfm}

procedure TfrmMoney.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

procedure TfrmMoney.btnComitClick(Sender: TObject);
var
  tmp:Currency;
begin
  if not TryStrToCurr(Trim(Edit1.Text),tmp) then
  begin
    ShowMessage('输入金额不正确');
    Edit1.SetFocus;
    Exit;
  end;
  ModalResult:= mrYes;
end;

end.
