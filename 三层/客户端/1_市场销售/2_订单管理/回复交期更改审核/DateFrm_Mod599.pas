unit DateFrm_Mod599;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TfrmDate_Mod599 = class(TfrmBase)
    Label1: TLabel;
    dtpDate: TDateTimePicker;
    edtQty: TEdit;
    Label2: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure edtQtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDate_Mod599: TfrmDate_Mod599;

implementation

{$R *.dfm}

procedure TfrmDate_Mod599.btnOKClick(Sender: TObject);
begin
  inherited;
  if (Trim(edtQty.Text) = '') or (Trim(edtQty.Text) = '0') then
  begin
    ShowMessage('完工数量不能为0或空值');
    exit;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmDate_Mod599.edtQtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9',#13]) then Abort;  //判断是否输入数字
end;

end.
