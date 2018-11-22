unit TaxFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,uBaseFrm;

type
  TfrmTax_Mod29 = class(TfrmBase)
    Label1: TLabel;
    edtTaxCode: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtTax: TEdit;
    cbxShip: TCheckBox;
    cbxM: TCheckBox;
    btnS: TBitBtn;
    btnC: TBitBtn;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTax_Mod29: TfrmTax_Mod29;

implementation

{$R *.dfm}

end.
