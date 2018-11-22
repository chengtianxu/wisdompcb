unit BOMBaoJiaAdd2DTableFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzLabel;

type
  TfrmBOMBaoJiaAdd2dTable = class(TForm)
    lbl1: TRzLabel;
    edt1: TRzEdit;
    btn1: TRzButton;
    btn2: TRzButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBOMBaoJiaAdd2dTable: TfrmBOMBaoJiaAdd2dTable;

implementation

{$R *.dfm}

procedure TfrmBOMBaoJiaAdd2dTable.btn1Click(Sender: TObject);
begin
  if edt1.Text = '' then
  begin
    ShowMessage('表名不能为空');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmBOMBaoJiaAdd2dTable.btn2Click(Sender: TObject);
begin
  Close;
end;

end.
