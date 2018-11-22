unit main_082;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls;

type
  TfrmMain_082 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    N9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain_082: TfrmMain_082;

implementation
uses MyClass,common,Half_Finished_Prod_Deploy,dm,WO_Release,WOCtrl,Frm_WoCancel_u;
{$R *.dfm}

procedure TfrmMain_082.FormCreate(Sender: TObject);
begin  { }
  if not App_Init(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;

//  user_ptr:='785';
//  vprev:='4';
//  dmcon.ADOConnection1.Open;
end;

procedure TfrmMain_082.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  if Dmcon.tmpQry.Active then Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  Dmcon.tmpQry.SQL.Add('select rkey from data0400 where status = 0');
  Dmcon.tmpQry.Prepared ;
  Dmcon.tmpQry.Open ;
  if not Dmcon.tmpQry.IsEmpty then
  begin
    Dmcon.tmpQry.Close ;
    Dmcon.tmpQry.SQL.Clear ;
    ShowMsg('生产线在盘点,不能操作',1);
    exit;
  end;
  Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;

  with TfrmHalf_Finished_Prod_Deploy.Create(application) do
  try
    InitForm(0);
  finally
    free;
  end;
end;

procedure TfrmMain_082.FormShow(Sender: TObject);
begin
  MyDataClass :=TMyDataClass.Create(dmcon.ADOConnection1);
  Dmcon.tmpQry.Close;                          //最后工序提交入库数，但仓库未审核
  Dmcon.tmpQry.SQL.Text:='select getdate()';
  Dmcon.tmpQry.Open;
  sysdate:=Dmcon.tmpQry.Fields[0].AsDateTime;
end;

procedure TfrmMain_082.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain_082.N6Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain_082.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  if Dmcon.tmpQry.Active then Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  Dmcon.tmpQry.SQL.Add('select rkey from data0400 where status = 0');
  Dmcon.tmpQry.Prepared ;
  Dmcon.tmpQry.Open ;
  if not Dmcon.tmpQry.IsEmpty then
  begin
    Dmcon.tmpQry.Close ;
    Dmcon.tmpQry.SQL.Clear ;
    ShowMsg('生产线在盘点,不能操作',1);
    exit;
  end;
  Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  with TfrmWO_Release.Create(application) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmMain_082.N4Click(Sender: TObject);
begin
  with TfrmWOCtrl.Create(application) do
  try
    ShowModal;
  finally
    free;
    dmcon.adsWOCtrlList.Close;
  end;
end;

procedure TfrmMain_082.N7Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  Dmcon.tmpQry.SQL.Add('select rkey from data0400 where status = 0');
  Dmcon.tmpQry.Open ;
  if not Dmcon.tmpQry.IsEmpty then
  begin
    Dmcon.tmpQry.Close ;
    Dmcon.tmpQry.SQL.Clear ;
    ShowMsg('生产线在盘点,不能操作',1);
    exit;
  end;
  Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  if TComponent(Sender).Tag=0 then
    TFrm_WoCancel.init
  else with TfrmHalf_Finished_Prod_Deploy.Create(application) do
  try
    FisCancel:=true;             //Cancel deploy
    SpeedButton2.Visible:=false;
    SpeedButton3.Visible:=false;
    SpeedButton4.Visible:=false;
    SpeedButton5.Visible:=false;
    SpeedButton6.Visible:=false;
    SpeedButton7.Visible:=true;

    BitBtn3.Left:=SpeedButton2.Left;
    BitBtn4.Left:=SpeedButton3.Left;

    Caption:=Caption+'取消';
    DBGridEh3.PopupMenu:=PopupMenu1;

    InitForm(2);
  finally
    free;
  end;
end;

procedure TfrmMain_082.N9Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  if Dmcon.tmpQry.Active then Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;
  Dmcon.tmpQry.SQL.Add('select rkey from data0400 where status = 0');
  Dmcon.tmpQry.Prepared ;
  Dmcon.tmpQry.Open ;
  if not Dmcon.tmpQry.IsEmpty then
  begin
    Dmcon.tmpQry.Close ;
    Dmcon.tmpQry.SQL.Clear ;
    ShowMsg('生产线在盘点,不能操作',1);
    exit;
  end;
  Dmcon.tmpQry.Close ;
  Dmcon.tmpQry.SQL.Clear ;

  with TfrmHalf_Finished_Prod_Deploy.Create(application) do
  try
    InitForm(1);
  finally
    free;
  end;
end;

end.
