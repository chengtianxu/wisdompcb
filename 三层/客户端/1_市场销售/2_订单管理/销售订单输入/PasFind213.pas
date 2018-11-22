unit PasFind213;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmFind213 = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ds213: TDataSource;
    cds213: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(sWhere: string);
  end;

var
  frmFind213: TfrmFind213;

implementation

{$R *.dfm}
procedure TfrmFind213.GetData(sWhere:string);
var LSQL213:string;
begin
  LSQL213 :=cds213.CommandText+sWhere;
  gSvrIntf.IntfGetDataBySql(LSQL213,cds213);
end;

end.
