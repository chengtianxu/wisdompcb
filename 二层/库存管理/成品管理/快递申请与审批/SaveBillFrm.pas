unit SaveBillFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, MainFrm;

type
  TfrmSaveBill = class(TForm)
    lbl1: TLabel;
    btn1: TButton;
    lbl2: TLabel;
    edtRealMoney: TEdit;
    mmoNote: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSaveBill.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
