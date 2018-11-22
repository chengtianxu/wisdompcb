unit BOMBaoJiaInputPCsSize;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzSpnEdt, RzButton, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzLabel;

type
  TfrmBOMPaoJiainPutPCSSize = class(TForm)
    lbl1: TRzLabel;
    edt1: TRzEdit;
    btn1: TRzButton;
    btn2: TRzButton;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    edt2: TRzEdit;
    lbl4: TRzLabel;
    lbl5: TRzLabel;
    lbl6: TRzLabel;
    lbl7: TRzLabel;
    lbl8: TRzLabel;
    edtSetL: TRzEdit;
    edtSetW: TRzEdit;
    edtPcsPerSet: TEdit;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBOMPaoJiainPutPCSSize: TfrmBOMPaoJiainPutPCSSize;

implementation

{$R *.dfm}

procedure TfrmBOMPaoJiainPutPCSSize.btn1Click(Sender: TObject);
var
  LValue: Double;
  LIntValue: Integer;
begin
  if not TryStrToFloat(edt1.Text,LValue) or not TryStrToFloat(edt2.Text,LValue) then
  begin
    ShowMessage('´íÎóµÄPCS³ß´ç');
    Exit;
  end;
  if not TryStrToFloat(edtSetL.Text,LValue) or not TryStrToFloat(edtSetW.Text,LValue) then
  begin
    ShowMessage('´íÎóµÄSet³ß´ç');
    Exit;
  end;
  if not TryStrToInt(edtPcsPerSet.Text,LIntValue) then
  begin
    ShowMessage('´íÎóµÄPCS/SETÊý');
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmBOMPaoJiainPutPCSSize.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBOMPaoJiainPutPCSSize.edt1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key,['0'..'9','.',#8]) then
  begin
    Key := #0;
  end;
end;

end.
