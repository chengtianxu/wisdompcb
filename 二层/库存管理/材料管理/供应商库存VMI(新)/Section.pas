unit Section;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, ComCtrls,DateUtils;

type
  TForm_Section = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    dtpk1: TDateTimePicker;
    Label2: TLabel;
    dtpk2: TDateTimePicker;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    N6: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    v_employee: integer;
  end;

var
  Form_Section: TForm_Section;

implementation

uses demo,common, Main, DB, ADODB, ShowMat, ShowSum;

{$R *.dfm}

procedure TForm_Section.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_Section.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
with dm.ADOQuery1 do
begin
close;
sql.Text:='select * from data0171 where status=0';
open;
end;
if not dm.ADOQuery1.IsEmpty then
begin
messagedlg('对不起!有在线截数还没完成,不能再次截数!',mtinformation,[mbok],0);
exit;
end
else
begin
dm.ADOConnection1.BeginTrans;
try
dm.AQ171.Close;//先增加主表
dm.AQ171.Open;
dm.AQ171.Append;
dm.AQ171user_ptr.Value:=self.v_employee;
dm.AQ171cut_date.Value:=form_main.sys_longdate;
dm.AQ171.Post;
dm.ADOQuery1.Close;//再增加子表(明细)
dm.ADOQuery1.SQL.Text:='insert into data0172(header_ptr,d0134_ptr,quan_on_hand) select'+#8+inttostr(dm.AQ171rkey.Value)+',rkey,QUAN_ON_HAND from data0134 where quan_on_hand>0';
dm.ADOQuery1.ExecSQL;
dm.ADOConnection1.CommitTrans;
showmsg('VMI材料截数成功!',1);
dm.ADO171.Close;
dm.ADO171.Open;
except
on E:Exception do
begin
dm.ADOConnection1.RollbackTrans;
messagedlg(E.Message,mterror,[mbcancel],0);
end;
end;
end;
end;

procedure TForm_Section.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 Form_Main.Show;
end;

procedure TForm_Section.FormCreate(Sender: TObject);
begin
dm.ADO171.Close;
dm.ADO171.Open;
end;

procedure TForm_Section.CheckBox1Click(Sender: TObject);
begin
dm.ADO171.Close;
if CheckBox1.Checked then
dm.ADO171.Parameters.ParamValues['v1']:=9
else
dm.ADO171.Parameters.ParamValues['v1']:=0;
if CheckBox2.Checked then
dm.ADO171.Parameters.ParamValues['v2']:=9
else
dm.ADO171.Parameters.ParamValues['v2']:=1;
dm.ADO171.Open;
end;

procedure TForm_Section.dtpk1Exit(Sender: TObject);
begin
 dm.ADO171.Close;
 dm.ADO171.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
 dm.ADO171.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
 dm.ADO171.Open;
end;

procedure TForm_Section.FormShow(Sender: TObject);
begin
if  dm.Adoconnection1.Connected then
 begin
 with dm.ADOQuery1 do
  begin                  //查找系统用户的员工指针
   active:=false;
   sql.Clear;
   sql.Add('select employee_ptr from data0073');
   sql.Add('where rkey='+rkey73);
   active:=true;
   v_EMPLOYEE := fieldvalues['employee_ptr'];
  end;
 with dm.ADOQuery1 do
  begin                  //查找系统用户的员工指针
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as sys_date');
   active:=true;
   Form_Main.sys_longdate:=fieldvalues['sys_date'];
   dtpk2.Date:= dateof(fieldvalues['sys_date']);
   dtpk1.Date:= dtpk2.Date-dayof(dtpk2.Date)+1;
  end;
  dtpk1Exit(sender);
 end;
end;

procedure TForm_Section.N2Click(Sender: TObject);
begin
if Application.MessageBox('确认要完成截数吗?', PChar('提示'),MB_YESNO)=6 then
begin
dm.ADO171.Open;
dm.ADO171.Edit;
dm.ADO171status.Value:=1;
dm.ADO171.Post;
dm.ADO171.Close;
dm.ADO171.Open;
showmsg('材料截数成功完成!',1);
end;
end;

procedure TForm_Section.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
end
else
begin
if Application.MessageBox('确认要删除截数吗?', PChar('提示'),MB_YESNO)=6 then
begin
 if dm.ADO171user_ptr.AsString<>user_ptr then
 begin
   MessageDlg('必须由截数人进行删除操作!',mtInformation,[mbok],1);
   Exit;
 end;
 with dm.ADOQuery1 do
 begin
   Close;
   SQL.Clear;
   sql.Add('select * from data0171 where cut_date>'+QuotedStr(dm.ADO171cut_date.AsString));
   Open;
 end;
 if not dm.ADOQuery1.IsEmpty then
 begin
   MessageDlg('有相关截数时间大于此截数,不能进行删除操作!',mtInformation,[mbok],1);
   Exit;
 end;
dm.ADOConnection1.BeginTrans;
try
with dm.ADOQuery1 do
begin
close;
sql.Text:='delete from data0172 where header_ptr='+dm.ADO171rkey.AsString;
ExecSQL;
end;
with dm.ADOQuery1 do
begin
close;
sql.Text:='delete from data0171 where rkey='+dm.ADO171rkey.AsString;
ExecSQL;
end;
dm.ADOConnection1.CommitTrans;
dm.ADO171.Close;
dm.ADO171.Open;
showmsg('成功删除截数!',1);
except
on E:Exception do
begin
dm.ADOConnection1.RollbackTrans;
messagedlg(E.Message,mterror,[mbcancel],0);
end;
end;
end;
end;
end;

procedure TForm_Section.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO171.IsEmpty then
begin
N1.Enabled:=true;
N2.Enabled:=false;
N3.Enabled:=false;
N6.Enabled:=false;
end
else
begin
N1.Enabled:=true;
N2.Enabled:=(dm.ADO171status.Value=0);
N3.Enabled:=true;
N6.Enabled:=True;
end;
end;

procedure TForm_Section.N3Click(Sender: TObject);
var
 quantity,total_lucre,total_notax:double;
begin
screen.Cursor:=crSQLWait;
 quantity:=0;
 total_lucre:=0;
 total_notax:=0;

dm.ADO172.Close;
dm.ADO172.Parameters[0].Value:=dm.ADO171rkey.Value;
dm.ADO172.Open;
Form_ShowMat:=TForm_ShowMat.Create(Application);
while not dm.ADO172.Eof do
   begin
    quantity:=quantity+dm.ADO172QUAN_ON_HAND.Value;
    total_lucre:=total_lucre+dm.ADO172amount_tax.Value;
    total_notax:=total_notax+dm.ADO172amount_notax.Value;
    dm.ADO172.Next;
  end;
  dm.ADO172.First;
  Form_ShowMat.DataSource1.DataSet:=dm.ADO172;
  dm.ADO172.EnableControls;

  Form_ShowMat.Edit1.Text:=formatfloat('0.00',quantity);
  Form_ShowMat.edit2.Text:=formatfloat('0.0000',total_lucre);
  Form_ShowMat.edit4.Text:=formatfloat('0.0000',total_notax);
Form_ShowMat.ShowModal;
Form_ShowMat.Free;
screen.Cursor:=crDefault;
end;

procedure TForm_Section.N8Click(Sender: TObject);
begin
dm.ADO172Sum.Close;
dm.ADO172Sum.Parameters[0].Value:=dm.ADO171rkey.Value;
dm.ADO172Sum.Open;
Form_ShowSum:=TForm_ShowSum.Create(Application);
Form_ShowSum.ShowModal;
end;

end.
