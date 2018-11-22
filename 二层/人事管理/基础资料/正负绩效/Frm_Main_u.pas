unit Frm_Main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Frm_Punishment, Frm_Punishments,
  Buttons, Menus, ComCtrls, Mask, DBCtrls, StrUtils, Spin, DateUtils,
  ImgList;

type
  TFrmMain = class(TForm)
    edt_1: TEdit;
    lb_1: TLabel;
    pm_1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbgrd1: TDBGrid;
    btn1: TSpeedButton;
    edt_2: TEdit;
    chk_1: TCheckBox;
    edt_3: TEdit;
    dtp1: TDateTimePicker;
    lb_5: TLabel;
    dtp2: TDateTimePicker;
    chk_2: TCheckBox;
    ts2: TTabSheet;
    grb_2: TGroupBox;
    lb_2: TLabel;
    bbt_4: TBitBtn;
    edt_6: TEdit;
    lb_14: TLabel;
    dtp4: TDateTimePicker;
    bvl1: TBevel;
    dbgrd2: TDBGrid;
    bbt_3: TBitBtn;
    N4: TMenuItem;
    EXCEL1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bbt_4Click(Sender: TObject);
    procedure edt_3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bbt_5Click(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_1KeyPress(Sender: TObject; var Key: Char);
    procedure bbt_3Click(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
  private
    { Private declarations }
    procedure HotKeyDown(var Msg: Tmessage); message WM_HOTKEY;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  HotKeyId: Integer;
  
implementation
uses
   common, Pick_Item_Single, ConstVar, Damo;
{$R *.dfm}

//增加奖惩记录
procedure TFrmMain.N1Click(Sender: TObject);
begin

end;

//修改奖惩记录
procedure TFrmMain.N2Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,10,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if DM.dsSetJC.IsEmpty then ShowMessage('当前记录为空！')
  else
  begin
    DM.tag := 1;
    FrmPunishment := TFrmPunishment.Create(nil);
    FrmPunishment.ShowModal;
    FrmPunishment.Free;
  end;
end;

//删除奖惩记录
procedure TFrmMain.N3Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,10,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if DM.dsSetJC.IsEmpty then ShowMessage('当前记录为空！')
  else
  begin
   if MessageDlg('确定要删除该行记录吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.qrytmp.SQL.Text := Format('delete from employee_rewards_punishment where rkey= ''%s'' ', [IntToStr(DM.dsSetJC.FieldByName('rkey').Value)]);
      DM.qrytmp.ExecSQL;
    end;
    DM.dsSetJC.Close;
    DM.dsSetJC.Open;
  end;
end;

//关闭
procedure TFrmMain.bbt_2Click(Sender: TObject);
begin
  UnRegisterHotKey(handle, HotKeyId);
  Application.Terminate;
end;

//查询
procedure TFrmMain.bbt_1Click(Sender: TObject);
begin
  edt_1.Enabled := True;
  if  (Trim(edt_1.Text) = '') and (Trim(edt_2.Text) = '') then
  begin
    Application.MessageBox('员工工号不能为空！','提示',64);
    Exit;
  end;
  DM.dsSetYG.Close;
  DM.dsSetYG.CommandText := Format('select employeemsg.rkey, employeecode,ondutytime, chinesename, departmentname '
      + 'from employeemsg, datadepartment where employeemsg.departmentid=datadepartment.rkey '
      + 'and employeecode = ''%s'' ', [Trim(edt_1.Text)]);
 DM.dsSetYG.Open;
  if (DM.dsSetYG.RecordCount < 1) and (pos('*', Trim(edt_1.Text))<=0) then
  begin
    Application.MessageBox('您输入的员工不存在,请重新输入','提示',64);
    dbgrd1.DataSource.DataSet.Close;
    edt_1.Text := '';
    edt_2.Text := '';
    edt_6.Text := '';
    Exit;
  end;
  with DM.dsSetJC do
  begin
    Close;
    CommandText := 'select employeecode, chinesename, departmentname, '
      + 'ondutytime, departmentcode, datadetail.item, employee_rewards_punishment.* '
      + 'from employeemsg,datadepartment,employee_rewards_punishment,datadetail '
      + 'where employeemsg.departmentid=datadepartment.rkey and employee_rewards_punishment.employeeid=employeemsg.rkey '
      + 'and dbo.datadetail.rkey=employee_rewards_punishment.type ';
    if (Trim(edt_1.Text) <> '') and (Trim(edt_1.Text) <> '*') then
      CommandText := CommandText + Format('and employeecode like ''%s'' ', ['%'+StringReplace(Trim(edt_1.Text),'*','',[rfReplaceAll])+'%']);
    if chk_2.Checked then
      CommandText := CommandText + Format('and effectdate between ''%s'' and ''%s'' ', [DateTimeToStr(dtp1.DateTime), DateTimeToStr(dtp2.DateTime)+' 23:59:59']);
    if chk_1.Checked and (Trim(edt_3.Text) <> '') then
      CommandText := stuffString(CommandText, 8, 0, 'top '+trim(edt_3.Text)+' ');
    if Trim(edt_2.Text) <> ''then
      CommandText := CommandText + Format('and departmentcode=''%s'' ', [Trim(edt_2.Text)]);
    CommandText := CommandText+ 'order by employee_rewards_punishment.effectdate DESC ';
    Open;
    if (IsEmpty) and (Trim(edt_1.Text) <> '') and (Trim(edt_1.Text) <> '*') then
    begin
      Application.MessageBox('对不起，查无奖惩记录！','提示',64);
    end;
    if (IsEmpty) and (Trim(edt_2.Text) <> '')then
    begin
      Application.MessageBox('对不起，该部门不存在奖惩记录！','提示',64);
      edt_2.Text := '';
      edt_6.Text := '';
    end;
  end;
 DM.dsSetJC.Last;
end;

//部门选择
procedure TFrmMain.btn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  edt_1.Text := '*';
  edt_1.Enabled := False;
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.conADOCon;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_2.Text := frmPick_Item_Single.adsPick.FieldValues['departmentcode'];
      edt_6.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

//个人月汇总明细
procedure TFrmMain.bbt_4Click(Sender: TObject);
begin
  DM.dsJC.close;
  DM.dsJC.CommandText := Format('select distinct employeemsg.rkey,employeecode,chinesename,departmentname , '
    + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey and flag= 0 '
    + 'and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ZJL, '
    + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey  and flag = 1 '
    + 'and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ZCF '
    + 'from employee_rewards_punishment '
    + 'inner join employeemsg on employee_rewards_punishment.employeeid=employeemsg.rkey '
    + 'inner join dbo.datadepartment on employeemsg.departmentid=datadepartment.rkey '
    + 'where year(effectdate)=''%s'' and month(effectdate)=''%s'' ', [intToStr(YearOf(dtp4.DateTime)),
    IntToStr(MonthOf(dtp4.DateTime)),intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime))]);
  DM.dsJC.Open;
end;

procedure TFrmMain.edt_3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,'a'..'z','A'..'Z']) then Key := #0;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  year,month,day: word;
begin
  if not App_init_2(DM.conADOCon) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
  //user_ptr:='3';
  //vprev:='4';
  {DM.conADOCon.ConnectionString := 'Provider=SQLOLEDB.1;Password=Topcb_0.188;Persist Security Info=True;User ID=sa;Initial Catalog=wisdompcb_bakhr; '
    + 'Data Source=172.18.2.38;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W008119;Use Encryption for '
    + 'Data=False;Tag with column collation when possible=False';
  DM.conADOCon.Open;}
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  HotKeyId := GlobalAddAtom('MyHotKey') - $C000;
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, 86);
  DM.dsSetJC.Open;
  decodedate(Now,year,month,day);
  dtp1.DateTime := encodedate(year,month,1); //第一天
  dtp2.DateTime := incmonth(dtp1.DateTime)-1; //最后一天
  dtp4.DateTime := Now();
end;

procedure TFrmMain.HotKeyDown(var Msg: Tmessage);
begin
 if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = 86) then // 假设热键为ALT+V
 begin
   if DM.dsSetJC.CommandText <> '' then  ShowMessage(DM.dsSetJC.CommandText);
 end;
end;

//新增奖惩记录
procedure TFrmMain.bbt_5Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,10,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  DM.tag := 0;
  FrmPunishment := TFrmPunishment.Create(nil);
  FrmPunishment.ShowModal;
  FrmPunishment.Free;
  DM.dsSetJC.Close;
  DM.dsSetJC.Open;
end;

procedure TFrmMain.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If DM.dsSetJC.FieldByName('flag').Value = 1 then
  Begin
      DBGrd1.Canvas.Font.Color := clRed;
      DBGrd1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

procedure TFrmMain.edt_1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9','*',#8]) then Key := #0;
end;

procedure TFrmMain.bbt_3Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(DBGrd2,self.Caption);
end;

procedure TFrmMain.pgc1Change(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 1 then
  begin
    DM.dsJC.Close;
    DM.dsJC.Open;
  end;
end;

//批量增加将成记录
procedure TFrmMain.N4Click(Sender: TObject);
begin
  FrmPunishments := TFrmPunishments.Create(nil);
  FrmPunishments.ShowModal;
  FrmPunishments.Free;
end;

procedure TFrmMain.EXCEL1Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(DBGrd1,self.Caption);
end;

end.






