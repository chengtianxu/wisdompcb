unit QryItemFrm_Mod725;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmQryItem_Mod725 = class(TfrmBase)
    grpDate: TGroupBox;
    lbl1: TLabel;
    dtpk1: TDateTimePicker;
    lbl2: TLabel;
    dtpk2: TDateTimePicker;
    rgSumaryMode: TRadioGroup;
    rgQryMode: TRadioGroup;
    rgFactory: TRadioGroup;
    btnSummit: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQryItem_Mod725: TfrmQryItem_Mod725;

implementation

{$R *.dfm}

end.
