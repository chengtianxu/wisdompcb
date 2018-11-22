unit Demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    adsMain: TADODataSet;
    dsMain: TDataSource;
    adsDetail: TADODataSet;
    dsDetail: TDataSource;
    adsMainrkey: TAutoIncField;
    adsMaindeptid: TIntegerField;
    adsMainpositionname: TWideStringField;
    adsMainqty_Dev: TIntegerField;
    adsMainqty_req: TIntegerField;
    adsMainqty_has: TIntegerField;
    adsMaindepartmentname: TWideStringField;
    adsMaindepartmentcode: TWideStringField;
    adsDetailrkey: TAutoIncField;
    adsDetailkeyid: TIntegerField;
    adsDetailreqtype: TWordField;
    adsDetailreqitem: TWideStringField;
    adsDetailstrtype: TStringField;
    qryTmp: TADOQuery;
    procedure adsMainAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.adsMainAfterScroll(DataSet: TDataSet);
begin
  DM.adsDetail.Close;
  DM.adsDetail.Parameters[0].Value:= DM.adsMainrkey.Value;
  DM.adsDetail.Open;
end;

end.
