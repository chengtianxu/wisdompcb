{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uLoginCallIntf;

interface
uses
  uSvrIntf, System.SysUtils;

function GetDataBySql(ASvrIP: string;APort: string;ADBName: string;ASql: string;out AData: OleVariant;out ErrMsg: string): Boolean;stdcall;
function PostDataByTable(ASvrIP: string;APort: string;ADBName: string;ATable: string;AData: OleVariant;out ErrMsg: string): Boolean;stdcall;
exports
  GetDataBySql,PostDataByTable;
implementation


function GetDataBySql(ASvrIP: string;APort: string;ADBName: string;ASql: string;out AData: OleVariant;out ErrMsg: string): Boolean;
var
  LCon: TdmSvrIntf;
begin
  LCon := TdmSvrIntf.Create(nil);
  try
    LCon.con1.Params.Clear;
    LCon.con1.Params.Add('Port=' + APort);
    LCon.con1.Params.Add('HostName='+ ASvrIP);
    LCon.con1.Params.Add('CommunicationProtocol=tcp/ip');
    LCon.con1.Params.Add('DSAuthenticationPassword=wisdomtopcb1077');
    LCon.con1.Params.Add('DSAuthenticationUser=admin');
    LCon.con1.Params.Add('DatasnapContext=datasnap/');
    try
      Result := LCon.ServerMethods1Client.IntfGetDataBySql(ASql,AData,ErrMsg,ADBName,'公共基础',False);
    except
      on E: Exception do
      begin
        ErrMsg := E.Message;
        Result := False;
      end;
    end;
  finally
    LCon.Free;
  end;
end;

function PostDataByTable(ASvrIP: string;APort: string;ADBName: string;ATable: string;AData: OleVariant;out ErrMsg: string): Boolean;
var
  LCon: TdmSvrIntf;
begin
  LCon := TdmSvrIntf.Create(nil);
  try
    LCon.con1.Params.Clear;
    LCon.con1.Params.Add('Port=' + APort);
    LCon.con1.Params.Add('HostName='+ ASvrIP);
    LCon.con1.Params.Add('CommunicationProtocol=tcp/ip');
    LCon.con1.Params.Add('DSAuthenticationPassword=wisdomtopcb1077');
    LCon.con1.Params.Add('DSAuthenticationUser=admin');
    LCon.con1.Params.Add('DatasnapContext=datasnap/');
    try
      Result := LCon.ServerMethods1Client.IntfPostDataByTable(ATable,AData,ErrMsg,ADBName,'公共基础');
    except
      on E: Exception do
      begin
        ErrMsg := E.Message;
        Result := False;
      end;
    end;
  finally
    LCon.Free;
  end;
end;


end.
