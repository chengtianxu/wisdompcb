unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  Menus,adodb, DB,ComObj, Excel97, ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    csi_ptr: TLabel;
    db_ptr: TLabel;
    vprev: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu4: TPopupMenu;
    MenuItem2: TMenuItem;
    N13: TMenuItem;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Bar1: TStatusBar;
    Splitter1: TSplitter;
    Timer1: TTimer;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure checkvar();
    procedure append_0068(v_type:char);
    procedure CheckBox1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure save_auth();
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    v_employee:integer;
    system_date :tdatetime;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
     dept_code,dept_name,pr_id:string;
  end;

var
  Form1: TForm1;

implementation
uses damo, edit_req, auth_info, dpment_search, received, note, addedit_requ,
  addedit_m;
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

procedure tform1.checkvar();
begin
 dm.AQ0068.Close;
if not checkbox1.Checked then
 dm.AQ0068.Parameters[0].Value:=1
else
 dm.AQ0068.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.AQ0068.Parameters[1].Value:=2
else
 dm.AQ0068.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.AQ0068.Parameters[2].Value:=3
else
 dm.AQ0068.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.AQ0068.Parameters[3].Value:=4
else
 dm.AQ0068.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.AQ0068.Parameters[4].Value:=5
else
 dm.AQ0068.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.AQ0068.Parameters[5].Value:=6
else
 dm.AQ0068.Parameters[5].Value:=0;
if not checkbox7.Checked then
 dm.AQ0068.Parameters[8].Value:=7
else
 dm.AQ0068.Parameters[8].Value:=0;

 dm.AQ0068.Parameters[6].Value:=dtpk1.Date;
 dm.AQ0068.Parameters[7].Value:=dtpk2.Date;
 DM.AQ0068.open;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 checkvar;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 pk:tbookmark;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

 if dm.aq0068status.Value = 3 then
 if messagedlg('采购请求已批准是否要继续?',mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;

if dm.AQ0068status.Value <> 4 then //如果请购不是被退回
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0276 where');
  sql.Add('auth_date is not null');
  sql.Add('and purchase_ptr='+dm.AQ0068.fieldbyname('rkey').AsString);
  open;
  if not isempty then
  if messagedlg('采购请求已有人员审批,是否要继续?',mtConfirmation,[mbyes,mbno],0)=mrno then
   exit;
 end;

 try
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
  dm.ADO68.Open;
  dm.ADO68.Edit;
  dm.ADO68STATUS.Value := 7;
  dm.ADO68EDITED_DATE.AsVariant:=null;
  dm.ADO68AUTH_DATE.AsVariant:=null;
  dm.ADO68ENT_DATE.AsVariant:=null;
  
  form2 := tform2.Create(application);
  form2.Edit1.Enabled := false;
  form2.BitBtn4.Enabled := false;
  form2.Button1.Enabled := true;
  if form2.ShowModal = mrok then
   begin
    pk:=dm.AQ0068.GetBookmark();
    dm.AQ0068.Close;
    dm.AQ0068.Open;
    dm.AQ0068.GotoBookmark(pk);
    dm.AQ0068.FreeBookmark(pk);
    if dm.ADOAP68.Active=true then dm.ADOAP68.Close;
    if dm.AP69204.Active=true then dm.AP69204.Close;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO68.Close;
   dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
   dm.ADO68.Open;

  with dm.ADO6811 do   //删除记事本
   begin
    if active=true then active:=false;
    Parameters[0].Value := dm.ADO68rkey.Value;
    active:=true;
    if not isempty then delete;
   end;

  with dm.ADO362 do   //修改预算
   begin
    close;
    Parameters[0].Value := dm.ADO68budget_ptr.Value;
    open;
    edit;
    fieldvalues['used_period_'+inttostr(dm.ADO68v_month.Value)]:=formatfloat('0.00',
       fieldvalues['used_period_'+inttostr(dm.ADO68v_month.Value)]-
       dm.ADO68TOTAL.Value/dm.ADO68EXCHANGE_RATE.Value);
    post;
   end;


   dm.ADO68.Delete;
   dm.ADOConnection1.CommitTrans;
   dm.AQ0068.Close;
   dm.AQ0068.Open;
   dm.ADO6811.Close;
   dm.ADO362.Close;
   dm.ADO68.Close;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!',mtwarning,[mbcancel],0);
  end;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.AQ0068.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n5.Enabled:=false;    //删除
   n8.Enabled:=false; //提交审批
   n9.Enabled:=false;
   n10.Enabled:=false;
   n13.Enabled:=false;

  end
 else
  begin
   n2.Enabled := true;   //编辑
   n3.Enabled := true;
   n4.Enabled := true;
   n9.Enabled := true;
   n10.Enabled := true;
   n13.Enabled := true;   //导出请购项目
   n8.Enabled := false;   //提交审批
   n5.Enabled := false;   //删除

   case dm.AQ0068status.Value of
    7:
    begin
     n8.Enabled:=true;
     n5.Enabled:=true;  //删除
    end;
    1:
     begin
      n5.Enabled:=true;  //删除
     end;
    2:n2.Enabled:=false;

    3:n2.Enabled:=false;

    5:
     begin
      n5.Enabled:=true;  //删除
      n2.Enabled:=false;
     end;
    6:
     begin
      n2.Enabled := false;      //编辑
     end;
    4:    //审批未通过
     begin
      n5.Enabled:=true;  //删除
     end;
   end;

  end;
end;

procedure TForm1.N3Click(Sender: TObject); //检查
begin
 try
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
  dm.ADO68.Open;
  form2:=tform2.Create(application);
  form2.MaskEdit1.Enabled := false;
  form2.MaskEdit2.Enabled := false;
  form2.BitBtn9.Visible := true;
  form2.BitBtn1.Visible := false;
  form2.BitBtn3.Visible := false;
  form2.DBEdit2.Enabled := false;
  form2.SpinEdit1.Enabled := false;
  form2.SpinEdit2.Enabled := false;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.add('select warehouse_code,warehouse_name,');
    sql.Add('data0094.code,PURCHASE_APPROV_DESC,');
    sql.Add('empl_code,employee_name,');
    sql.Add('data0073.user_id,data0073.user_full_name');
    sql.Add('from data0068 left join data0005');
    sql.Add('on data0068.buyer_ptr=data0005.rkey,');
    sql.Add('data0015,data0094,data0073');
    sql.Add('where data0068.whse_ptr=data0015.rkey and');
    sql.Add('data0068.auth_type=data0094.rkey and');
    sql.Add('data0068.user_ptr=data0073.rkey and');
    sql.Add('data0068.rkey='+dm.ADO68RKEY.AsString);
    active:=true;
    form2.edit1.Text := fieldvalues['warehouse_code'];
    form2.label9.Caption := fieldvalues['warehouse_name'];
    form2.edit2.Text := fieldvalues['code'];
    form2.label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];

   end;
    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.Edit2.Enabled := false;
    form2.BitBtn5.Enabled := false;
    form2.Edit3.Enabled := false;
    form2.BitBtn6.Enabled := false;

  if (dm.ADO68FLAG.Value = 'S') or (dm.ADO68FLAG.Value = 'T') then
   form2.DBGrid1.PopupMenu := form2.PopupMenu3
  else
   form2.DBGrid2.PopupMenu := form2.PopupMenu4;
  form2.ShowModal;
 finally
  form2.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject); //复制
var
 v_recode:array[4..21] of variant;
 i:word;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO68.Close;
 dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
 dm.ADO68.Open;

 for i:=4 to 21 do
  v_recode[i]:=dm.ADO68.Fields[i].Value; //读到数组中

if (dm.ADO68FLAG.Value='S') then
BEGIN
 DM.ADO69.Close;
 dm.ADO69.Parameters[0].Value := null; //将标准请求条目复制
 dm.ADO69.active:=true;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0069');
   sql.Add('where purch_req_ptr='+dm.ADO68RKEY.AsString);
   active:=true;
  end;
 while not dm.ADOQuery1.Eof do
  begin
   dm.ADO69.Append;
   for i:=2 to 17 do
   dm.ADO69.fieldvalues[dm.ADO69.Fields[i].FieldName]:=
    dm.ADOQuery1.fieldvalues[dm.ADOQuery1.Fields[i].FieldName];

   dm.ADO69REQ_DATE.Value := date(); //要求到货日期不能复制
   dm.ADO69reply_date.AsVariant := null;
   dm.ADO69.post;
   dm.ADOQuery1.Next;
  end;
 dm.ADO69.First;

END
else
 begin
 DM.ADO204.Close;
 dm.ADO204.Parameters[0].Value := null; //装杂项请求条目复制
 dm.ADO204.open;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0204');
   sql.Add('where PURCHASE_REQ_PTR='+dm.ADO68RKEY.AsString);
   active:=true;
  end;
 while not dm.ADOQuery1.Eof do
  begin
   dm.ADO204.Append;
   for i:=2 to 16 do
   dm.ADO204.fieldvalues[dm.ADO204.Fields[i].FieldName]:=
    dm.ADOQuery1.fieldvalues[dm.ADOQuery1.Fields[i].FieldName];
   dm.ADO204REQ_DATE.Value := date(); //要求到货币日期不能复制
   dm.ADO204reply_date.Value := date();
   dm.ADO204.post;
   dm.ADOQuery1.Next;         //复制过程没有复制预算方案
  end;                        //复制过程中需要判断系统用户是否有权使用原预算
 dm.ADO204.First;
end;
 dm.ADO68.Append;
 for i:=4 to 21 do
  dm.ADO68.fieldvalues[dm.ADO68.Fields[i].FieldName]:=v_recode[i];
  dm.ADO68.fieldvalues[dm.ADO68.Fields[5].FieldName]:=null; //授权指针
  dm.ADO68.fieldvalues[dm.ADO68.Fields[6].FieldName]:=null; //被授权用户指针275
  dm.ADO68.fieldvalues[dm.ADO68.Fields[9].FieldName]:=null; //记事本指针
  dm.ADO68.fieldvalues[dm.ADO68.Fields[12].FieldName]:=null;//授权日期
  dm.ADO68EDITED_DATE.AsVariant := null; //编辑日期
  dm.ADO68EDITED_BY_USER_PTR.AsVariant := null; //编辑系统用户
  dm.ADO68EDITED_BY_EMP_PTR.AsVariant := null; //编辑员工
  dm.ADO68STATUS.Value:=7;
  dm.ADO68USER_PTR.AsString := csi_ptr.Caption; //需求系统用户
  dm.ADO68REQ_BY.Value := self.v_employee; //需求人员指针
 try
  form2:=tform2.Create(application);
  form2.Label18.Caption := '1'; //标识为复制状态
  if (dm.ADO68FLAG.Value = 'S') or (dm.ADO68FLAG.Value = 'T') then
   form2.DBGrid2.Visible := false
  else
   form2.DBGrid1.Visible := false;
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;               //查找工厂
    sql.Add('select warehouse_code,warehouse_name,warehouse_type,');
    sql.Add('data0094.code,PURCHASE_APPROV_DESC');
    sql.Add('from data0015,data0094,data0068');
    sql.Add('where data0068.whse_ptr=data0015.rkey and');
    sql.Add('data0068.auth_type=data0094.rkey and');
    sql.Add('data0068.rkey='+dm.aq0068rkey.AsString);
    active:=true;
    form2.edit1.Text := fieldvalues['warehouse_code'];
    form2.Edit1.Font.Color := clwindowtext;
    form2.label9.Caption := fieldvalues['warehouse_name'];
    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.edit2.Text := fieldvalues['code']; //审批代码
    form2.Edit2.Font.Color := clwindowtext;
    form2.label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];//审批代码描述
    form2.warehouse_type:=trim(fieldvalues['warehouse_type']);
   end;

  if form2.ShowModal=mrok then
   begin
    dm.AQ0068.Close;
    dm.AQ0068.Open;
   end
  else
   
 finally
  form2.Free;
 end;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 v_bar:string;
begin
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   begin
    v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.aq0068.Filter := 'po_req_number like ''%'+trim(v_bar)+'%'''
   end
  else
   dm.aq0068.Filter :='';
 end
else
 if (ord(key)<>13) and (ord(key)<>32) then
   begin
   bar1.SimpleText := bar1.SimpleText+key;
   v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.aq0068.Filter := 'po_req_number like ''%'+trim(v_bar)+'%'''
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s:string;
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容
  csi_ptr.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库}

  vprog0:=trim(Application.Title);
  s:=copy(s,pos('Data Source=',s)-2,1);
  vprog:=pchar(vprog0+'-'+s);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil, ZAppName); // 查找窗口
  if Found>0 then
   begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
   end;
  Application.Title:=vprog0+'-'+s;


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.ADOConnection1.Connected then
 begin
  if trim(vprev.Caption) = '' then  close;
  dm.adoconnection1.ConnectionString := db_ptr.Caption;
  dm.Adoconnection1.Connected := true;
  dm.AQ0005.Open;
  dm.aq0002.Open;
  dm.aq0023.Open;
  dm.aq0001.open;
  dm.aq0017.Open;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Add('SELECT Data0034.DEPT_CODE,dept_name,data0073.employee_ptr,data0034.pr_id');
   sql.add('FROM Data0005 INNER JOIN');
   sql.Add('Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN');
   sql.Add('Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR');
   sql.Add('where data0073.rkey='+csi_ptr.Caption);
   open;
   dept_code := fieldvalues['dept_code'];
   dept_name := fieldvalues['dept_name'];
   pr_id := trim(fieldbyname('pr_id').asstring);
   v_employee := fieldvalues['employee_ptr'];
   self.Caption := dept_name+'部门请购单';
  end;

 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as v_dt');
   active := true;
   system_date := fieldvalues['v_dt']; //长格式
  end;

  dtpk2.Date := strtodate(datetostr(system_date));
  dtpk1.Date := dtpk2.Date - 5;

  dm.AQ0068.Close;
  dm.AQ0068.Parameters[6].Value := dtpk1.Date;
  dm.AQ0068.Parameters[7].Value := dtpk2.Date;
  dm.AQ0068.Parameters[9].Value := dept_code;
  dm.AQ0068.Open;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0068 where status=4');
    sql.Add('and department_name ='''+self.dept_code+'''');
    open;
    if dm.ADOQuery1.IsEmpty then
     label1.Visible:=false
    else
     label1.Visible:=true;
   end;

 end;
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
 dbgrid1.SetFocus;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 dm.AQ0068.Edit;
 dm.AQ0068status.Value:=1;                     //状态变成待审批
 dm.AQ0068ent_date.Value := self.system_date;  //提交审批日期长格式
 self.save_auth();                             //保存有权审批的人员
 dm.AQ0068.Post;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 try
  form6 := tform6.Create(application);
  dm.ados276.Close;
  dm.ados276.Parameters[1].Value := dm.AQ0068rkey.Value;
  dm.ados276.Open;
  if dm.AQ0068data275_ptr.AsVariant<>null then
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select employee_name from data0005');
     sql.Add('where rkey='+dm.AQ0068data275_ptr.AsString);
     open;
     form6.Edit1.Text:= fieldvalues['employee_name'];
    end;
      
  form6.ShowModal;
 finally
  form6.Free;
  dm.ados276.Close;
 end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 try
  form7 := tform7.Create(application);
  if (dm.AQ0068flag.Value = 'S')  then
   begin
    dm.DataSource6.DataSet := dm.ADOQuery3;
    dm.DataSource7.DataSet := dm.ADOQuery5;
    dm.ADOQuery3.Open;
    dm.ADOQuery5.Open;
    if not dm.ADOQuery3.IsEmpty then
     form7.ShowModal
    else
     messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
   end
  else
   begin
    dm.DataSource6.DataSet := dm.ADOQuery4;
    dm.DataSource7.DataSet := dm.ADOQuery6;
    dm.ADOQuery4.Open;
    dm.ADOQuery6.Open;
    if not dm.ADOQuery4.IsEmpty then
     form7.ShowModal
    else
     messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
   end;
 finally
  form7.Free;
  if dm.ADOQuery3.Active = true then dm.ADOQuery3.Close;
  if dm.ADOQuery4.Active = true then dm.ADOQuery4.Close;
  if dm.ADOQuery5.Active = true then dm.ADOQuery5.Close;
  if dm.ADOQuery6.Active = true then dm.ADOQuery6.Close;
 end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.AQ0068status.Value = 4) and (dm.AQ0068data275_ptr.AsVariant <> null) then
  DBGrid1.Canvas.Font.Color := clred
 else
  if dm.AQ0068status.Value = 7 then
   DBGrid1.Canvas.Font.Color := cllime
  else
   if dm.AQ0068status.Value = 4 then
    DBGrid1.Canvas.Font.Color := clfuchsia;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
 info:string;
 i:byte;
begin
 if (dm.AQ0068status.Value=4) and (dm.AQ0068data275_ptr.AsVariant<>null) then
  begin
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select employee_name from data0005');
     sql.Add('where rkey='+dm.AQ0068data275_ptr.AsString);
     open;
     info := '该请购单在采购环节被员工:'+trim(fieldvalues['employee_name'])+'  于日期'+#13;
     info := info+dm.AQ0068auth_date.AsString+'退回,退回原因如下:'+#13;
    end;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0011');
     sql.Add('where source_type=1068 and');
     sql.Add('file_pointer='+dm.AQ0068rkey.AsString);
     open;
     if not IsEmpty then
      for i := 1 to 4 do
       if Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString <> '' then
       info:=info+Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString+#13;
    end;
   showmessage(info);
  end
 else
 if (dm.AQ0068status.Value=4)  then
  begin
   info := '该请购单会签未通过原因如下：'+#13;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0011');
     sql.Add('where source_type=1068 and');
     sql.Add('file_pointer='+dm.AQ0068rkey.AsString);
     open;
     if not IsEmpty then
     begin
      for i := 1 to 4 do
       if Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString <> '' then
        info:=info+Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString+#13;
     end;
    end;
   showmessage(info);
  end
 else
  if dm.AQ0068status.Value=7 then
   n2click(sender);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1dblclick(sender);
end;


procedure Tform1.save_auth();
var
 rkey14:integer;
begin
 rkey14:=0;
if messagedlg('是否短信通知审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0014 where rkey is null');
   open;
   append;
   fieldvalues['MESSAGE'] := '有一张请购单需要通过您的审批,请购人员:'+
                             dm.AQ0068employee_name.Value+'请购编号:'+
                             dm.AQ0068po_req_number.Value;
   fieldvalues['whosend']:= strtoint(csi_ptr.Caption);
   post;
   rkey14:=fieldvalues['rkey'];
  end;

dm.ADOConnection1.BeginTrans;
try

 with dm.ads276 do
  begin
   close;
   dm.ADS276.Parameters[1].Value := dm.AQ0068rkey.Value;
   open;
  end;
 while not dm.ADS276.eof do dm.ADS276.Delete;//如果该pr已有审批人员,删除原有审批人员
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT USER_PTR FROM Data0275');
   sql.Add('where AUTH_GROUP_PTR = '+dm.AQ0068AUTH_TYPE.AsString);
   sql.Add('ORDER BY rkey');
   open;
  end;


 while not dm.ADOQuery1.Eof do
  begin
   dm.ADS276.Append;
   dm.ADS276purchase_ptr.Value := dm.AQ0068rkey.Value;
   dm.ADS276user_ptr.Value := dm.ADOQuery1.FieldValues['user_ptr'];
   dm.ADS276ranking.value := dm.ADOQuery1.RecNo;
   if dm.ADOQuery1.RecNo=1 then
    dm.ADS276auth_flag.Value:='Y'
   else
    dm.ADS276auth_flag.Value:='N';
   dm.ADS276.Post;

   if rkey14>0 then
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0314 where rkey is null');
     open;
     append;
     fieldvalues['emp_ptr']:=dm.ADS276user_ptr.Value;
     fieldvalues['d14_ptr']:= rkey14;
     post;
    end;

    dm.ADOQuery1.Next;
  end;


 dm.ADOConnection1.CommitTrans;
except
 dm.ADOConnection1.RollbackTrans;
 showmessage('数据提交出现错误,请与管理员联系!!!');
end;
 dm.ADOQuery1.Close;
 dm.ADOQuery2.Close;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
 try
  form3:=tform3.Create(application);
  form3.edit1.Text := dm.AQ0068abbr_name.Value;

  form3.Edit2.Text := trim(dm.ADO69inv_number.Value);
  form3.Edit2.Font.Color := clwindowtext;
  form3.label8.Caption := dm.ADO69inv_part_number.Value+dm.ADO69inv_part_description.Value;
  form3.MaskEdit1.Text := dm.ADO69REQ_DATE.AsString;
  form3.Button1.Visible := false;
  form3.Button2.Visible := false;
  form3.Button3.Visible := true;
  form3.Edit3.Text := dm.ADO69supplier_code.Value;
  form3.Label9.Caption := dm.ADO69supplier_name.Value;
  with form3 do
   begin
    edit2.Enabled := false;
    bitbtn3.Enabled := false;
    bitbtn4.Enabled := false;
    dbedit1.Enabled := false;
    dbedit2.Enabled := false;
    dbedit5.enabled := false;
    dbedit6.enabled := false;
    dbedit7.Enabled := false;
    dbedit8.Enabled := false;
    maskedit1.Enabled := false;
    edit3.Enabled := false;
   end;
  form3.ShowModal;
 finally
  form3.free;
 end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
 try
  form4:=tform4.Create(application);
  form4.MaskEdit1.Text := dm.ADO204REQ_DATE.AsString;
  form4.Edit2.Text:=dm.ADO204UNIT_CODE.Value;
  form4.Label10.Caption:=dm.ADO204UNIT_NAME.Value;
  form4.Edit1.Text := dm.ADO204supp_code.Value;
  form4.Label3.Caption := dm.ADO204supp_name.Value;
   with form4 do
    begin
     button1.Visible := false;
     button2.Visible := false;
     button3.Visible := true;
     button4.Enabled := false;
     dbedit1.Enabled := false;
     dbedit2.Enabled := false;
     dbcombobox1.Enabled := false;
     dbedit3.Enabled := false;
     dbedit4.Enabled := false;
     dbedit5.Enabled := false;
     dbedit7.Enabled := false;
     maskedit1.Enabled := false;
     edit1.Enabled := false;
     bitbtn3.Enabled := false;
     bitbtn1.Enabled := false;
     edit2.Enabled := false;
    end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

procedure TForm1.N13Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
 begin
  if (dm.AQ0068flag.Value = 'S') or (dm.AQ0068flag.Value = 'T') then
   begin
    Screen.Cursor := crHourglass;
    dbgrid2.DataSource.DataSet.DisableControls;
    bm := dbgrid2.DataSource.DataSet.GetBookmark;
    dbgrid2.DataSource.DataSet.First;

     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := Form1;
    mem.Clear;
    sline := '';

    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号

    mem.Lines.Add('');//增加一行空行

    sline := '';
    for col := 0 to dbgrid2.FieldCount-1 do
     sline := sline + dbgrid2.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to dbgrid2.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to dbgrid2.FieldCount-1 do
       sline := sline + dbgrid2.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dbgrid2.DataSource.DataSet.Next;
     end;

      mem.Lines.Add('');//增加一行空行
      mem.Lines.Add('备注');//增加一行空行
      sline := '';
    with dm.ADO6811 do
    begin           //查找记事本
     if active = true then active := false;
     Parameters[0].Value := dm.AQ0068rkey.Value;
     active := true;
     if not isempty then
     for col := 1 to 4 do
      mem.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);
    end;

    mem.SelectAll;
    mem.CopyToClipboard;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    dbgrid2.DataSource.DataSet.GotoBookmark(bm);
    dbgrid2.DataSource.DataSet.FreeBookmark(bm);
    dbgrid2.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
   end
  else
   begin
    Screen.Cursor := crHourglass;
    dbgrid3.DataSource.DataSet.DisableControls;
    bm := dbgrid3.DataSource.DataSet.GetBookmark;
    dbgrid3.DataSource.DataSet.First;

     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := Form1;
    mem.Clear;
    sline := '';
    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号

    mem.Lines.Add('');//增加一行空行

    sline := '';
    for col := 0 to dbgrid3.FieldCount-1 do
     sline := sline + dbgrid3.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to dbgrid3.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dbgrid3.FieldCount-1 do
       sline := sline + dbgrid3.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dbgrid3.DataSource.DataSet.Next;
    end;

    mem.Lines.Add('');//增加一行空行
    mem.Lines.Add('备注');//增加一行空行
    sline := '';
    with dm.ADO6811 do
     begin           //查找记事本
      if active = true then active := false;
      Parameters[0].Value := dm.AQ0068rkey.Value;
      active := true;
      if not isempty then
      for col := 1 to 4 do
       mem.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);
     end;

    mem.SelectAll;
    mem.CopyToClipboard;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    dbgrid3.DataSource.DataSet.GotoBookmark(bm);
    dbgrid3.DataSource.DataSet.FreeBookmark(bm);
    dbgrid3.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
   end;
  end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0068 where status=4');
    sql.Add('and department_name ='''+self.dept_code+'''');
    open;
    if dm.ADOQuery1.IsEmpty then
     label1.Visible:=false
    else
     label1.Visible:=true;
   end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey68: integer;
begin
v_rkey68 := 0;
if not dm.AQ0068.IsEmpty then  v_rkey68 := dm.AQ0068rkey.Value;
 dm.AQ0068.Close;
 dm.AQ0068.Open;
if v_rkey68 > 0 then  dm.AQ0068.Locate('rkey',v_rkey68,[]);
self.Timer1Timer(sender);
end;

procedure TForm1.append_0068(v_type: char);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 end
else
 try
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := null;
  dm.ADO68.Open;
  dm.ADO68.Append;
  dm.ADO68STATUS.Value := 7;
  dm.ADO68FLAG.Value := v_type;  //采购类型标识
  dm.ADO68TOTAL.Value :=0;       //总计金额开始为0
  dm.ADO68CURRENY_PTR.Value :=1; //表示部门新增

  dm.ADO68DEPARTMENT_NAME.Value:=dept_code; //给部门指针赋值
  dm.ADO68USER_PTR.AsString := csi_ptr.Caption; //需求系统用户
  dm.ADO68REQ_BY.Value := v_employee;     //需求人员指针

  form2:=tform2.Create(application);
  if form2.ShowModal=mrok then
   begin
    dm.AQ0068.Close;
    dm.AQ0068.Open;
    dm.AQ0068.Locate('rkey',dm.ADO68RKEY.Value,[]);
    dm.ADO68.Close;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 append_0068('S');
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 append_0068('M');
end;

end.
