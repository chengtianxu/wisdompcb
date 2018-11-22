unit PasTmpTo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmTmpTo = class(TForm)
    Label1: TLabel;
    dtpkTmpTo: TDateTimePicker;
    btnComfirm: TBitBtn;
    btnCancel: TBitBtn;
    Memo1: TMemo;
    Label2: TLabel;
    procedure btnComfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    status:Integer;
    { Public declarations }
  end;

var
  frmTmpTo: TfrmTmpTo;

implementation

{$R *.dfm}

procedure TfrmTmpTo.btnComfirmClick(Sender: TObject);
begin
  if (status=2) and (Trim(Memo1.Lines.Text)='') then
  begin
    ShowMessage('请先填写退回原因，如果不填请选取消');
    Exit;
  end
  else ModalResult:=mrYes;
end;

procedure TfrmTmpTo.FormShow(Sender: TObject);
begin
  if status=2 then frmTmpTo.Caption:='退回原因'
end;

end.
