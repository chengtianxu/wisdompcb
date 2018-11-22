unit DMFrm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM1 = class(TDataModule)
    con1: TADOConnection;
    adsDetail: TADODataSet;
    adsMaster: TADODataSet;
    dsMaster: TDataSource;
    dsdetail: TDataSource;
    strngfldMastergrade_code: TStringField;
    wdstrngfldMastergrade_name: TWideStringField;
    wdstrngfldMastergrade_remark: TWideStringField;
    strngfldDetaildept_name: TStringField;
    strngfldDetaildept_code: TStringField;
    wdstrngfldDetaildept_note: TWideStringField;
    intgrfldDetailseq_no: TIntegerField;
    strngfldDetailparameter_name: TStringField;
    strngfldDetailtvalue: TStringField;
    qrytmp: TADOQuery;
    procedure adsMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

procedure TDM1.adsMasterAfterScroll(DataSet: TDataSet);
begin
  if not adsMaster.IsEmpty then
  begin
    adsDetail.Close;
    adsDetail.Parameters[0].Value := adsMaster.fieldbyname('grade_code').AsString;
    adsDetail.Open;
  end else
  begin
    adsDetail.Close;
  end;
end;

end.
