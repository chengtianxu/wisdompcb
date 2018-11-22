unit DmConn;

interface

uses
  SysUtils, Classes, DB, DBClient, SConnect, MConnect, ObjBrkr;

type
  TpdmConn = class(TDataModule)
    SocketConnection1: TSocketConnection;
    SimpleObjectBroker1: TSimpleObjectBroker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pdmConn: TpdmConn;

implementation

{$R *.dfm}

end.
