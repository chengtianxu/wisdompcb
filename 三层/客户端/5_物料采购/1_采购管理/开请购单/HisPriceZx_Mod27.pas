unit HisPriceZx_Mod27;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmHisPriceZx_Mod27 = class(TfrmBase)
    DBGrid1: TDBGrid;
    Button1: TButton;
    cds204: TClientDataSet;
    ds204: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHisPriceZx_Mod27: TfrmHisPriceZx_Mod27;

implementation

{$R *.dfm}

end.
