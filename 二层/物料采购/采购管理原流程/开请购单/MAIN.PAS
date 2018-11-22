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
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Splitter1: TSplitter;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
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
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure checkvar();
    procedure append_0068(v_type:char);
    procedure CheckBox1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N10Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N12Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
//    hMapFile: THandle;
//    MapFilePointer: Pointer;
    employee_ptr:integer;
    system_date:tdatetime;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);

  public
    { Public declarations }
    dept_code,dept_name,pr_id:string;
  end;

var
  Form1: TForm1;

implementation
uses damo, edit_req, auth_info, received, note,common;
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
 dm.AQ0068.Parameters[6].Value:=7
else
 dm.AQ0068.Parameters[6].Value:=0;

 dm.AQ0068.Parameters[7].Value:=dtpk1.Date;
 dm.AQ0068.Parameters[8].Value:=dtpk2.Date;
 DM.AQ0068.open;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 checkvar;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 pk :tbookmark;
begin  //编辑
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

 if dm.aq0068status.Value=3 then
 if messagedlg('采购请求已批准是否要继续?',mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;

if dm.AQ0068status.Value<>4 then //如果请购不是被退回
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
  dm.ADO68EDITED_BY_USER_PTR.AsString := rkey73; //编辑系统用户
  dm.ADO68EDITED_BY_EMP_PTR.Value := employee_ptr;    //编辑员工

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
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
  dm.ADO68.Open;

  with dm.ADO6811 do   //删除记事本
   begin
    if active=true then active:=false;
    Parameters[0].Value := dm.ADO68RKEY.Value;
    active:=true;
    if not isempty then delete;
   end;

   try
    dm.ADO68.Delete;
    dm.ADOConnection1.CommitTrans;
    dm.AQ0068.Close;
    dm.AQ0068.Open;
    dm.ADO6811.Close;
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
   n5.Enabled:=false;
   n8.Enabled:=false;    //审批信息
   n9.Enabled:=false;    //收货信息
   n10.Enabled := false; //提交授理
   n12.Enabled := false;  //导出数据
  end
 else
  begin
   n3.Enabled:=true;     //检查
   n4.Enabled:=true;     //复制
   n8.Enabled:=true;     //审批信息
   n9.Enabled:=true;     //收货信息
   n12.Enabled := true;  //导出数据
   case dm.AQ0068status.Value of
    1:       //有效，未授理
     begin
      n2.Enabled := true;    //编辑
      n5.Enabled := true;    //删除
      n10.Enabled := false;
     end;
    4,5:        //未批，撤销
     begin
      n5.Enabled := true;
      n2.Enabled := false;
      n10.Enabled := false;
     end;
    7:
     begin
      n2.Enabled := true;    //编辑
      n5.Enabled := true;    //删除
      n10.Enabled := true;   //提交授理
     end;
    else
     begin
      n2.Enabled := false;
      n5.Enabled := false;
      n10.Enabled := false;
     end;
   end;

  end;
end;

procedure TForm1.N3Click(Sender: TObject);  //检查
begin
 try
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
  dm.ADO68.Open;
  form2 := tform2.Create(application);
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
    sql.Add('data0094.code,PURCHASE_APPROV_DESC');
    sql.Add('from data0068,data0015,data0094');
    sql.Add('where data0068.whse_ptr=data0015.rkey and');
    sql.Add('data0068.auth_type=data0094.rkey and');
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

procedure TForm1.N4Click(Sender: TObject);
var
 v_recode:array[4..21] of variant;
 i:word;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO68.Close;
 dm.ADO68.Parameters[0].Value := dm.AQ0068rkey.Value;
 dm.ADO68.Open;

 for i:=4 to 21 do
  v_recode[i]:=dm.ADO68.Fields[i].Value; //读到数组中

if (dm.ADO68FLAG.Value='S') or (dm.ADO68FLAG.Value = 'T') then
BEGIN
 DM.ADO69.Close;
 dm.ADO69.Parameters[0].Value := null; //标准请求条目复制
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
   for i:=2 to 13 do
   dm.ADO69.fieldvalues[dm.ADO69.Fields[i].FieldName]:=
    dm.ADOQuery1.fieldvalues[dm.ADOQuery1.Fields[i].FieldName];
   dm.ADO69REQ_DATE.Value := date(); //要求到货币日期不能复制
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
dm.ADO204.active:=true;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0204');
   sql.Add('where purchase_req_ptr='+dm.ADO68RKEY.AsString);
   active:=true;
  end;
 while not dm.ADOQuery1.Eof do
  begin
   dm.ADO204.Append;
   for i:=2 to 14 do
   dm.ADO204.fieldvalues[dm.ADO204.Fields[i].FieldName]:=
    dm.ADOQuery1.fieldvalues[dm.ADOQuery1.Fields[i].FieldName];
   dm.ADO204REQ_DATE.Value := date(); //要求到货币日期不能复制
   dm.ADO204reply_date.AsVariant := null;
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
  dm.ADO68STATUS.Value :=1;
  dm.ADO68EDITED_DATE.AsVariant := null; //编辑日期
  dm.ADO68EDITED_BY_USER_PTR.AsVariant := null; //编辑系统用户
  dm.ADO68EDITED_BY_EMP_PTR.AsVariant := null; //编辑员工
  dm.ADO68USER_PTR.AsString := rkey73; //需求系统用户
  dm.ADO68REQ_BY.Value := employee_ptr; //需求人员指针
 try
  form2:=tform2.Create(application);
  form2.Label18.Caption := '1'; //标识为复制状态
  if (dm.ADO68FLAG.Value = 'S') or (dm.ADO68FLAG.Value = 'T')then
   form2.DBGrid2.Visible := false
  else
   form2.DBGrid1.Visible := false;
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;               //查找仓库
    sql.Add('select warehouse_code,warehouse_name,WAREHOUSE_TYPE from data0015');
    sql.Add('where rkey='+dm.ADO68WHSE_PTR.AsString);
    active:=true;
    form2.edit1.Text := fieldvalues['warehouse_code'];
    form2.Edit1.Font.Color := clwindowtext;
    form2.label9.Caption := fieldvalues['warehouse_name'];
    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.ware_type := trim(fieldvalues['warehouse_type']);
   end;
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;               //查找授权代码
    sql.Add('select code,PURCHASE_APPROV_DESC from data0094');
    sql.Add('where rkey='+dm.ADO68AUTH_TYPE.AsString);
    active:=true;
    form2.edit2.Text := fieldvalues['code'];
    form2.Edit2.Font.Color := clwindowtext;
    form2.label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];
   end;
  if form2.ShowModal=mrok then
   begin
    dm.AQ0068.Close;
    dm.AQ0068.Open;
   end;
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
    dm.aq0068.Filter := 'po_req_number like '''+trim(v_bar)+'%'''
   end
  else
   dm.aq0068.Filter :='';
 end
else
 if (ord(key)<>13) and (ord(key)<>32) then
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.aq0068.Filter := 'po_req_number like '''+trim(v_bar)+'%'''
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin

 if not  App_init_2(dm.ADOConnection1) then
  begin
   showmsg('程序启动失败!请与管理员联系',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  dm.ADOConnection1.Connected then
 begin
 // if trim(vprev.Caption) = '' then  close;
//  dm.adoconnection1.ConnectionString := db_ptr.Caption;
//  dm.Adoconnection1.Connected := true;
  with dm.ADOQuery1 do
  begin
   close;
   sql.Add('SELECT Data0034.DEPT_CODE,dept_name,data0073.employee_ptr,data0034.pr_id');
   sql.add('FROM Data0005 INNER JOIN');
   sql.Add('Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN');
   sql.Add('Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR');
   sql.Add('where data0073.rkey='+rkey73);
   open;
   dept_code := fieldvalues['dept_code'];
   dept_name := fieldvalues['dept_name'];
   pr_id := trim(fieldbyname('pr_id').asstring);
   employee_ptr := fieldvalues['employee_ptr'];
   self.Caption := dept_name+self.Caption;
  end;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as v_dt');
   active:=true;   //读取系统时间
   system_date:=fieldvalues['v_dt']; //长格式
  end;

  dtpk2.Date := strtodate(datetostr(system_date));
  dtpk1.Date := dtpk2.Date-5;
  dm.AQ0068.Close;
  dm.AQ0068.Parameters[7].Value := dtpk1.Date;
  dm.AQ0068.Parameters[8].Value := dtpk2.Date;
  dm.AQ0068.Parameters[9].Value := dept_code;
  dm.AQ0068.Open;
  dm.aq0002.Open;
  dm.aq0017.Open;
 end;
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
 dbgrid1.SetFocus;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 try
  form6 := tform6.Create(application);
  dm.ads276.Close;
  dm.ads276.Parameters[1].Value := dm.AQ0068rkey.Value;
  dm.ads276.Open;
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
  dm.ads276.Close;
 end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 try
  form7 := tform7.Create(application);
  if (dm.AQ0068flag.Value='S') or (dm.AQ0068flag.Value='T') then
   begin
    dm.DataSource6.DataSet := dm.ADOQuery3;
    dm.DataSource7.DataSet := dm.ADOQuery5;
    dm.ADOQuery3.Open;
    dm.ADOQuery5.Open;
    if not dm.ADOQuery3.IsEmpty then
     form7.ShowModal
    else
     messagedlg('对不起该请购单还没有货记录!',mtinformation,[mbok],0);
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
 if (dm.AQ0068status.Value = 7) and (dm.AQ0068data275_ptr.AsVariant <> null) then
  DBGrid1.Canvas.Font.Color := clred    //被采购部退回
 else
  if dm.AQ0068status.Value = 7 then     //未授理
   DBGrid1.Canvas.Font.Color := cllime
  else
   if dm.AQ0068status.Value = 4 then    //被经理人员在审批过程中退回
    DBGrid1.Canvas.Font.Color := clfuchsia;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.N10Click(Sender: TObject);
var
 i:byte;
begin
if dm.AQ0068data275_ptr.AsVariant=null then
 begin
  dm.AQ0068.Edit;
  dm.AQ0068status.Value:=1;//有效
  dm.AQ0068ent_date.Value := self.system_date;
  dm.AQ0068.Post;
 end
else
 try
  edit_note:=tedit_note.Create(application);
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0011');
     sql.Add('where source_type=68 and');
     sql.Add('file_pointer='+dm.AQ0068rkey.AsString);
     open;
     if not isempty then
     for i:=1 to 4 do
      if fieldbyname('note_pad_line_'+inttostr(i)).AsString <> '' then
       edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
    end;
  edit_note.Caption := '该请购单有被退回,重新提交需要输入原因!';

 if edit_note.ShowModal=mrok then
  begin
   if (not dm.ADOQuery2.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
    begin             //原记录有记事本而且修改了
     dm.ADOQuery2.Edit;
     for i:=1 to 4 do
     if edit_note.Memo1.Lines.Count>=i then
      dm.ADOQuery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]
     else
      dm.ADOQuery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
     dm.ADOQuery2.Post;
    end
   else
    if (not dm.ADOQuery2.IsEmpty) and (trim(edit_note.Memo1.Text)='') then
     dm.ADOQuery2.Delete //如果原记录有记事本但被删除了
    else
     if (dm.ADOQuery2.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then
      begin        //如果原记录没有本，但新增了记事本
       dm.ADOQuery2.Append;
       dm.ADOQuery2.Fieldvalues['file_pointer'] := dm.AQ0068.FieldValues['rkey'];
       dm.ADOQuery2.Fieldvalues['source_type']:= 68;
       for i:=1 to edit_note.memo1.Lines.Count do
       dm.ADOQuery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1];
       dm.ADOQuery2.post;
      end;
   if trim(edit_note.Memo1.Text) <> '' then
    begin
     dm.AQ0068.Edit;
     dm.AQ0068status.Value:=1;//有效
     dm.AQ0068ent_date.Value := self.system_date;
     dm.AQ0068.Post;
    end
   else
    messagedlg('因为重新提交请购原因为空,导致操作不成功!',mtinformation,[mbok],0);
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
 info:string;
 i:byte;
begin
 if (dm.AQ0068status.Value=7) and (dm.AQ0068data275_ptr.AsVariant<>null) then
  begin
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select employee_name from data0005');
     sql.Add('where rkey='+dm.AQ0068data275_ptr.AsString);
     open;
     info := '该请购单由员工:'+trim(fieldvalues['employee_name'])+'  于日期'+#13;
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
  end;

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
      for i := 1 to 4 do
       if Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString <> '' then
       info:=info+Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString+#13;
    end;
    showmessage(info);
  end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1dblclick(sender);
end;

procedure TForm1.N12Click(Sender: TObject);
 var
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
 begin
  if (dm.AQ0068flag.Value = 'S') or (dm.AQ0068flag.Value='T') then
   begin
    Screen.Cursor := crHourglass;
    dm.Aq69.Open;
    dm.Aq69.First;
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
      mem.Lines.Add(sline);

      mem.Lines.Add('');//增加一行空行

      sline := '';
    for col := 0 to dm.Aq69.FieldCount-1 do
     sline := sline + dm.Aq69.Fields[col].DisplayLabel + #9;
    mem.Lines.Add(sline);

    for row := 0 to dm.Aq69.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to dm.Aq69.FieldCount-1 do
       sline := sline + dm.Aq69.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dm.Aq69.Next;
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

    Screen.Cursor := crDefault;
    dm.Aq69.First;
    dm.ADO6811.Close;
   end
  else
   begin
    Screen.Cursor := crHourglass;
    dm.Aq204.Open;
    dm.Aq204.First;
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
      mem.Lines.Add(sline);
      mem.Lines.Add('');//增加一行空行

      sline := '';
    for col := 0 to dm.Aq204.FieldCount-1 do
     sline := sline + dm.Aq204.Fields[col].DisplayLabel + #9;
    mem.Lines.Add(sline);

    for row := 0 to dm.Aq204.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dm.Aq204.FieldCount-1 do
       sline := sline + dm.Aq204.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dm.Aq204.Next;
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

    Screen.Cursor := crDefault;
    dm.Aq204.First;
    dm.ADO6811.Close;
   end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 v_rkey68: integer;
begin
v_rkey68 := 0;
if not dm.AQ0068.IsEmpty then  v_rkey68 := dm.AQ0068rkey.Value;
 dm.AQ0068.Close;
 dm.AQ0068.Open;
if v_rkey68 > 0 then  dm.AQ0068.Locate('rkey',v_rkey68,[]);
end;

procedure TForm1.append_0068(v_type: char);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 try
  dm.ADO68.Close;
  dm.ADO68.Parameters[0].Value := null;
  dm.ADO68.Open;
  dm.ADO68.Append;
  dm.ADO68FLAG.Value := v_type;             //新增杂项采购请求
  dm.ADO68CURRENY_PTR.Value :=1;            //表示部门新增
  dm.ADO68DEPARTMENT_NAME.Value:=dept_code; //给部门指针赋值
  dm.ADO68USER_PTR.AsString := rkey73; //需求系统用户
  dm.ADO68REQ_BY.Value := employee_ptr;     //需求人员指针

  form2:=tform2.Create(application);
  if form2.ShowModal = mrok then
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
self.append_0068('S');
end;

procedure TForm1.N7Click(Sender: TObject);
begin
self.append_0068('M');
end;

end.
