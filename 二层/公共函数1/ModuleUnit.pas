unit ModuleUnit;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DtAddList: TADODataSet;
    DtUsSysTableName: TADODataSet;
    DtFrozCols: TADODataSet;
    DtPrimaryCheck: TADODataSet;
    DtIndexsQty: TADODataSet;
    DtGetDate: TADODataSet;
    DtData0014: TADODataSet;
    DtData0314: TADODataSet;
    DtData0844Last: TADODataSet;
    Dtdata0845: TADODataSet;
    DtData0844: TADODataSet;
    DtData0005: TADODataSet;
    DtData0843: TADODataSet;
    DtData0849: TADODataSet;
    DtData0849Last: TADODataSet;
    cmdUpdate: TADOCommand;
    Dtdata0828: TADODataSet;
    DtSQLResultValue: TADODataSet;
    DtData0073: TADODataSet;
    DtUsFieldDispSet1: TADODataSet;
    spDtFieldSet: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Self.ADOConnection1.Connected :=False;
   ADOConnection1.ConnectionString:='';
end;

end.
