unit Query_DM;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConn1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1INV_PART_NUMBER: TStringField;
    qry1INV_NAME: TStringField;
    qry1INV_DESCRIPTION: TStringField;
    qry1QUAN_ON_HAND: TBCDField;
    qry1stdqty: TBCDField;
    qry1app_qty: TBCDField;
    qry1con_qty: TBCDField;
    qry1quan_assign: TBCDField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses MyClass,common;


{$R *.dfm}



end.
