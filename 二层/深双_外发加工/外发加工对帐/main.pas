unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls,
  DB, ADODB;

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
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    //procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, received_search,common, ColsDisplaySet_unt;

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


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
  if  dm.ADOConnection1.Connected then
  begin
    setlength(v_colwidth,8);
    setlength(v_colwidth1,9);
    for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
    for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;

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

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:= application.Title;
                                     
 { dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  user_ptr:='4';
  rkey73:='2522';
  vprev:='4';        }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  field_name:='DELIVER_NUMBER';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
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
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    dm.Aqwz303.Close;
    dm.Aqwz303.Parameters[6].Value := dtpk1.Date;
    dm.Aqwz303.Parameters[7].Value := dtpk2.Date;
    dm.Aqwz303.Open;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
v_rkey303:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);

 dm.Aqwz303.edit;

if form2.ShowModal=mrok then
 begin
  v_rkey303 := dm.Aqwz303rkey.Value;
  dm.Aqwz303.Close;
  dm.Aqwz303.Open;
  dm.Aqwz303.Locate('rkey',v_rkey303,[]);
 end
else
 begin
  dm.aqwz303.cancel;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form2:=tform2.Create(application);
with form2 do
 begin
  dbedit1.enabled:=false;
  dbedit3.enabled:=false;
  dbedit7.enabled:=false;
  dbedit8.enabled:=false;
  dbedit9.enabled:=false;
  dbmemo1.enabled:=false;
  dbgrid1.readonly:=true;
  button1.enabled:=false;
  button2.enabled:=false;
  button3.enabled:=false;
  bitbtn1.enabled:=false;
  speedbutton1.enabled:=false;
 end;
if form2.ShowModal=mrok then
 begin

 end;
form2.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
var
 v_rkey303:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要退回该批送货单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
    v_rkey303 := dm.Aqwz303rkey.Value;
    dm.Aqwz303.Close;
    dm.Aqwz303.Open;
    if dm.Aqwz303.Locate('rkey',v_rkey303,[]) then
     begin
      dm.Aqwz303.edit;
      dm.aqwz303status.value:=6;
      dm.Aqwz303.post;
     end;
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
  end;
 end;
end;

procedure TForm1.N5Click(Sender: TObject); //审核
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
  if dm.aqwz303totoal_money.value=0 then
   if messagedlg('该批送货单总金额为零,应该还没有确认价格您是否继续？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
     dm.Aqwz303.edit;
     dm.aqwz303status.value:=3;
     dm.Aqwz303auth_userptr.Value:=StrToInt(common.user_ptr);
     dm.Aqwz303auth_datetime.Value:=common.getsystem_date(dm.ADOQuery1,0);
     dm.Aqwz303.post;
    end
   else
  else
   begin
    dm.Aqwz303.edit;
    dm.aqwz303status.value:=3;
    dm.Aqwz303auth_userptr.Value:=strtoint(common.user_ptr);
    dm.Aqwz303auth_datetime.Value:=common.getsystem_date(dm.ADOQuery1,0);
    dm.Aqwz303.post;
   end;
   BitBtn3Click(sender);
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 v_rkey303,stat:integer;
begin
 if (strtoint(vprev)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('您确定要将该送货单取消审核，重新确定价格吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    v_rkey303 := dm.Aqwz303rkey.Value;
    stat:=dm.aqwz303status.value;
    if dm.Aqwz303auth_userptr.Value<>StrToInt(common.user_ptr) then
    begin
    messagedlg('对不起,只有审核本人才能取消审核!',mtinformation,[mbok],0);
    exit;
    end;
    dm.Aqwz303.Close;
    dm.Aqwz303.Open;
    if (dm.Aqwz303.Locate('rkey',v_rkey303,[])) and
       (stat=dm.aqwz303status.value) then
     begin
      dm.Aqwz303.edit;
      dm.aqwz303status.value:=2;
      dm.Aqwz303auth_userptr.AsVariant:=null;
      dm.Aqwz303auth_datetime.AsVariant:=null;
      dm.Aqwz303.post;
      BitBtn3Click(sender);
     end
    else
     showmessage('取消审核操作不成功，可能该送货单已记帐或付款!');
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
  case dm.aqwz303status.value of
  1:begin
  n2.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
    end;
  2:begin
  n6.Enabled:=false;
    end;
  3:begin
  n2.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
    end;
  4:begin
  n2.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
    end;
  5:begin
  n2.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
    end;
  6:begin
  n2.Enabled:=false;
  n4.Enabled:=false;
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


{procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
 begin
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-729)*v_colwidth[i]/700);

 end;
for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid1.Width-729)*v_colwidth1[i]/685);
end;}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  form3:=tform3.create(application);
  try
    form3.showmodal;
  finally
    form3.free;
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if dm.aqwz303status.value=2 then
 n2click(sender)
else
 if dm.aqwz303status.value>0 then
  n3click(sender);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGrid).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)  ;
  end;
end;

end.
