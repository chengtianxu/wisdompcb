{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit ServerContainerUnit1;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSAuth, IPPeerServer, IdTCPConnection, System.Generics.Collections;

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DSAuthenticationManager1: TDSAuthenticationManager;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DSTCPServerTransport1Connect(Event: TDSTCPConnectEventObject);
    procedure DSTCPServerTransport1Disconnect(
      Event: TDSTCPDisconnectEventObject);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
  private
    { Private declarations }
    FTCPConnects: TObjectDictionary<TIdTCPConnection,TDSTCPChannel>;
    FTCPConnectTime: TDictionary<Integer,TDateTime>;
    procedure AddToUserList(AConn:TIdTCPConnection;AChannel:TDSTCPChannel);
  public
    procedure RefreshUserList;
    procedure DisConnectConnection(ACon:TIdTCPConnection);//管理员主动断开客户端
  end;

var
  ServerContainer1: TServerContainer1;

implementation

uses Winapi.Windows, ServerMethodsUnit1, DM;

{$R *.dfm}


procedure TServerContainer1.AddToUserList(AConn: TIdTCPConnection;
  AChannel: TDSTCPChannel);
var
  LOk: Boolean;
begin
  if (AConn<>nil) and (AChannel<>nil) and (AChannel.ChannelInfo<>nil)
     and (AChannel.ChannelInfo.ClientInfo.IpAddress<>EmptyStr)
  then
  begin
    LOk := True;
  end else
    LOk := False;

  dm1.cdsUser.Append;
  if LOk then
  begin
    with AChannel.ChannelInfo.ClientInfo do
    begin
      dm1.cdsUser.FieldByName('PConObj').AsInteger := Integer(Pointer(AConn));
      dm1.cdsUser.FieldByName('IP').AsString := IPAddress;
      dm1.cdsUser.FieldByName('Port').AsString := ClientPort;
      dm1.cdsUser.FieldByName('Protocol').AsString := Protocol;
      if FTCPConnectTime.ContainsKey(Integer(Pointer(AConn))) then
        dm1.cdsUser.FieldByName('ConTime').AsDateTime := FTCPConnectTime.Items[Integer(Pointer(AConn))];
      dm1.cdsUser.FieldByName('ALive').AsBoolean := True;
    end;
  end else
    dm1.cdsUser.FieldByName('PConObj').AsInteger := -1;
  dm1.cdsUser.Post;

end;

procedure TServerContainer1.DataModuleCreate(Sender: TObject);
begin
  FTCPConnects := TObjectDictionary<TIdTCPConnection,TDSTCPChannel>.Create;
  FTCPConnectTime := TDictionary<Integer,TDateTime>.Create;
end;

procedure TServerContainer1.DataModuleDestroy(Sender: TObject);
begin
  FTCPConnects.Free;
  FTCPConnectTime.Free;
end;

procedure TServerContainer1.DisConnectConnection(ACon: TIdTCPConnection);
var
  LChannel: TDSTCPChannel;
begin
  System.TMonitor.Enter(FTCPConnects);
  try
    if FTCPConnects.TryGetValue(ACon,LChannel) then
    begin
      LChannel.Close;
      if FTCPConnects.ContainsKey(ACon) then
      begin
        FTCPConnects.Remove(ACon);
      end;
    end
  finally
    System.TMonitor.Exit(FTCPConnects);
  end;
end;

procedure TServerContainer1.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  if (User = 'admin') and (Password = 'wisdomtopcb1077') then
  begin
    if FTCPConnects.Count <= dm1.FMaxConCount then
      valid := True
    else
      valid := False;
  end else
  begin
    valid := False;
  end;
end;

procedure TServerContainer1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;


procedure TServerContainer1.DSTCPServerTransport1Connect(
  Event: TDSTCPConnectEventObject);
begin
  System.TMonitor.Enter(FTCPConnects);
  try
     FTCPConnects.Add(TIdTCPConnection(Event.Connection),Event.Channel);
     FTCPConnectTime.Add(Integer(Pointer(Event.Connection)),Now);
  finally
    System.TMonitor.Exit(FTCPConnects);
  end;
end;

procedure TServerContainer1.DSTCPServerTransport1Disconnect(
  Event: TDSTCPDisconnectEventObject);
var
  LCon: TIdTCPConnection;
begin
  LCon := TIdTCPConnection(Event.Connection);
  System.TMonitor.Enter(FTCPConnects);
  try
    if FTCPConnects.ContainsKey(LCon) then
      FTCPConnects.Remove(LCon);
    if FTCPConnectTime.ContainsKey(Integer(Pointer(LCon))) then
      FTCPConnectTime.Remove(Integer(Pointer(LCon)));
  finally
    System.TMonitor.Exit(FTCPConnects);
  end;
end;

procedure TServerContainer1.RefreshUserList;
var
  LCon: TIdTCPConnection;
  LChanl: TDSTCPChannel;
begin
  dm1.cdsUser.DisableControls;
  dm1.cdsUser.First;
  while not dm1.cdsUser.Eof do
  begin
    dm1.cdsUser.Edit;
    dm1.cdsUser.FieldByName('Alive').AsBoolean := False;
    dm1.cdsUser.Post;
    dm1.cdsUser.Next;
  end;

  System.TMonitor.Enter(FTCPConnects);
  try
    for LCon in FTCPConnects.Keys do
    begin
      LChanl := FTCPConnects.Items[LCon];
      if not dm1.cdsUser.FindKey([Integer(Pointer(LCon))]) then
        AddToUserList(LCon,LChanl)
      else
      begin
        dm1.cdsUser.Edit;
        dm1.cdsUser.FieldByName('ALive').AsBoolean := True;
        dm1.cdsUser.Post;
      end;
    end;
    dm1.cdsUser.Filter := 'ALive = False';
    dm1.cdsUser.Filtered := True;
    while not dm1.cdsUser.IsEmpty do
      dm1.cdsUser.Delete;
  finally
    System.TMonitor.Exit(FTCPConnects);
    dm1.cdsUser.Filtered := False;
    dm1.cdsUser.EnableControls;
  end;
end;

end.

