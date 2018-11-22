unit PasShowStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.ExtCtrls,uBaseFrm,ucommfunc, Data.DB, Datasnap.DBClient;

type
  TfrmShowStock = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    ds60_53: TDataSource;
    cds60_53: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(MANU_PART_NUMBER:string);
  end;

var
  frmShowStock: TfrmShowStock;

implementation

{$R *.dfm}

procedure TfrmShowStock.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmShowStock.GetData(MANU_PART_NUMBER: string);
var LSQL60:string;
begin
  LSQL60:=cds60_53.CommandText+' and t25.MANU_PART_NUMBER='''+MANU_PART_NUMBER+'''';
  gSvrIntf.IntfGetDataBySql(LSQL60,cds60_53);
end;

end.
