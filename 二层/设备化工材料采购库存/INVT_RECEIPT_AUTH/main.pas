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
    N2: TMenuItem;
    N3: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label2: TLabel;
    N5: TMenuItem;
    csi_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    N9: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
   hMapFile: THandle;
   MapFilePointer: Pointer;
   dbgrid2_coltotal:integer;
   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
   empl_ptr:integer;
   stock_flag:string;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, received_search, po_search, direct_ware,
  invtin_report, mul_report;

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

procedure TForm1.N9Click(Sender: TObject); 
begin
  dm.aqwz456.Edit;
  dm.Aqwz456PRINTED.Value:='N';
  dm.aqwz456.Post;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin

if not dm.ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  application.Terminate;
   dm.adoconnection1.ConnectionString := db_ptr.Caption;
   dm.Adoconnection1.Connected := true;


setlength(v_colwidth,8);
setlength(v_colwidth1,7);
dbgrid2_coltotal:=0;
for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
for i:=0 to high(v_colwidth1) do
 begin
  v_colwidth1[i] := dbgrid2.Columns[i].Width;
  dbgrid2_coltotal := dbgrid2_coltotal+v_colwidth1[i];
 end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+csi_ptr.Caption);
    open;
    empl_ptr := fieldvalues['EMPLOYEE_PTR'];
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select stock_in_flag from data0192');
    open;
    self.stock_flag := fieldvalues['stock_in_flag'];
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

  dm.aqwz456.Close;
  dm.aqwz456.Parameters[6].Value := dtpk1.Date;
  dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
  dm.aqwz456.Open;
  dm.Aqwz22.Open;
  self.Timer1Timer(sender);

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
  dm.aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aqwz456.Filter:=''; 
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容
  csi_ptr.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库

  title_name:=application.Title;
  application.Title:='OnlyOne'+ IntToStr(HInstance);
  vprog:=pchar(title_name);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil,ZAppName);
  
  if Found <> 0 then
   begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
   end;

  application.Title := title_name;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';
 
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin

 dm.aqwz456.Close;
if not checkbox1.Checked then
 dm.aqwz456.Parameters[0].Value:=1
else
 dm.aqwz456.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.aqwz456.Parameters[1].Value:=2
else
 dm.aqwz456.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.aqwz456.Parameters[2].Value:=3
else
 dm.aqwz456.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.aqwz456.Parameters[3].Value:=4
else
 dm.aqwz456.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.aqwz456.Parameters[4].Value:=5
else
 dm.aqwz456.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.aqwz456.Parameters[5].Value:=6
else
 dm.aqwz456.Parameters[5].Value:=0;

 DM.aqwz456.open;

end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.aqwz456.Close;
 dm.aqwz456.Parameters[6].Value := dtpk1.Date;
 dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
 dm.aqwz456.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 i,rkey456:integer;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
 rkey456:=dm.Aqwz456rkey.Value;
 dm.Aqwz456.DisableControls;
 for i := 0 to DBGrid1.SelectedRows.Count-1 do
 BEGIN
  dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
  dm.ADO456.Open;
  if dm.ADO456STATUS.Value=2 then
   begin
    dm.ADO456.Edit;
    dm.ADO456STATUS.Value:=3;
    dm.ADO456AUDITED_BY.Value:=self.empl_ptr;
    dm.ADO456AUDITED_DATE.Value:=self.sys_longdate;
    dm.ADO456.Post;
   end;
 end;

 dm.aqwz456.close;
 dm.aqwz456.open;
 dm.aqwz456.Locate('rkey',rkey456,[]);
 dm.ADO456.Close;
 dm.Aqwz456.EnableControls;

 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.Aqwz456TTYPE.Value =1 then       //编码入仓
begin
form2:=tform2.Create(application);
form2.aded_flag:=4;
form2.BitBtn1.Enabled:=false;
form2.BitBtn4.Enabled:=false;

form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
form2.Edit1.Enabled:=false;
form2.Edit5.Enabled:=false;
form2.Edit6.Enabled:=false;
form2.edit11.Enabled:=false;
form2.edit7.Enabled:=false;
form2.combobox1.enabled:=false;
form2.CheckBox1.Enabled:=false;
if form2.ShowModal=mrok then
 begin

 end;
form2.Free;
end
else
if dm.Aqwz456TTYPE.Value = 3 then    //直接入仓
try
 form4:=tform4.Create(application);
 form4.aded_flag:=3;
 form4.edit1.enabled:=false;
 form4.edit2.enabled:=false;
 form4.edit5.enabled:=false;
 form4.edit6.enabled:=false;
 form4.edit11.enabled:=false;
 form4.bitbtn1.enabled:=false;
 form4.bitbtn2.enabled:=false;
 form4.bitbtn4.enabled:=false;
 form4.bitbtn5.enabled:=false;
 form4.strgrid1.popupmenu:=form4.popupmenu2;
 if form4.ShowModal=mrok then
  begin
   dm.aqwz456.Close;
   dm.aqwz456.Open;
   dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
   dm.ADO456.Close;
  end;
finally
 form4.Free;
end;

end;

procedure TForm1.N5Click(Sender: TObject);
var
 str:string;
begin
 if (strtoint(vprev.Caption)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该入仓单取消审核,重新审核吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value then
     begin
      if inputquery('审核退回','请输入退回信息           ',str) then
      begin
       dm.ADO456.Edit;
       dm.ADO456status.Value := 6;
       dm.ADO456REF_NUMBER.Value:=str;
       dm.ADO456.Post;
       dm.aqwz456.close;
       dm.aqwz456.open;
       dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
       dm.ADO456.Close;
      end;
     end
    else
     begin
      dm.aqwz456.close;
      dm.aqwz456.open;
      dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
      dm.ADO456.Close;
      showmessage('取消操作不成功，可能已被成功记帐了');
     end;
   end;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 i,rkey456:integer;
begin
 if (strtoint(vprev.Caption)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该入仓单取消审核,重新审核吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
   rkey456:=dm.Aqwz456rkey.Value;
   dm.Aqwz456.DisableControls;
   for i := 0 to DBGrid1.SelectedRows.Count-1 do
    BEGIN
    dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];

    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if dm.ADO456STATUS.Value=3 then
     begin
      dm.ADO456.Edit;
      dm.ADO456status.Value := 2;
      dm.ADO456AUDITED_BY.AsVariant:=null;
      dm.ADO456AUDITED_DATE.AsVariant:=null;
      dm.ADO456.Post;
     end;
    end;

    dm.aqwz456.close;
    dm.aqwz456.open;
    dm.aqwz456.Locate('rkey',rkey456,[]);
    dm.ADO456.Close;
    dm.Aqwz456.EnableControls;

   end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dbgrid1.SelectedRows.Count>1 then
 begin
  N2.Enabled:=TRUE;
  n3.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=true;
  n9.Enabled:=false;
 end
else
begin
 if dbgrid1.SelectedRows.Count=0 then
  dbgrid1.SelectedRows.CurrentRowSelected:=true;

if dm.aqwz456.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
  n9.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;

  n5.Enabled:=true;
  n6.Enabled:=true;
  if  dm.Aqwz456PRINTED.value='Y' then
   n9.Enabled:=true
  else
   n9.Enabled:=false;

  case dm.aqwz456STATUS.Value of
  1:
   begin
    n6.Enabled:=false;
    n2.enabled:=false;
    n5.Enabled:=false;
   end;
  2:
   begin
    n2.Enabled:=true;
    n6.Enabled:=false;
   end;
  3:
   begin
    n2.Enabled:=false;
    n5.Enabled:=false;
   end;
  4:
   begin
    n2.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  5:
   begin
    n2.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  6:
   begin
    n2.enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  end;
 end;
end; 
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey68: integer;
begin
v_rkey68 := 0;
if not dm.aqwz456.IsEmpty then  v_rkey68 := dm.aqwz456rkey.Value;
 dm.aqwz456.Close;
 dm.aqwz456.Open;
if v_rkey68 > 0 then  dm.aqwz456.Locate('rkey',v_rkey68,[]);
self.Timer1Timer(sender);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0456 where status=6');
    open;
    if dm.ADOQuery1.IsEmpty then
     label2.Visible:=false
    else
     label2.Visible:=true;
   end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.aqwz456status.value=6 then
  DBGrid1.Canvas.Font.Color := clRed
 else
  if dm.aqwz456status.value=1 then
   DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-712)*v_colwidth[i]/670);
 for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid1.Width-712)*v_colwidth1[i]/dbgrid2_coltotal);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.create(application);
form3.showmodal;
form3.free;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin

Form_posearch:=tForm_posearch.Create(application);
Form_posearch.button1.caption:='结束收货';
if Form_posearch.showmodal=mrok then
 with dm.adoquery2 do
  begin
   close;
   sql.clear;
   sql.Add('update data0070');
   sql.Add('set status=6');
   sql.Add('where rkey='+Form_posearch.aq70rkey.AsString);
   execsql;
  end;
Form_posearch.free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.aqwz456.SQL.Text);
end;
end.
