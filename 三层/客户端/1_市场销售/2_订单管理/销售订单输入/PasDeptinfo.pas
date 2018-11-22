unit PasDeptinfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,uBaseFrm,ucommfunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient;

type
  TfrmDeptinfo = class(TfrmBase)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ds91: TDataSource;
    cds91: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(Arkey60:string);
  end;

var
  frmDeptinfo: TfrmDeptinfo;

implementation

{$R *.dfm}

{ TfrmDeptinfo }

procedure TfrmDeptinfo.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDeptinfo.GetData(Arkey60: string);
var LSQL60:string;
begin
  LSQL60:=cds91.CommandText+' and data0090.pact_ptr= '+Arkey60;
  gSvrIntf.IntfGetDataBySql(LSQL60,cds91);
end;

end.
