unit StockPassFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DM, Mask, DBCtrls, MainFrm;

type
  TfrmStockPass = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    lbl3: TLabel;
    edtRealWeight: TEdit;
    edtPackCount: TEdit;
    mmoNote: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  DB, WZ_gUnit;

{$R *.dfm}

procedure TfrmStockPass.btn1Click(Sender: TObject);
begin
  if StrToFloatDef(edtRealWeight.Text,-1) <= 0 then
  begin
    ShowMessage('±ØÐëÌîÐ´ÖØÁ¿');
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
