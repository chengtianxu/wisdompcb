unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Buttons, StdCtrls, ActnList;

type
  TFrm_main = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    N8: TMenuItem;
    SpeedButton6: TSpeedButton;
    Action6: TAction;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses DM_u,common,Frm_ZZout_u,Frm_ZZrecv_u,Frm_Look_u;
{$R *.dfm}


procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOCon) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.caption:=application.Title;

//  user_ptr:='3';
//  vprev:='4';
//  dm.ADOCon.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrm_main.SpeedButton2Click(Sender: TObject);
begin
  if (vprev='1') or (vprev='3') then
  begin
    showmessage('您没有权限进行钻嘴收发操作...');
    exit;
  end;
  case TComponent(sender).Tag of
    1,3: TFrm_ZZout.init(TSpeedButton(sender).Tag);
    2,4: TFrm_ZZrecv.init(TSpeedButton(sender).Tag);
  end;
  DM.ADO160.Close;
  DM.ADO219.Close;
  DM.ADO220.Close;
  DM.ADO270.Close;
  DM.CDS160.Close;
  DM.CDS160.Filter:='Quan_valid>0';
  DM.ADO160.Filter:='';
end;

procedure TFrm_main.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.SpeedButton6Click(Sender: TObject);
begin
  with TFrm_Look.Create(nil) do
  try
    init;
    showmodal;
  finally
    free;
    DM.ADO220_1.Close;
    DM.ADO219_1.Close;
  end;
end;

end.
