unit HisPrice_Mod27;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Datasnap.DBClient;

type
  TfrmHisPrice_Mod27 = class(TfrmBase)
    DBGrid1: TDBGrid;
    Button1: TButton;
    cds69: TClientDataSet;
    ds69: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHisPrice_Mod27: TfrmHisPrice_Mod27;

implementation

{$R *.dfm}

end.
