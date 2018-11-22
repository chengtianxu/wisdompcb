unit MatStock_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmMatStock_Mod280 = class(TfrmBase)
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    dsStock: TDataSource;
    cdsStock: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMatStock_Mod280: TfrmMatStock_Mod280;

implementation

{$R *.dfm}

end.
