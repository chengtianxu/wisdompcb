unit DM_u;

interface           

uses
  SysUtils, Classes, DB, ADODB,PubFunc,Variants, Provider, DBClient,
  MConnect, SConnect, TConnect,Forms,controls,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    Tmp1: TADOQuery;
    ADOCashQry: TADOQuery;
    Qry105_106: TADOQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.dfm}


end.
