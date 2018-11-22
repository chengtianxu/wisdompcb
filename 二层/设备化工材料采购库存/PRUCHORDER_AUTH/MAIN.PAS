unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    db_ptr: TLabel;
    vprev: TLabel;
    csi_rkey: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    N7: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    function  curr_auth(app: integer):boolean;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    CONFIRM,server_date: string;
    rkey05: integer;
    tuihui_date: tdatetime;
    v_colwidth: array[0..9] of integer;    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
USES DAMO, supplier_search, po_inspection, auth_info, annotation;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   application.Terminate;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 with dm.ADO70 do
  begin
   close;
   sql.Delete(16);
   sql.Insert(16,'and  data0078.auth_flag=''Y''');
   open
  end
else
 with dm.ADO70 do
  begin
   close;
   sql.Delete(16);
   sql.Insert(16,'');
   open
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:word;
begin
if dbgrid1.SelectedRows.Count>1 then
begin
 for i := 0 to dbgrid1.SelectedRows.Count-1 do
 begin
  dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
  if self.curr_auth(dm.ADO70SECOND_WHSE_PTR.Value) then
   begin
    dm.ado70.Edit;
    dm.ado70auth_date.AsString := server_date;   //授权日期服务器时间78短格式
    dm.ADO70EXPIRED_DATE.Value := self.tuihui_date;  //最后审批日期长格式
    dm.ADO70CONFIRMATION_NUMBER.Value := self.CONFIRM;//授权人姓名70
    with dm.asp78 do
     begin
      Close;
      Parameters[1].Value := dm.Ado70rkey.Value;
      Open;
     end;
    while not dm.asp78.Eof do
    begin
     if dm.asp78ranking.Value-dm.Ado70ranking.Value=1 then
      begin               //给下一个审批系统用户赋值
       dm.ADO70SECOND_WHSE_PTR.Value:=dm.asp78user_ptr.Value;
       break;
      end
     else
      if dm.asp78.RecNo=dm.asp78.RecordCount then//如果是最后一条记录
      dm.Ado70status.Value := 5;//表示请购已经完成审批
     dm.asp78.Next;
    end;
    try
     dm.Ado70.Post;
    except
     messagedlg('审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
     dm.ADO70.Close;
     dm.ADO70.Open;
     break;
    end;
   end;
 end;
end
else  //一次审批一条记录
 begin
  if dm.ADO70auth_flag.Value='Y' then
   begin
    dm.ado70.Edit;
    dm.ado70auth_date.AsString := server_date;   // 授权日期服务器时间78
    dm.ADO70EXPIRED_DATE.Value := self.tuihui_date;  //最后审批日期长格式
    dm.ADO70CONFIRMATION_NUMBER.Value := self.CONFIRM;//授权人姓名 70
    dm.ADO70auth_flag.Value:='N';
    with dm.asp78 do
     begin
      Close;
      Parameters[1].Value := dm.Ado70rkey.Value;
      Open;
     end;
    while not dm.asp78.Eof do
    begin
     if dm.asp78ranking.Value-dm.Ado70ranking.Value = 1 then
      begin               //给下一个审批用户赋值
       dm.ASP78.Edit;
       dm.ASP78auth_flag.Value:='Y';
       dm.ASP78.Post;
       break;
      end
     else
      if dm.asp78.RecNo=dm.asp78.RecordCount then//如果是最后一条记录
       dm.Ado70status.Value := 5;//表示请购已经完成审批
     dm.asp78.Next;
    end;
    try
     dm.Ado70.Post;
    except
     messagedlg('审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
     dm.ADO70.Close;
     dm.ADO70.Open;
    end;
   end
   else
    showmessage('对不起当前订单的审批人不是您,需按顺利审批');
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO70.IsEmpty then
 begin
  n4.Enabled := false;
  n5.Enabled := false;
  N6.Enabled := FALSE;
  n1.Enabled := false;
  n2.Enabled := false;
  n7.Enabled := false;
 end
else
 begin
  n4.Enabled := true;
  n5.Enabled := true;
  n7.Enabled := true;
  if dm.Ado70auth_date.AsVariant <> null then    //已批准
   begin
    n1.Enabled := false;
    n2.Enabled := true;
    n6.Enabled := false;  //退回采购部
   end
  else                         //未批准
   begin
    n1.Enabled := true;
    n2.Enabled := false;
    n6.Enabled := true;   //退回采购部
   end;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 i:word;
begin
if dbgrid1.SelectedRows.Count>1 then
begin
 for i:=0 to dbgrid1.SelectedRows.Count-1 do
  begin
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   dm.ADO70.Edit;
   dm.Ado70auth_date.AsVariant := null;   // 取消审批
   dm.ADO70CONFIRMATION_NUMBER.Value:='';
   if dm.Ado70status.Value = 5 then  dm.ADO70STATUS.Value := 1;
   try                              //如果已全部审批那么变成待审批状态
    dm.Ado70.Post;
   except
    messagedlg('取消审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.ADO70.Close;
    dm.ADO70.Open;
    break;
   end;
  end;
end
else      //一次取消审批一条记录
 begin
  dm.ADO70.Edit;
  dm.Ado70auth_date.AsVariant := null;   // 取消审批
  dm.ADO70CONFIRMATION_NUMBER.Value := '';
  dm.ADO70auth_flag.Value:='Y';
  if dm.Ado70status.Value = 5 then  dm.ADO70STATUS.Value := 1;
   try                  //如果已全部审批那么变成待审批状态
    dm.Ado70.Post;
   except
    messagedlg('取消审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.ADO70.Close;
    dm.ADO70.Open;
   end;
    with dm.asp78 do
     begin
      Close;
      Parameters[1].Value := dm.Ado70rkey.Value;
      Open;
     end;
    while not dm.asp78.Eof do
    begin
     if dm.asp78ranking.Value-dm.Ado70ranking.Value = 1 then
      begin               //给下一个审批用户赋值
       dm.ASP78.Edit;
       dm.ASP78auth_flag.Value:='N';
       dm.ASP78.Post;
       break;
      end;
     dm.asp78.Next;
    end;

 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
try
 form_supp:=tform_supp.Create(application);
 form_supp.Edit1.Text := trim(edit1.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form_supp.ShowModal=mrok then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label2.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.Ado70 do
    begin
     close;
     sql.Delete(17);
     sql.Insert(17,'and data0070.supplier_pointer='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
   dbgrid1.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 IF edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn3')
   and (trim(edit1.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label2.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.Ado70 do
    begin
     close;
     sql.Delete(17);
     sql.Insert(17,'and data0070.supplier_pointer='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label2.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn3')
  and (trim(edit1.Text)='') then
 with dm.Ado70 do
  begin
   close;
   sql.Delete(17);
   sql.Insert(17,'');
   open;
   label2.Caption:='';
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
try
 form13:=tform13.create(application);
 form13.Edit1.Text := self.CONFIRM;
 form13.showmodal;
finally
 form13.free;
end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 dm.Ado70.Close;
 dm.Ado70.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
if not dm.Adoconnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString := db_ptr.Caption;
  dm.Adoconnection1.Connected := true;

  dm.ADO70.Parameters.ParamValues['rkey73'] := strtoint(csi_rkey.Caption);
  dm.ado70.Open;
  dm.ADO200.Open;
  dm.ADO71.Open;
  dm.ADO72.Open;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0005.EMPLOYEE_NAME,data0073.employee_ptr from data0005,data0073');
    sql.Add('where data0073.employee_ptr=data0005.rkey and');
    sql.Add('data0073.rkey='+csi_rkey.Caption);
    open;
    confirm:=fieldvalues['EMPLOYEE_NAME']; //确认人员姓名
    rkey05:=fieldvalues['employee_ptr'];
   end;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select v_dt = getdate()');
    active:=true;   //读取系统时间,短日期格式
    server_date := datetostr(fieldvalues['v_dt']);
    tuihui_date := fieldvalues['v_dt'];
   end;
  for i:=0 to 9 do
   self.v_colwidth[i]:=dbgrid1.Columns[i].Width;
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

  csi_rkey.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库

  vprog0:=trim(Application.Title);
  s:=copy(s,pos('Data Source=',s)-2,1);
  vprog:=pchar(vprog0+'-'+s);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil, ZAppName); // 查找窗口
  if Found>0 then  begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
  end;
  Application.Title:=vprog0+'-'+s;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 try
  form3 := tform3.Create(application);
  dm.asp78.Close;
  dm.asp78.Parameters[1].Value := dm.Ado70rkey.Value;
  dm.asp78.Open;
  form3.ShowModal;
 finally
  form3.Free;
  dm.asp78.Close;
 end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADO70.IsEmpty then
 n4click(sender);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (not dm.ADO70.IsEmpty) and (key=13) then
 n4click(sender);
if (chr(key)='S') and (ssalt in shift) then
 showmessage(dm.Ado70.SQL.Text);
end;

function  Tform1.curr_auth(app: integer):boolean;
begin
 curr_auth:=false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0073');
   sql.Add('where rpl_po_ptr ='+csi_rkey.Caption);
   open;
  end;
 while not dm.ADOQuery1.Eof do
  begin
   if dm.ADOQuery1.FieldValues['rkey']=app then
    begin
     curr_auth:=true;
     break;
    end;
   dm.ADOQuery1.Next;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
 rpl_pr:integer;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT rpl_po_ptr FROM Data0073');
   sql.Add('where RKEY ='+csi_rkey.Caption);
   open;
   rpl_pr := FieldValues['rpl_po_ptr'];
  end;
 if rpl_pr<>strtoint(csi_rkey.Caption) then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT user_full_name FROM Data0073');
    sql.Add('where RKEY ='+inttostr(rpl_pr));
    open;
    messagedlg('您已经将采购购单审批授权给用户：'+fieldvalues['user_full_name']+
    '请首先取消授权',mtinformation,[mbok],0);
   end;
  application.Terminate;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 form11:=tform11.Create(application);
  dm.adosp.close;
  dm.adosp.Parameters[1].Value := 2070;
  dm.adosp.Parameters[2].Value := dm.ADO70.FieldValues['rkey'];
  dm.adosp.Open;
  if not dm.adosp.IsEmpty then
   form11.Memo1.Text := dm.adosp.FieldValues['memo_text'];

  form11.Caption := '采购单退回原因: '+dm.ADO70PO_NUMBER.Value;
  form11.Memo1.ReadOnly := false;
  form11.Memo1.Color := clwindow;
  form11.Button1.Visible := true;
  if form11.ShowModal = mrok then
   begin
    if trim(form11.Memo1.Text) <> '' then
     begin
      if dm.adosp.IsEmpty then
       begin
        dm.adosp.Append;
        dm.adosp.FieldValues['source_type']:=2070;
        dm.adosp.FieldValues['file_pointer']:=dm.ADO70RKEY.Value;
        dm.adosp.FieldValues['memo_text']:=form11.Memo1.Text;
        dm.adosp.Post;
       end
      else
       begin
        dm.adosp.Edit;
        dm.adosp.FieldValues['memo_text']:=form11.Memo1.Text;
        dm.adosp.Post;
       end;

      dm.ADO70.Edit;
      dm.ADO70STATUS.Value:=2;
      dm.ADO70PRINT_TIME.Value:=self.tuihui_date;
      dm.ADO70STATE_TAX.Value:=self.rkey05;
      dm.ADO70.Post;

      showmessage('退回操作成功');
      dm.ADO70.Close;
      dm.ADO70.Open;
     end
    else
     messagedlg('对不起!退回原因为空导致退回操作不成功!',mterror,[mbcancel],0);
   end;
 form11.Free;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 9 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-777)*v_colwidth[i]/750);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 form11:=tform11.Create(application);
  dm.adosp.close;
  dm.adosp.Parameters[1].Value := 2070;
  dm.adosp.Parameters[2].Value := dm.ADO70RKEY.Value;
  dm.adosp.Open;
  if not dm.adosp.IsEmpty then
   form11.Memo1.Text := dm.adosp.FieldValues['memo_text'];

  form11.Caption := '采购单多行备注信息: '+dm.ADO70PO_NUMBER.Value;
  form11.Memo1.ReadOnly := false;
  form11.Memo1.Color := clwindow;
  form11.Button1.Visible := true;
  if form11.ShowModal = mrok then
   begin
    if trim(form11.Memo1.Text) <> '' then
     begin
      if dm.adosp.IsEmpty then
       begin
        dm.adosp.Append;
        dm.adosp.FieldValues['source_type']:=2070;
        dm.adosp.FieldValues['file_pointer']:=dm.ADO70RKEY.Value;
        dm.adosp.FieldValues['memo_text']:=form11.Memo1.Text;
        dm.adosp.Post;
       end
      else
       begin
        dm.adosp.Edit;
        dm.adosp.FieldValues['memo_text']:=form11.Memo1.Text;
        dm.adosp.Post;
       end;
     end
    else
     if not dm.adosp.IsEmpty then dm.adosp.Delete;
   end;
 form11.Free;
end;

end.
