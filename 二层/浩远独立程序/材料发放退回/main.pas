unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, ActnList, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    SpeedButton6: TSpeedButton;
    N10: TMenuItem;
    Action6: TAction;
    Label1: TLabel;
    SpeedButton7: TSpeedButton;
    Action7: TAction;
    N11: TMenuItem;
    SpeedButton8: TSpeedButton;
    Action8: TAction;
    N12: TMenuItem;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
   sys_longdate,sys_sortdate:tdatetime;
   employee_name:string; 
  end;

var
  Form1: TForm1;

implementation

uses damo, putoutinvt_dept, putoutmisc_dept, putoutinvt_inspect,
  putout_bill, putoutinvt_quota,common, duanxin, putoutinvt_linliao;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin       
  if dm.ADOConnection1.Connected then
    begin
      showmessage('程序处于开发模式下运行，请在发布前断开数据库连接后编译！');
      rkey73 := '1';
      vprev := '4';
    end
  else
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;                     
  self.Caption:=application.Title;


//  rkey73 := '2522';
//  vprev := '2';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;


procedure TForm1.Action1Execute(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
     messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form2:=tform2.Create(application);
    dm.ado04.Close;
    dm.ado04.Open;
    Form2.init;
    form2.Edit1.Text:=dm.ado04SEED_VALUE.Value;
    form2.StatusBar1.Panels[1].Text:=self.employee_name;
    form2.StatusBar1.Panels[2].Text:='发料日期:'+
    formatdatetime('yyyy-mm-dd HH:mm:ss',self.sys_longdate);
    form2.ShowModal;
  finally
    form2.Free;
  end;
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form4:=tform4.Create(application);
    form4.init;
    form4.StatusBar1.Panels[1].Text:=self.employee_name;
    form4.StatusBar1.Panels[2].Text:='发料日期:'+
    formatdatetime('yyyy-mm-dd HH:mm:ss',self.sys_longdate);
    form4.ShowModal;
  finally
   form4.Free;
  end;
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form3:=tform3.Create(application);
 dm.ado04.Close;
 dm.ado04.Open;
 Form3.init;
 form3.Edit1.Text:=dm.ado04SEED_VALUE.Value;
 form3.StatusBar1.Panels[1].Text:=self.employee_name;
 form3.StatusBar1.Panels[2].Text:='发料日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',self.sys_longdate);
 form3.ShowModal;
finally
 form3.Free;
end;
end;

procedure TForm1.Action5Execute(Sender: TObject);
begin
try
 form5:=tform5.Create(application);
 form5.ShowModal;
finally
 form5.Free;
end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 count_no:string;
begin
if dm.ADOConnection1.Connected then
 begin
  if dm.find_phycount(count_no) then
  begin
   messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+count_no,
   mtinformation,[mbcancel],0);
   application.Terminate;
  end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT GETDATE() AS sys_date,'+#13+
     'CONVERT(datetime, CONVERT(varchar, GETDATE(), 101), 101) AS sort_date';
    open;
    self.sys_longdate:=fieldvalues['sys_date'];
    self.sys_sortdate:=fieldvalues['sort_date'];
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select EMPLOYEE_PTR from data0073 where rkey='+rkey73;
    open;
    user_ptr:=fieldvalues['EMPLOYEE_PTR'];
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select EMPLOYEE_NAME from data0005 where rkey='+user_ptr;
    open;
    self.employee_name:=fieldvalues['EMPLOYEE_NAME'];
   end;

  end;
end;

procedure TForm1.Action6Execute(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
  try
   form6:=tform6.Create(application);
   dm.ado04.Close;
   dm.ado04.Open;
   Form6.init;
   form6.Edit1.Text:=dm.ado04SEED_VALUE.Value;
   form6.StatusBar1.Panels[1].Text:=self.employee_name;
   form6.StatusBar1.Panels[2].Text:='发料日期:'+
   formatdatetime('yyyy-mm-dd HH:mm:ss',self.sys_longdate);
   form6.ShowModal;
  finally
   form6.Free;
  end;
end;

procedure TForm1.Action7Execute(Sender: TObject);
begin
try
 form_duanxin:=tform_duanxin.Create(application);

 if form_duanxin.ShowModal=mrok then
  begin

  end;
finally
 form_duanxin.Free;
end;
end;

procedure TForm1.Action8Execute(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form8:=tform8.Create(application);
    dm.ado04.Close;
    dm.ado04.Open;
    Form8.init;
    form8.Edit1.Text:=dm.ado04SEED_VALUE.Value;
    form8.StatusBar1.Panels[1].Text:=self.employee_name;
    form8.StatusBar1.Panels[2].Text:='发料日期:'+
    formatdatetime('yyyy-mm-dd HH:mm:ss',self.sys_longdate);
    form8.ShowModal;
  finally
    form8.Free;
  end;
end;

end.
