unit unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  Container,Method, inifiles;

type
  Tdmqkwinserver = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;



var
  dmqkwinserver: Tdmqkwinserver;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  dmqkwinserver.Controller(CtrlCode);
end;

function Tdmqkwinserver.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure Tdmqkwinserver.ServiceStart(Sender: TService; var Started: Boolean);
var
  LIni: TIniFile;
  Lini2: TIniFile;
  Llst: TStringList;
  I: Integer;
  Lerr: OleVariant;
begin
  Llst := TStringList.Create;
  try
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'DBCon.ini');
  Lini2 := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Server.ini');
  try
    LIni.ReadSections(Llst);
    with TSvrMethods.Create do
    begin
      for I := 0 to Llst.Count - 1 do
      begin
        if not Intf_RefreshSqlBuffer(Llst[I],Lerr) then
          //lbl3.Caption := (VarToStr(Lerr));
          //ShowMessage(VarToStr(Lerr));
      end;
      Free;
    end;
    //lbl3.Caption := 'Refresh OK  ' + DateTimeToStr(Now);
  except on e: Exception do
  begin
//    ShowMessage(e.Message);
    LIni2.WriteString('err','err',e.Message);
  end;
  end;
  finally
    Llst.Free;
    lini.Free;
    Lini2.Free;
  end;
end;

end.
