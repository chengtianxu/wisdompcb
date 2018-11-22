unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ds489: TDataSource;
    ADOConnection1: TADOConnection;
    ads489: TADODataSet;
    aqtmp: TADOQuery;
    adsIN: TADODataSet;
    dsIN: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
