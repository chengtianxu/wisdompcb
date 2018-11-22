unit BOMPricePrintSetFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmBomPricePrintSet = class(TForm)
    cbxParam: TCheckBox;
    cbxBOM: TCheckBox;
    cbxDeptPrice: TCheckBox;
    btn1: TButton;
    btn2: TButton;
    cbxYaheImg: TCheckBox;
    cbxDeptParam: TCheckBox;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmBomPricePrintSet.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBomPricePrintSet.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
