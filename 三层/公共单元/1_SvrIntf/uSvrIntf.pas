{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       ∞Ê»®À˘”– (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uSvrIntf;

interface

uses
  System.SysUtils, System.Classes, SvrIntfClientClassesUnit1, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr;

type
  TdmSvrIntf = class(TDataModule)
    con1: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;

end;

var
  gSvrConDM: TdmSvrIntf;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

constructor TdmSvrIntf.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TdmSvrIntf.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TdmSvrIntf.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
  begin
    con1.Open;
    FServerMethods1Client:= TServerMethods1Client.Create(con1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethods1Client;
end;

end.
