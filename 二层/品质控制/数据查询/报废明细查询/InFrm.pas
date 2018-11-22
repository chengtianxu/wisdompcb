unit InFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB;

type
  TfrmIN = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TBitBtn;
    ehIN: TDBGridEh;
    adsIN: TADODataSet;
    dsIN: TDataSource;
    adsINMANU_PART_NUMBER: TStringField;
    adsINQTY_REJECT: TFloatField;
    adsINPANELS: TIntegerField;
    adsINREJ_CODE: TStringField;
    adsINREJECT_DESCRIPTION: TStringField;
    adsINWORK_ORDER_NUMBER: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIN: TfrmIN;

implementation

uses main;

{$R *.dfm}

end.
