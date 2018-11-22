unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label2: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
  private
   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
   empl_ptr:integer;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, eip_search, received_search,common;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;

 //rkey73:='5';
 //vprev := '4';

 Caption:=application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
  
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='DELIVER_NUMBER';
end;

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


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
begin
if dm.ADOConnection1.Connected then
 begin

setlength(v_colwidth,7);
setlength(v_colwidth1,9);
for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    empl_ptr := fieldvalues['EMPLOYEE_PTR'];
   end;

  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;
  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 5;

  dm.Aqwz303.Close;
  dm.Aqwz303.Parameters[6].Value := dtpk1.Date;
  dm.Aqwz303.Parameters[7].Value := dtpk2.Date;
  dm.Aqwz303.Open;
  dm.Aqwz304.Open;
  self.Timer1Timer(sender);
end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.aded_flag:=1;
if form2.ShowModal=mrok then
 begin
  dm.Aqwz303.Close;
  dm.Aqwz303.Open;
  dm.Aqwz303.Locate('rkey',dm.ADOwz303RKEY.Value,[]);
  dm.ADOwz303.Close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.Aqwz303.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.Aqwz303.Filter:='';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin

 dm.aqwz303.Close;
if not checkbox1.Checked then
 dm.aqwz303.Parameters[0].Value:=1
else
 dm.aqwz303.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.aqwz303.Parameters[1].Value:=2
else
 dm.aqwz303.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.aqwz303.Parameters[2].Value:=3
else
 dm.aqwz303.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.aqwz303.Parameters[3].Value:=4
else
 dm.aqwz303.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.aqwz303.Parameters[4].Value:=5
else
 dm.aqwz303.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.aqwz303.Parameters[5].Value:=6
else
 dm.aqwz303.Parameters[5].Value:=0;

 DM.aqwz303.open;

end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
  dm.Aqwz303.Close;
  dm.Aqwz303.Parameters[6].Value := dtpk1.Date;
  dm.Aqwz303.Parameters[7].Value := dtpk2.Date;
  dm.Aqwz303.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.aded_flag:=2;
form2.BitBtn2.Enabled:=false;
if form2.ShowModal=mrok then
 begin
  dm.Aqwz303.Close;
  dm.Aqwz303.Open;
  dm.Aqwz303.Locate('rkey',dm.ADOwz303RKEY.Value,[]);
  dm.ADOwz303.Close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form2:=tform2.Create(application);
form2.aded_flag:=3;
form2.BitBtn1.Enabled:=false;
form2.BitBtn2.Enabled:=false;
form2.BitBtn4.Enabled:=false;
form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
form2.Edit1.Enabled:=false;
form2.Edit5.Enabled:=false;
form2.DateTimePicker1.Enabled:=false;
form2.Memo1.Enabled:=false;
form2.CheckBox1.Enabled:=false;
if form2.ShowModal=mrok then
 begin

 end;
form2.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update wzdata301');
    sql.Add('set wzdata301.RECEVIED_QTY = wzdata301.RECEVIED_QTY-wzdata304.rece_quantity,');
    sql.Add('wzdata301.RETURN_QTY=wzdata301.RETURN_QTY-wzdata304.RETURN_QTY,');
    sql.Add('wzdata301.reject_QTY=wzdata301.reject_QTY-wzdata304.reject_QTY');
    sql.Add('from wzdata304 inner join wzdata301');
    sql.Add('on wzdata304.EPILIST_PTR = wzdata301.rkey');
    sql.Add('where wzdata304.DELIVER_PTR = '+dm.Aqwz303RKEY.AsString);
    ExecSQL;
   end;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update wzdata300');
     sql.add('set status=3');
     sql.Add('where rkey='+dm.Aqwz303EPIBOLY_PTR.AsString);
     execsql;
    end;
   dm.ADOwz303.Close;
   dm.adowz303.Parameters[0].Value := dm.Aqwz303RKEY.Value;
   dm.adowz303.Open;
   dm.adowz303.Delete;
   dm.ADOConnection1.CommitTrans;
   dm.Aqwz303.Close;
   dm.Aqwz303.Open;
   dm.adowz303.Close;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
  end;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
  dm.Aqwz303.Edit;
  dm.Aqwz303STATUS.Value:=2;
  dm.tmp.close;
  dm.tmp.SQL.Text:='select getdate()' ;
  dm.tmp.Open;
  dm.aqwz303ent_date.value:=dm.tmp.Fields[0].Value;
  dm.tmp.close;
  dm.Aqwz303.Post;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 if (strtoint(vprev)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该申请取消提交，重新提交吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    dm.ADOwz303.Close;
    dm.ADOwz303.Parameters[0].Value := dm.Aqwz303RKEY.Value;
    dm.ADOwz303.Open;
    if dm.ADOwz303STATUS.Value=dm.Aqwz303STATUS.Value then
     begin
      dm.ADOwz303.Edit;
      dm.ADOwz303status.Value := 1;
      dm.ADOwz303.Post;
      dm.Aqwz303.close;
      dm.Aqwz303.open;
      dm.Aqwz303.Locate('rkey',dm.adowz303rkey.value,[]);
      dm.ADOwz303.Close;
     end
    else
     begin
      dm.Aqwz303.close;
      dm.Aqwz303.open;
      dm.Aqwz303.Locate('rkey',dm.adowz303rkey.value,[]);
      dm.ADOwz303.Close;
      showmessage('取消操作不成功，可能已被成功审核了');
     end;
   end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.Aqwz303.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
  case dm.Aqwz303STATUS.Value of
  1:
   begin
    n6.Enabled:=false;
   end;
  2:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
   end;
  3:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  4:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  5:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  6:
   begin
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  end;
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey68: integer;
begin
v_rkey68 := 0;
if not dm.Aqwz303.IsEmpty then  v_rkey68 := dm.Aqwz303rkey.Value;
 dm.Aqwz303.Close;
 dm.Aqwz303.Open;
if v_rkey68 > 0 then  dm.Aqwz303.Locate('rkey',v_rkey68,[]);
self.Timer1Timer(sender);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzdata303 where status=6');
    open;
    if dm.ADOQuery1.IsEmpty then
     label2.Visible:=false
    else
     label2.Visible:=true;
   end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 form_episearch:=tform_episearch.Create(application);
 form_episearch.BitBtn1.Caption:='收货完成';
 if form_episearch.ShowModal=mrok then
  begin
   form_episearch.Aqwz300.Edit;
   form_episearch.Aqwz300status.Value:=4;
   form_episearch.Aqwz300.Post;
  end;
 form_episearch.Free;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.aqwz303status.value=6 then
  DBGrid1.Canvas.Font.Color := clRed
 else
  if dm.aqwz303status.value=1 then
   DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.create(application);
form3.showmodal;
form3.free;
end;

end.
