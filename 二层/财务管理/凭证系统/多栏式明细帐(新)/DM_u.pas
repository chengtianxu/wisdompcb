unit DM_u;

interface           

uses
  SysUtils, Classes, DB, ADODB,Variants, Provider, DBClient,
  MConnect, SConnect, TConnect,Forms,controls,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    Tmp1: TADOQuery;
    Qry508: TADOQuery;
    ADOQ106: TADOQuery;
    ADOQ103: TADOQuery;
    Qry105_106: TADOQuery;
  private

  public


  end;

var
  DM: TDM;

implementation

{$R *.dfm}


end.
