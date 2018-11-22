unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TSmallintField;
    ADOQuery1FASSET_STATUS: TStringField;
    ADOQuery1IN_DEPRECIATION: TWordField;
    ADOQuery1v_status: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if dm.ADOQuery1IN_DEPRECIATION.Value=0
 then dm.ADOQuery1v_status.Value:='不计提折旧'
 else dm.ADOQuery1v_status.Value:='计提折旧';
end;

end.
