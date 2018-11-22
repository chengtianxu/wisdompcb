unit SheetAddFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmAddSheet = class(TForm)
    lbl1: TLabel;
    btnOK: TButton;
    edtW: TEdit;
    lbl2: TLabel;
    edtH: TEdit;
    btnCancel: TButton;
    lbl3: TLabel;
    edtSize: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddSheet: TfrmAddSheet;

implementation

{$R *.dfm}

procedure TfrmAddSheet.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddSheet.btnOKClick(Sender: TObject);
begin
  try
    StrToFloat(edtW.Text);
    StrToFloat(edtH.Text);
    ModalResult := mrOk;
  except
    ShowMessage('输入的大料尺寸错误！请重新输入.');
  end;
end;

end.
