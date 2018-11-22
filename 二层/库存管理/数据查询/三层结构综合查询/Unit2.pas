unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdActns, ActnList;

type
  TfrmQryMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    windows1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    N11: TMenuItem;
    N100: TMenuItem;
    N12: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQryMain: TfrmQryMain;

implementation
uses QryFieldsSet,ConstDeclare,Client_Func,DmConn,PUbFunc,Log,
  Qry250,MatrlInOut,POMatrl;
{$R *.dfm}

procedure TfrmQryMain.N2Click(Sender: TObject);
begin
  if not Assigned(frmQryFieldsSet) then
  begin
    frmQryFieldsSet := TfrmQryFieldsSet.Create(application);
    frmQryFieldsSet.Enter(MOD_QRY,'0','QryNo','SeqNo');
  end
  else
    frmQryFieldsSet.BringToFront;
end;

procedure TfrmQryMain.FormShow(Sender: TObject);
begin
{ vprev:='3';
 with TfrmLog.Create(Application)do
  try
    if showmodal <> mrok then
      application.Terminate;
  finally
    free;
  end;
      N3Click(sender);}
  if not LogIn_Server then
    application.Terminate
  else
    N3Click(sender);
 
end;

procedure TfrmQryMain.N6Click(Sender: TObject);
begin
  if not Assigned(frmQry250) then
  begin
    frmQry250 := TfrmQry250.Create(application);
    frmQry250.InitForm(101);
//    frmQry250.show;
  end
  else
    frmQry250.BringToFront;
end;

procedure TfrmQryMain.N3Click(Sender: TObject);
begin
  if not Assigned(frmMatrlInOut) then
  begin
    frmMatrlInOut := TfrmMatrlInOut.Create(application);
    frmMatrlInOut.OpenQryFields(0,0);
//    frmQry250.show;
  end
  else
    frmMatrlInOut.BringToFront;

{  with TfrmMatrlInOut.Create(application) do
  try
    OpenQryFields(0,0);
    ShowModal;
  finally
    free;
  end;}
end;

procedure TfrmQryMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin
  if frmQryMain.MDIChildCount >0 then
    for i := 0 to frmQryMain.MDIChildCount -1 do
      frmQryMain.MDIChildren[i].Close;

  if DmConn.pdmConn.SocketConnection1.Connected then
    DmConn.pdmConn.SocketConnection1.Connected := false;
  coMyQuery := nil;
  Action := cafree;
  application.Terminate;
end;

procedure TfrmQryMain.N4Click(Sender: TObject);
begin
  if Msg_Dlg_Ask('确定退出吗?','提示',1) then
  close;
end;

procedure TfrmQryMain.N5Click(Sender: TObject);
begin
  if not Assigned(frmPOMatrl) then
  begin
    frmPOMatrl := TfrmPOMatrl.Create(application);
    frmPOMatrl.OpenQryFields(0,0);
//    frmQry250.show;
  end
  else
    frmPOMatrl.BringToFront;
end;

procedure TfrmQryMain.N12Click(Sender: TObject);
begin
//
end;

end.
