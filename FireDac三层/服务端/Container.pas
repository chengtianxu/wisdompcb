unit Container;

interface

uses
  System.SysUtils, System.Classes, IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSTCPServerTransport, Datasnap.DSAuth, Datasnap.DSServer,
  System.Generics.Collections,Winapi.Windows,ansistrings,


  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.StorageBin, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.Stan.Pool
  ;

type
  TdmContainer = class(TDataModule)
    DSServer1: TDSServer;
    DSServerClass1: TDSServerClass;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSTCPServerTransport1: TDSTCPServerTransport;
    FDManager1: TFDManager;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSTCPServerTransport1Connect(Event: TDSTCPConnectEventObject);
    procedure DSTCPServerTransport1Disconnect(
      Event: TDSTCPDisconnectEventObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //¿Ô√Ê¥Ê¥¢ AConDefName + _SqlName
    FSqlTxtList: TDictionary<string,string>;
  end;

var
  dmContainer: TdmContainer;

implementation

uses
  UIServer, Method, inifiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function qkStrToDateTime(AStr: string): TDateTime;
var
  LFmt: TFormatSettings;
begin
  LFmt := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  LFmt.ShortDateFormat:='yyyy-MM-dd';
  LFmt.DateSeparator:='-';
  //FSetting.TimeSeparator:=':';
  LFmt.LongTimeFormat:='hh:mm:ss';
  Result := StrToDateDef(AStr,0,LFmt);
end;

procedure TdmContainer.DataModuleCreate(Sender: TObject);
var
  LIni: TIniFile;
  Lerr: OleVariant;
  Lstr: AnsiString;
  LStr2: string;
  key1,key2: string;
  k1,k2: TArray<Byte>;
begin
  FSqlTxtList := TDictionary<string,string>.Create;
  //Exit;
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Server.ini');
  try
    try
      key1 := LIni.ReadString('Register','Key1','');
      key2 := LIni.ReadString('Register','Key2','');

      k1 := BytesOf(key1);
      SetLength(k1,Length(k1)+1);
      k1[High(k1)] := 0;

      k2 := BytesOf(key2);
      SetLength(k2,Length(k2)+1);
      k2[High(k2)] := 0;

      Lstr := ansistrings.StrPas(func2(PAnsiChar(k2),PAnsiChar(k1)));
      LStr2 := string(Lstr);
     // MonitorEnter(dmContainer.FSqlTxtList);
      try
        gRegEnableDate := qkStrToDateTime(lstr2);
      finally
        //MonitorExit(dmContainer.FSqlTxtList);
      end;
    except on e: Exception do
    begin
      lerr := e.Message;
    end;
    end;
  finally
    lini.Free;
  end;


end;

procedure TdmContainer.DataModuleDestroy(Sender: TObject);
begin
  FSqlTxtList.Free;
end;

procedure TdmContainer.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := Method.TSvrMethods;
end;

procedure TdmContainer.DSTCPServerTransport1Connect(
  Event: TDSTCPConnectEventObject);
begin
  MonitorEnter(frmServerUI.lbl2);
  try
    frmServerUI.lbl2.Tag := frmServerUI.lbl2.Tag + 1;
    frmServerUI.lbl2.Caption := IntToStr(frmServerUI.lbl2.Tag);
  finally
    MonitorExit(frmServerUI.lbl2);
  end;
end;

procedure TdmContainer.DSTCPServerTransport1Disconnect(
  Event: TDSTCPDisconnectEventObject);
begin
  MonitorEnter(frmServerUI.lbl2);
  try
    frmServerUI.lbl2.Tag := frmServerUI.lbl2.Tag - 1;
    frmServerUI.lbl2.Caption := IntToStr(frmServerUI.lbl2.Tag);
  finally
    MonitorExit(frmServerUI.lbl2);
  end;
end;

end.
