unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ds492: TDataSource;
    aq492: TADOQuery;
    aqtmp: TADOQuery;
    aq492code: TStringField;
    aq492name: TStringField;
    aq492pcs: TIntegerField;
    aq492area: TFloatField;
    aq492ord_pcs: TIntegerField;
    aq492ord_area: TFloatField;
    aq492area1_1: TFloatField;
    ADOQuery1: TADOQuery;
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
