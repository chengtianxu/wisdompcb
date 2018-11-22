unit ViewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, MainFrm;

type
  TfrmView = class(TForm)
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl20: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtBillNO: TDBEdit;
    edtCustName: TDBEdit;
    edtTrantNote: TDBEdit;
    edtcusername: TDBEdit;
    edtDEPT_NAME: TDBEdit;
    edtCTime: TDBEdit;
    edtToUser: TDBEdit;
    edtToAddress: TDBEdit;
    edtToPhone: TDBEdit;
    edtItems: TDBEdit;
    edtRealWeight: TDBEdit;
    edtPackCount: TDBEdit;
    edtStockPassName: TDBEdit;
    edtStockPassTime: TDBEdit;
    dbedtfstPassName: TDBEdit;
    dbedtFstPassTime: TDBEdit;
    dbedtSecPassName: TDBEdit;
    dbedtSecPassTime: TDBEdit;
    edtBillSaveName: TDBEdit;
    edtBillSaveTime: TDBEdit;
    edtTrantNote1: TDBEdit;
    edtRealMoney: TDBEdit;
    btn1: TButton;
    grp1: TGroupBox;
    rbOK: TRadioButton;
    rbNO: TRadioButton;
    lbl2: TLabel;
    dbmmoTrantNote: TDBMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmView.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
