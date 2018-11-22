unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DB, ADODB,
  ActnList, ToolWin, ComCtrls;

type
  TForm_Main = class(TForm)
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    SpeedButton7: TSpeedButton;
    StaticText1: TStaticText;
    N12: TMenuItem;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Action8: TAction;
    Action9: TAction;
    SpeedButton10: TSpeedButton;
    Action10: TAction;
    TA1: TActionList;
    N13: TMenuItem;
    SpeedButton6: TSpeedButton;
    N14: TMenuItem;
    SpeedButton2: TSpeedButton;
    Action11: TAction;
    N11: TMenuItem;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sys_longdate,sys_sortdate:tdatetime;
    rkey05:integer;
  end;

var
  Form_Main: TForm_Main;

implementation

uses PoInWh, DirectIn, common, Condition, OutWh, ReturnOut, demo,
  ReturnSearch, Audit, form_main_in, Section, InReport;

{$R *.dfm}


procedure TForm_Main.Action1Execute(Sender: TObject);
begin
if Application.MessageBox('确认要退出程序吗?', PChar('提示'),MB_YESNO)=6 then
application.Terminate;
end;

procedure TForm_Main.Action2Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
Form_PoIn:=TForm_PoIn.Create(nil);
try
Form_PoIn.ShowModal;
finally
Form_PoIn.Free;
end;
end;
end;
procedure TForm_Main.Action3Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
Form_DirectIn:=TForm_DirectIn.Create(nil);
try
Form_DirectIn.aded_flag:=1;
Form_directin.initd;
Form_DirectIn.ShowModal;
finally
Form_DirectIn.Free;
end;
end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin

//  dm.ADOConnection1.Open;
//  rkey73:= '1587';
//  user_ptr:='1953';
//  vprev:= '4';

  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  Caption := application.Title;

  with dm.tmpt do
  begin
  close;
  sql.Text:='select data0005.rkey as rkey05 from data0005  INNER JOIN Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR where data0073.rkey=:rkey73';
  Parameters[0].Value:=strtoint(rkey73);
  open;
  rkey05:=FieldByName('rkey05').Value;
  user_ptr:=FieldByName('rkey05').Value;
  end;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm_Main.Action7Execute(Sender: TObject);
begin
Form_condition:=TForm_condition.Create(nil);
try
Form_Condition.RadioGroup1.ItemIndex:=0;
Form_Condition.ShowModal;
finally
Form_Condition.Free;
end;
end;

procedure TForm_Main.Action8Execute(Sender: TObject);
begin
Form_condition:=TForm_condition.Create(nil);
try
Form_Condition.RadioGroup1.ItemIndex:=1;
Form_Condition.ShowModal;
finally
Form_Condition.Free;
end;
end;

procedure TForm_Main.Action9Execute(Sender: TObject);
begin
Form_condition:=TForm_condition.Create(nil);
try
Form_Condition.RadioGroup1.ItemIndex:=2;
Form_Condition.ShowModal;
finally
Form_Condition.Free;
end;
end;

procedure TForm_Main.Action4Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
Form_OutWh:=TForm_OutWh.Create(nil);
try
Form_OutWh.ShowModal;
finally
Form_OutWh.Free;
end;
end;
end;
procedure TForm_Main.Action5Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
with dm.ADOQuery1 do
begin
close;
sql.Text:='select * from data0171 where status=0 ';
open;
end;
if not dm.ADOQuery1.IsEmpty then
begin
MessageDlg('对不起,在线有材料截数还未完成,不能进行退货,请联系财务部!',mtInformation,[mbok],0);
exit;
end;
Form_ReturnOut:=TForm_ReturnOut.Create(nil);
try
Form_ReturnOut.ShowModal;
finally
Form_ReturnOut.Free;
end;
end;
end;


procedure TForm_Main.Action6Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
with dm.ADOQuery1 do
begin
close;
sql.Text:='select * from data0171 where status=0 ';
open;
end;
if not dm.ADOQuery1.IsEmpty then
begin
MessageDlg('对不起,在线有材料截数还未完成,不能进行修改,请联系财务部!',mtInformation,[mbok],0);
exit;
end;
Form_Audit:=TForm_Audit.Create(nil);
try
Form_Audit.ShowModal;
finally
Form_Audit.Free;
end;
end;
end;


procedure TForm_Main.Action10Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
with dm.ADOQuery1 do
begin
close;
sql.Text:='select * from data0171 where status=0 ';
open;
end;
if not dm.ADOQuery1.IsEmpty then
begin
MessageDlg('对不起,在线有材料截数还未完成,不能进行入库,请联系财务部!',mtInformation,[mbok],0);
exit;
end;
form_mainin:=tform_mainin.Create(application);
try
Form_MainIn.init;
Form_MainIn.ShowModal;
finally
form_mainin.Free;
end;
end;
end;

procedure TForm_Main.Action11Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
Form_Section:=TForm_Section.Create(application);
try
Form_Main.Hide;
Form_Section.ShowModal;
finally
Form_Section.Free;
end;
end;
end;


end.

