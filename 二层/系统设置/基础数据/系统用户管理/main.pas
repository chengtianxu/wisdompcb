unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N31: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   dbgrid2_coltotal:integer;
   v_colwidth: array of integer;   
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses common, DAMO, adeduser, usergroup;
{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
  dm.ads73.Open;
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
  setlength(v_colwidth,dbgrid1.Columns.Count);
  dbgrid2_coltotal:=dbgrid1.Width;
  for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ads73.IndexFieldNames) then
 dm.ads73.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ads73.CommandText)
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if radiogroup1.ItemIndex=2 then
 if trim(Edit1.text)<>'' then
  dm.ads73.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ads73.filter := ''
else
 if trim(Edit1.text)<>'' then
  dm.ads73.Filter :='USER_GROUP_FLAG='+inttostr(radiogroup1.ItemIndex)
  +' and '+field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ads73.Filter :='USER_GROUP_FLAG='+inttostr(radiogroup1.ItemIndex);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.ads73RKEY.Value;
 dm.ads73.Close;
 dm.ads73.Open;
if rkey>0 then  dm.ads73.Locate('rkey',rkey,[]);
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-dbgrid2_coltotal)*
  v_colwidth[i]/(dbgrid2_coltotal-25));
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起!您没有该程序的可写权限',1)
else
with Tform2.Create(Application) do
try
  aped_fg.Caption:='1';
  checkbox1.Checked:=true;
  caption:=caption+' 新增用户';
  dtpk1.Date:=getsystem_date(dm.ADOQuery3,1)+40;
 if Showmodal=mrok then
  begin
   dm.ads73.Close;
   dm.ads73.Open;
   dm.ads73.Locate('rkey',dm.ADOQuery1.FieldValues['rkey'],[]);
   dm.ADOQuery1.Close;
  end;

finally
 Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起!您没有该程序的可写权限',1)
else
with Tform2.Create(Application) do
try
 if dm.ads73USER_GROUP_FLAG.Value=0 then
  begin
    caption:=caption+' 编辑角色';
    edit3.Enabled:=false;
    bitbtn3.Enabled:=false;
    edit7.Enabled:=false;
    edit8.Enabled:=false;
    bitbtn5.Enabled:=false;
    edit5.Enabled:=false;
    Label10.Visible:=false;
    dtpk1.Visible:=false;
  end
 else
  begin
   caption:=caption+' 编辑用户';
   dtpk1.Date:=dm.ads73validity_date.Value;
  end;
 edit1.Text:=dm.ads73USER_LOGIN_NAME.Value;
 edit2.Text:=dm.ads73USER_FULL_NAME.Value;
 edit3.Text:=dm.ads73EMPL_CODE.Value;
 label4.Caption:=dm.ads73EMPLOYEE_NAME.Value;
 edit7.Text:=dm.ads73PASSWORD.Value;
 edit8.Text:=dm.ads73PASSWORD.Value;
 edit4.Text:=dm.ads73group_name.Value;
 edit5.Text:=dm.ads73NETWORK_IP.Value;
 checkbox2.Checked:=dm.ads73message_flag.Value;
 checkbox1.Checked:=dm.ads73ACTIVE_FLAG.Value=0;
 ComboBox1.ItemIndex:=dm.ads73hrpopm.Value;

 ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(dm.ads73ABBR_NAME.Value);
// ComboBox2.ItemIndex:=
 // ComboBox2.Items.IndexOfObject(Pointer(dm.ads73warehouse_ptr.Value));
  
 if Showmodal=mrok then
  begin
   self.BitBtn3Click(sender);
   dm.ADOQuery1.Close;
  end;

finally
 Free;
end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起!您没有该程序的可写权限',1)
else
with Tform2.Create(Application) do
try
  aped_fg.Caption:='1';
  checkbox1.Checked:=true;
  caption:=caption+' 新增角色';
  edit3.Enabled:=false;
  bitbtn3.Enabled:=false;
  edit7.Enabled:=false;
  edit8.Enabled:=false;
  edit5.Enabled:=false;
  bitbtn5.Enabled:=false;
  Label10.Visible:=false;
  dtpk1.Visible:=false;
 if Showmodal=mrok then
  begin
   dm.ads73.Close;
   dm.ads73.Open;
   dm.ads73.Locate('rkey',dm.ADOQuery1.FieldValues['rkey'],[]);
   dm.ADOQuery1.Close;
  end;

finally
 Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
with Tform2.Create(Application) do
try
 if dm.ads73USER_GROUP_FLAG.Value=0 then
  begin
   caption:=caption+' 检查角色';
    Label10.Visible:=false;
    dtpk1.Visible:=false;
  end
 else
  begin
   caption:=caption+' 检查用户';
   dtpk1.Date:=dm.ads73validity_date.Value;
   dtpk1.Enabled:=false; 
  end;
 edit1.Text:=dm.ads73USER_LOGIN_NAME.Value;
 edit2.Text:=dm.ads73USER_FULL_NAME.Value;
 edit3.Text:=dm.ads73EMPL_CODE.Value;
 label4.Caption:=dm.ads73EMPLOYEE_NAME.Value;
 edit7.Text:=dm.ads73PASSWORD.Value;
 edit8.Text:=dm.ads73PASSWORD.Value;
 edit4.Text:=dm.ads73group_name.Value;
 edit5.Text:=dm.ads73NETWORK_IP.Value;
 checkbox2.Checked:=dm.ads73message_flag.Value;
 checkbox1.Checked:=dm.ads73ACTIVE_FLAG.Value=0;
 ComboBox1.ItemIndex:=dm.ads73hrpopm.Value;
 ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(dm.ads73ABBR_NAME.Value);
// ComboBox2.ItemIndex:=      //两种写法返回Itemindex
// ComboBox2.Items.IndexOfObject(Pointer(dm.ads73warehouse_ptr.Value));
 ComboBox1.Enabled:=False;
 ComboBox2.Enabled:=False;

 edit3.Enabled:=false;
 bitbtn3.Enabled:=false;
 edit7.Enabled:=false;
 edit8.Enabled:=false;
 edit5.Enabled:=false;
 bitbtn5.Enabled:=false;
 bitbtn1.Enabled:=false;
 edit1.ReadOnly:=true;
 edit2.ReadOnly:=true;
 checkbox1.Enabled:=false;
 checkbox2.Enabled:=false;
 bitbtn4.Enabled:=false;
 bitbtn6.Enabled:=false;
 bitbtn7.Enabled:=false; 
 bitbtn8.Enabled:=false;
 bitbtn9.Enabled:=false;
 bitbtn10.Enabled:=false;


 if Showmodal=mrok then
  begin

  end;

finally
 Free;
end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起!您没有该程序的可写权限',1)
else
if Msg_Dlg_Ask('你确定要删除该条记录吗?','提示',1) then
TRY
 dm.ADOConnection1.BeginTrans;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='delete data0073 where rkey='+dm.ads73RKEY.AsString;
    ExecSQL;
   end;
 dm.ADOConnection1.CommitTrans;
 showmsg('删除操作成功',1);
 dm.ADS73.Close;
 dm.ADS73.Open;
 dm.ADOQuery1.Close;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起!您没有该程序的可写权限',1)
else
with Tform_group.Create(Application) do
try
  ads73.Close;
  ads73.Parameters[0].Value:=1;
  ads73.Open;

 if Showmodal=mrok then
  begin
   dm.ads74.Close;
   dm.ads74.Parameters[0].Value:=dm.ads73RKEY.Value;
   dm.ads74.Open;
   if not dm.ads74.IsEmpty then
   if not Msg_Dlg_Ask('使用用户复制,原有权限将丢失,继续吗?','提示',1) then
    exit;
   
   try
   dm.ADOConnection1.BeginTrans;
   
   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Text:='update data0073 '+
                'set message_flag='+BoolToStr(ads73message_flag.Value)+
                ' ,hrpopm='+ads73hrpopm.AsString+
                ' where rkey='+dm.ads73RKEY.AsString;
   dm.ADOQuery1.ExecSQL;

   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Text:='delete data0074'+#13+
                          'where USER_PTR='+dm.ads73RKEY.AsString;
   dm.ADOQuery1.ExecSQL;

   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Text:='insert into data0074 '+
   '(USER_PTR,FUNCTION_ID,USER_RIGHTS,FAVORIATE,seqno) '+
   'select '+dm.ads73RKEY.AsString+
             ' as USER_PTR,FUNCTION_ID,USER_RIGHTS,FAVORIATE,seqno from data0074'+#13+
                          'where USER_PTR='+ads73rkey.AsString;
   dm.ADOQuery1.ExecSQL;

   dm.ADOConnection1.CommitTrans;
   showmsg('复制操作成功',1);
   self.BitBtn3Click(sender);
   dm.ADOQuery1.Close;
   dm.ads74.Close;

   except
    on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
  end;
finally
 Free;
end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ads73.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n8.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
  n8.Enabled:=True;
 end;
 N31.Enabled:=(dm.ads73USER_GROUP_FLAG.Value=1) and  (dm.ads73ACTIVE_FLAG.Value=0);
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  showmsg('对不起!您没有该程序的可写权限',1)
 else
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update  data0173 '+
              'set active_flag=0 '+
              'where csi_ptr='+dm.ads73RKEY.AsString+
              ' and type=0';
    if ExecSQL > 0 then
     showmsg('操作成功',1)
    else
     showmsg('无异常登入日志',1);
   end;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  showmsg('对不起!您没有该程序的可写权限',1)
 else
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update  data0073 '+
              'set validity_date=convert(datetime,(convert(varchar,getdate(),101)),101)+3 '+
              'where rkey='+dm.ads73RKEY.AsString;
    if ExecSQL > 0 then
     begin
      BitBtn3Click(Sender);
      showmsg('操作成功',1);
     end
    else
     showmsg('更新失败!',1);
   end;
end;

end.
