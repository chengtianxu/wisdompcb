unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;
type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOData720_1: TADOQuery;
    ADOData720_2: TADOQuery;
    ADOData720_3: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    DS3: TDataSource;
    ADOData720_1GrpName: TStringField;
    ADOData720_2user_login_name: TStringField;
    ADOData720_2user_full_name: TStringField;
    ADOData720_3user_login_name: TStringField;
    ADOData720_3user_full_name: TStringField;
    tmp: TADOQuery;
    ADOData720_2rkey73: TIntegerField;
    ADOData720_3rkey73: TIntegerField;
    procedure ADOData720_1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOData720_1AfterScroll(DataSet: TDataSet);
begin
  ADOData720_2.Close;
  ADOData720_2.Parameters[0].Value:=DM.ADOData720_1GrpName.Value;
  ADOData720_2.Open;
  ADOData720_3.Close;
  ADOData720_3.Parameters[0].Value:=DM.ADOData720_1GrpName.Value;
  ADOData720_3.Open;
end;

end.
