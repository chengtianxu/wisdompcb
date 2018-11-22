unit UPulishment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGridEh, DB, ADODB, DBCtrls;

type
  TfrmPulishment = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl13: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl17: TLabel;
    lbl5: TLabel;
    lbl11: TLabel;
    dbgrdh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    atncfldqry1id: TAutoIncField;
    wdstrngfldqry1DSDesigner: TWideStringField;
    wdstrngfldqry1DSDesigner2: TWideStringField;
    dtmfldqry1DSDesigner3: TDateTimeField;
    wdstrngfldqry1DSDesigner4: TWideStringField;
    wdstrngfldqry1DSDesigner5: TWideStringField;
    dtmfldqry1DSDesigner7: TDateTimeField;
    wdstrngfldqry1DSDesigner8: TWideStringField;
    fltfldqry1DSDesigner9: TFloatField;
    wdstrngfldqry1DSDesigner10: TWideStringField;
    wdstrngfldqry1DSDesigner1: TWideStringField;
    dbtxt1: TDBText;
    dbtxt2: TDBText;
    dbtxt3: TDBText;
    dbtxt4: TDBText;
    dbtxt5: TDBText;
    dbtxt6: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPulishment: TfrmPulishment;

implementation
        uses  udm;
{$R *.dfm}

end.
