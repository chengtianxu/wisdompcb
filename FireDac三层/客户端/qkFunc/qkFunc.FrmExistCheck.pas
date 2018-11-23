unit qkFunc.FrmExistCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmqkfuncDialogFrmExistcheck = class(TForm)
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRet: Integer;//0-取消，1-切换，2-重新打开
  end;



implementation

{$R *.dfm}

procedure TfrmqkfuncDialogFrmExistcheck.btn1Click(Sender: TObject);
begin
  FRet := 2;
  ModalResult := mrOk;
end;

procedure TfrmqkfuncDialogFrmExistcheck.btn2Click(Sender: TObject);
begin
  FRet := 1;
  ModalResult := mrOk;
end;

procedure TfrmqkfuncDialogFrmExistcheck.btn3Click(Sender: TObject);
begin
  FRet := 0;
  ModalResult := mrCancel;
end;

end.
