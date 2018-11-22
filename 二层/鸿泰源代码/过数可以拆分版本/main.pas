//****************************************************************************//
//****  Programer: zhq
//****  Date: Aug. 2007
//****
//****
//****************************************************************************//
unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    Label3: TLabel;
    edtWONo: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StatusBar1: TStatusBar;
    spbtnLogOff: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtUser: TEdit;
    edtPswd: TEdit;
    Label4: TLabel;
    edtUserPswd: TEdit;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPswdKeyPress(Sender: TObject; var Key: Char);
    procedure edtUserExit(Sender: TObject);
    procedure edtPswdExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtWONoKeyPress(Sender: TObject; var Key: Char);
    procedure spbtnLogOffClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtUserPswdKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
  private
    { Private declarations }
    iS_Log_On:boolean;//登录状态 0.未登录,1 已登录
  public
    { Public declarations }
    function Check_User(UserId:string):boolean;//验证用户
    function Check_UserPswd(UserId:string;Pswd:string):boolean;//验证用户和密码
  end;

var
  frmMain: TfrmMain;

implementation
uses dm,MyClass,common,Wo_Count,Pswd_set,
Pick_Item_Single ,ConstVar, Pick_WorkShop, DB;
{$R *.dfm}


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;

//  vprev:='4';
//  user_ptr:='4';
//  dmcon.ADOConnection1.Open;

  iS_Log_On:=false;//用户未登录
  StatusBar1.Panels[1].Text := '未登录';
end;

function TfrmMain.Check_User(UserId: string): boolean;
begin
  if trim(UserId)='' then
  begin
    result := false;
    ShowMsg('用户不能为空，请重新输入',1);
    abort;
  end;
  MyDataClass.OpenDataSetByPara(Userid,dmcon.adsUserInfo);
  if dmcon.adsUserInfo.IsEmpty then
  begin
    result := false;
    ShowMsg('该用户不存在，请重新输入',1);
  end
  else if trim(dmcon.adsUserInfo.FieldByName('active_flag').ASString) <> 'Y' then
  begin
    result := false;
    ShowMsg('该用户已经离职',1);
  end
  else if dmcon.adsUserInfo.FieldByName('PRIV').AsInteger <> 1 then
  begin
    result := false;
    ShowMsg('该用户无过数权限，请联系管理员',1);
  end
  else
    result := true;
end;

procedure TfrmMain.edtUserKeyPress(Sender: TObject; var Key: Char);
var
  UserId,Pswd:string;
  i:integer;
begin
  if key=#13 then
  begin
    if Pos('#',edtUser.Text) > 0 then //用户名和密码一起输入,说明是扫描进入
    begin
      i:=Pos('#',edtUser.Text);
      UserId:=trim(copy(edtUser.Text,1,i-1));
      Pswd:=trim(copy(edtUser.Text,i+1,20));
      if UserId = '' then
      begin
        ShowMsg('用户名不能为空',1);
        abort;
      end;
      if Pswd = '' then
      begin
        ShowMsg('密码不能为空',1);
        abort;
      end;
      iS_Log_On:= Check_UserPswd(Userid,Pswd);
      if iS_Log_On then
      begin
        StatusBar1.Panels[1].Text := '已登录';
        StatusBar1.Panels[3].Text := UserId;
        edtWONo.SetFocus;
      end
      else
      begin
        StatusBar1.Panels[1].Text := '未登录';
        StatusBar1.Panels[3].Text := '';
      end;
    end
    else
    begin
      if not Check_User(trim(edtUser.Text)) then
        edtUser.SetFocus
      else
        edtPswd.SetFocus;
    end;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  dmcon.aqBasicParam.Close;
  dmcon.aqBasicParam.open;
  MyDataClass :=TMyDataClass.Create(dmcon.ADOConnection1);
  if IS_Stock_Inventorying then
  begin
    ShowMsg('在制品正在盘点，不能过数，请检查！',1);
    close;
  end;
  PageControl1Change(sender);
  dmcon.tmp.SQL.Text:='select ppc_control10 from data0192';
  dmcon.tmp.Open;
  PageControl1.Pages[1].TabVisible:=dmcon.tmp.Fields[0].AsInteger=0;
  dmcon.tmp.Close;
end;

procedure TfrmMain.edtPswdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    iS_Log_On := Check_UserPswd(trim(edtUser.Text),trim(edtPswd.Text));
    if iS_Log_On then
    begin
      StatusBar1.Panels[1].Text := '已登录';
      StatusBar1.Panels[3].Text := edtUser.Text;
      edtWONo.SetFocus;
    end
    else
    begin
      StatusBar1.Panels[1].Text := '未登录';
      StatusBar1.Panels[3].Text := '';
    end;
    edtPswd.Text:='';
  end;
end;

function TfrmMain.Check_UserPswd(UserId, Pswd: string): boolean;
var
  tmpstr:string;
begin
  if not Check_User(UserId) then
    result := false
  else
  begin
    if trim(Pswd)='' then
    begin
      result := false;
      ShowMsg('密码不能为空,请重新输入',1);
      abort;
    end;
    tmpstr:=Base64_Decode(trim(dmcon.adsUserInfo.FieldByName('LOGIN_PASS').AsString));
    if Pswd <> tmpstr then
    begin
      result := false;
      ShowMsg('密码不正确，请重新输入!',1);
    end
    else
      result:=true;
  end;
end;

procedure TfrmMain.edtUserExit(Sender: TObject);
var
  tmp:char;
begin
  if trim(edtUser.Text)='' then exit;
  tmp:=#13;
  edtUserKeyPress(sender,tmp);
end;

procedure TfrmMain.edtPswdExit(Sender: TObject);
var
  tmp:char;
begin
  if trim(edtPswd.Text)='' then
   begin
    if iS_Log_On then iS_Log_On:=false;
    StatusBar1.Panels[1].Text := '未登录';
    StatusBar1.Panels[3].Text := '';
    exit;
   end;
  tmp:=#13;
  edtPswdKeyPress(sender,tmp);
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.edtWONoKeyPress(Sender: TObject; var Key: Char);
begin
  if edtWONo.Text = '' then exit;
  if key = #13 then
  begin  
   if not iS_Log_On then
    begin                            
      ShowMsg('您尚未登录,请确认!',1);
      abort;
    end; 
    with TfrmWO_Count.Create(Application)do
    try
      enter(dmcon.adsUserInfo.FieldByName('rkey').AsInteger,edtWONo.Text);
      if Modalresult = mrok then
        edtWONo.Text := '' ;
    finally
      release;
    end;
  end;
end;

procedure TfrmMain.spbtnLogOffClick(Sender: TObject);
begin
  iS_Log_On:= false;
  edtUserPswd.Text:='';
  StatusBar1.Panels[1].Text := '未登录';
  StatusBar1.Panels[3].Text := '';
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  if not iS_Log_On then
  begin
    ShowMsg('请先登录,再修改密码!',1);
    abort;
  end;
  with TfrmPswd_Set.Create(Application)do
  try
    ShowModal;
  finally
    release;
  end;
end;

procedure TfrmMain.edtUserPswdKeyPress(Sender: TObject; var Key: Char);
var
  UserId,Pswd:string;
  i:integer;
begin
  if key=#13 then
  begin
    iS_Log_On:=false;
    if Pos('$',edtUserPswd.Text) > 0 then //用户名和密码一起输入,说明是扫描进入
    begin
      i:=Pos('$',edtUserPswd.Text);
      UserId:=trim(copy(edtUserPswd.Text,1,i-1));
      Pswd:=trim(copy(edtUserPswd.Text,i+1,20));
      if UserId = '' then
      begin
        ShowMsg('用户名不能为空',1);
        abort;
      end;
      if Pswd = '' then
      begin
        ShowMsg('密码不能为空',1);
        abort;
      end;
        iS_Log_On:=Check_User(UserId) and (trim(dmcon.adsUserInfo.FieldByName('LOGIN_PASS').AsString)=Pswd);
      if iS_Log_On then
      begin
        StatusBar1.Panels[1].Text := '已登录';
        StatusBar1.Panels[3].Text := UserId;
        edtWONo.SetFocus;                       
      end
      else
      begin
        StatusBar1.Panels[1].Text := '未登录';
        StatusBar1.Panels[3].Text := '';
      end;
    end;
  end;
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    edtUserPswd.SetFocus
  else
    edtUser.SetFocus;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var
 InputVar: PDlgInput ;
 Key:char;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields := 'Work_Order_Number/作业单号/140,MANU_PART_NUMBER/本厂编号/100,'+
   'DEPT_CODE/工序编号/80,DEPT_NAME/工序名称/100,CUT_NO/配料单号/100,Qty_BackLog/在线数量/80,MANU_PART_DESC/客户型号/80';
  InputVar.Sqlstr :='SELECT D34.DEPT_CODE, D34.DEPT_NAME, D06.rKey,D06.WORK_ORDER_NUMBER, '+
    'D06.CUT_NO, D56.Qty_BackLog,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC ' +
    'FROM Data0006 D06 INNER JOIN Data0056 D56 ON D06.RKEY = D56.WO_PTR '+
    'INNER JOIN Data0034 D34 ON D56.DEPT_PTR = D34.RKEY INNER JOIN '+
    'Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN '+
    'data0492 d492 ON D06.CUT_NO = d492.CUT_NO '+
    'where D06.prod_status in(3,4) and d492.tstatus in(0,2)';
  if Edit1.Text<> '' then
   InputVar.Sqlstr := InputVar.Sqlstr +' and D56.DEPT_PTR in '+label6.caption;
  InputVar.Sqlstr := InputVar.Sqlstr + ' order by D06.WORK_ORDER_NUMBER';

  inputvar.KeyField := 'WORK_ORDER_NUMBER';
  inputvar.InPut_value := edtWONo.Text;
  InputVar.AdoConn := dmcon.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal = mrok then
  begin
    Key:=#13;
    edtWoNo.Text := frmPick_Item_Single.adsPick.Fieldbyname('WORK_ORDER_NUMBER').AsString;
    edtWoNoKeyPress(sender,Key);
  end
  else
   begin
    edtWoNo.SetFocus;
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end;
end;

{ //end try
var
  tmp_str:string;
  Key:char;
begin
  tmp_str:= Pick_Work_Order(edtWoNo.Text,dmcon.ADOConnection1,2);
  if tmp_str <> '' then
  begin
    Key:=#13;
    edtWoNo.Text := tmp_str;
    edtWoNoKeyPress(sender,Key);
  end;
end; }
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  with TfrmPick_WorkShop.Create(Application)do
  try
  if Edit1.Text<>'' then
    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+'and rkey not in '+label6.Caption;

    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+' order by dept_Code';
    Enter(0);
    if ShowModal = mrok then
    begin
      cdsPickWorkShop.First;
      Label6.Caption:=Copy(label6.Caption,1,Length(label6.Caption)-1);
      if Length(Label6.Caption)>1 then
       label6.Caption:=label6.Caption+',';
      while not cdsPickWorkShop.Eof do
      begin
       if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
        begin
         Edit1.Text:=Edit1.Text+cdsPickWorkShop.fieldbyName('Dept_Code').AsString+';';
         if cdsPickWorkShop.RecNo<>cdsPickWorkShop.RecordCount then
          label6.Caption:=label6.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+','
         else
          label6.Caption:=label6.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+')';
        end;
        cdsPickWorkShop.next;
      end;
    end;
  finally
    release;
  end;
end;

procedure TfrmMain.Edit1DblClick(Sender: TObject);
begin
Edit1.Text:='';
label6.Caption:='(,';
end;

end.
