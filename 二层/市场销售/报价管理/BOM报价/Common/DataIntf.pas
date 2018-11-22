unit DataIntf;

interface
uses
  Classes, Datasnap.DBClient;

type
  IData = interface
  ['{48A58B2A-B58B-4520-8422-B1A5D2276600}']
    function CreateKeyID: string;
    procedure SetSql(ASql: string);
    function GetSql: string;
    function GetData: OleVariant;
    function PostData(AData: OleVariant): Boolean;
  end;

  IBOMPrice06 = interface(IData)
  ['{6C5D47B7-880A-48B1-9566-DE91CA993CF3}']
    function CreateBPNO(var seqno: Integer): string;
  end;

  ITmp = interface
  ['{F9FADB22-46F9-48C8-9689-91B0D2DC55D6}']
    function SqlOpen(ASql: string): OleVariant;overload;
    function SqlOpen(ASql: string;ACds: TClientDataSet): Boolean;overload;
  end;

implementation

end.
