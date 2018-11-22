unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls, Mask,
  Menus, ExtCtrls,QuickRpt, DB, ADODB;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label7: TLabel;
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
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    CheckBox7: TCheckBox;
    csi_rkey: TLabel;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N13: TMenuItem;
    db_ptr: TLabel;
    vprev: TLabel;
    Splitter1: TSplitter;
    N20: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label9: TLabel;
    N12: TMenuItem;
    N18: TMenuItem;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    N19: TMenuItem;
    CheckBox8: TCheckBox;
    N21: TMenuItem;
    BitBtn3: TBitBtn;
    ComboBox3: TComboBox;
    BitBtn4: TBitBtn;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure save_auth();
    procedure checkvar();
    procedure append_70(v_new:byte;po_type:char);
    procedure pochangepr(pr_number:string);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpk1Exit(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure N11Click(Sender: TObject);
    function if_receivd():boolean;
    procedure N20Click(Sender: TObject);
    function misc_ship_tax():double;
    function SmallTOBig(small:double):string;
    procedure N13Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure mul_print(rkey70:integer);
    procedure m_print();
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    employee_name: string;
    long_sysdate: tdatetime;
    if_print,pr_number: string;      //审核前是否可以打印po
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
   if_suplst:string;   //PO编号是否由控制码控制 
   v_employee: integer;
   sys_date: tdatetime;
  end;

var
  Form1: TForm1;
//  v_new_type:byte; //新建采购定单时0,新建标准定单...1,新建杂项采购定单

implementation
uses damo, supp_search, add_po, edit_add_po, save_po_number, po_inspection,
  desi_report, desi_reportmic, //smtp_email,
  desi_o_report, desi_o_reportmic, received_info, note, auth_info,
   qian_huo, mul_report, PO_change;
{$R *.dfm}

procedure tform1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure tform1.checkvar();
begin
 dm.AQ0070.Close;
if not checkbox1.Checked then
 dm.AQ0070.Parameters[0].Value:=1
else
 dm.AQ0070.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.AQ0070.Parameters[1].Value:=2
else
 dm.AQ0070.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.AQ0070.Parameters[2].Value:=3
else
 dm.AQ0070.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.AQ0070.Parameters[3].Value:=4
else
 dm.AQ0070.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.AQ0070.Parameters[4].Value:=5
else
 dm.AQ0070.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.AQ0070.Parameters[5].Value:=6
else
 dm.AQ0070.Parameters[5].Value:=0;
if not checkbox7.Checked then
 dm.AQ0070.Parameters[6].Value:=7
else
 dm.AQ0070.Parameters[6].Value:=0;
if not checkbox8.Checked then
 dm.AQ0070.Parameters[7].Value:=8
else
 dm.AQ0070.Parameters[7].Value:=0;

 dm.AQ0070.Parameters[8].Value:= dtpk1.Date;
 dm.AQ0070.Parameters[9].Value:= dtpk2.Date;
 DM.AQ0070.open;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 checkvar();
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
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
   label7.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(19);
     sql.Insert(19,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
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
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit1.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label7.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(19);
     sql.Insert(19,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label7.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
  and (trim(edit1.Text)='') then
 with dm.AQ0070 do
  begin
   close;
   sql.Delete(19);
   sql.Insert(19,'');
   open;
   label7.Caption:='';
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 pk:tbookmark;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 end
else
 begin
  dm.ADO70.Close;
  dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
  dm.ADO70.Open;
  if (dm.ADO70STATUS.Value=5) or (dm.ADO70STATUS.Value=6) or
     (dm.ADO70STATUS.Value=7) then
   showmessage('对不起该订单不能编辑,已有处理!')
  else
  try
   form4:=tform4.Create(application);
   form4.v_new_type := 10; //表示编辑
   form4.BitBtn1.Visible := false;
   dm.ADO70.Edit;
   dm.ADO70PO_NUMBER.EditMask:='';
   if form4.ShowModal = mrok then
   begin
    pk:=dm.AQ0070.GetBookmark();
    dm.AQ0070.Close;
    dm.AQ0070.Open;
    dm.AQ0070.GotoBookmark(pk);
    dm.AQ0070.FreeBookmark(pk);
    dm.ADO70.Close;
   end;
  finally
   form4.free;
  end;
 end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
self.append_70(0,'S');
end;

procedure TForm1.N15Click(Sender: TObject);
begin
self.append_70(1,'M');
end;

procedure TForm1.N17Click(Sender: TObject);   //导入数据
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form4:=tform4.Create(application);
 form4.v_new_type := 9;//新建采购从请购中导入数据(注意可以多条记录!)
 dm.ADO70.Close;
 dm.ADO70.Parameters[1].Value := null;
 dm.ADO70.Open;
 dm.ADO70PO_NUMBER.EditMask:='';
 form4.TC1.Visible:= false;
 form4.BitBtn1.Visible := false; //导入数据后不可以手工新增
 if form4.ShowModal=mrok then
  begin
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   dm.ADO70.Close;
  end;
finally
 form4.Free;
end;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
  begin
   bar1.SimpleText := copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
   combobox1change(sender);
  end;
 end
else
 if (key=chr(vk_return)) and (not dm.aq0070.IsEmpty) then    //如果按下了enter
  n2click(sender)           //调用编辑命令
 ELSE
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   combobox1change(sender);
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 n2.Enabled := true;
 n3.Enabled := true;
 n7.Enabled := false; //暂缓
 n8.Enabled := true;   //发放
 n9.Enabled := true;
 n10.Enabled := true;    //结束
 n11.Enabled := true;
 n13.Enabled := true;
 n20.Enabled := true;
 n21.Enabled := false; //提交审核
 n12.Enabled := true; //收货信息
 n18.Enabled := true;
 n19.Enabled := true;
 n20.Enabled := true;
 n23.Enabled := true;
 n24.Enabled := false;
 n25.Enabled := true;
 case dm.AQ0070status.Value of
  1,8:
   begin                        //待审核状态,未审核状态
    n8.Enabled := false;
    n10.Enabled := false;      //030528修改
    n11.Enabled := false;
    n7.Enabled := true; //暂缓
    if dm.AQ0070status.Value=8 then n21.Enabled:=true;
   end;
  2:                       //被退回
   begin
    n8.Enabled := false;
    n10.Enabled := false;    //结束
    n11.Enabled := false;   //重新起动
   end;
  4:
   begin                    //已暂缓
    n2.Enabled := false;    //不能编辑
    n9.Enabled := false;    //取消
    n10.Enabled := false;   //030528修改
    n11.Enabled := false;
   end;
  3:
   begin                       //被保留号
    n8.Enabled := false;
    n11.Enabled := false;
   end;
  5: //已审批
   begin
    n8.Enabled := false;
    n11.Enabled := false;
    n2.Enabled := false;      //编辑
    n24.Enabled := true;
    n9.Enabled := false;
   end;
  6:                          //已收货
    begin
     n2.Enabled := false;
     n8.Enabled := false;
     n9.Enabled := false;
     n10.Enabled := false;
    end;
  7:                         //已完成
    begin
     n2.Enabled := false;
     n8.Enabled := false;
     n9.Enabled := false;
     n10.Enabled := false;
     n11.Enabled := false;
    end;
  else
   begin
    n2.Enabled := false;
    n3.Enabled := false;
    n8.Enabled := false;
    n9.Enabled := false;
    n10.Enabled := false;
    n11.Enabled := false;
    n13.Enabled := false;
    n20.Enabled := false;
    n12.Enabled := false; //收货信息
    n18.Enabled := false; //备注信息
    n19.Enabled := false; //审批信息
    n23.Enabled := false; //连续打印
    n25.Enabled := false;
   end;
 end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
 dm.AQ0070.Edit;
 dm.AQ0070status.Value:=4;
 dm.AQ0070.Post;
 with dm.ADO0339 do
  begin
   active:=false;
   Parameters.ParamValues['po_ptr'] := dm.AQ0070rkey.Value;
   Parameters.ParamValues['edit_empl_ptr'] := v_employee;
   Parameters.ParamValues['tran_type'] := 11;
   Parameters.ParamValues['tran_desc'] := '采购定单状态已更改';
   Parameters.ParamValues['tran_from'] := null;
   Parameters.ParamValues['tran_to'] := '采购订单已被暂缓';
   Parameters.ParamValues['data0071_ptr'] := null;
   Parameters.ParamValues['data0072_ptr'] := null;
   ExecSQL;
  end;
end;

procedure TForm1.N8Click(Sender: TObject); //发放采购订单
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
  dm.AQ0070.Edit;
  dm.AQ0070status.Value:=8; //未审核
  dm.AQ0070.Post;
  with dm.ADO0339 do
  begin
   active:=false;
   Parameters.ParamValues['po_ptr'] := dm.AQ0070rkey.Value;
   Parameters.ParamValues['edit_empl_ptr'] := v_employee;
   Parameters.ParamValues['tran_type'] := 11;
   Parameters.ParamValues['tran_desc'] := '采购定单状态已更改';
   Parameters.ParamValues['tran_from'] := null;
   Parameters.ParamValues['tran_to'] := '采购订单已被重新起动变有效';
   Parameters.ParamValues['data0071_ptr'] := null;
   Parameters.ParamValues['data0072_ptr'] := null;
   ExecSQL;
  end;
 end;
end;

procedure TForm1.N9Click(Sender: TObject);
var
 pk:integer;
 search_option:tlocateoptions;
 po_number:string;
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;

 if if_receivd then
  begin
   messagedlg('该采购已经有收货记录不能取消,请使用结束功能',mtinformation,[mbok],0);
   exit;
  end;

 if application.MessageBox('订单将被删除重新生成请购单,您是否确认?',
 '程序执行确认',MB_YesNo+MB_DEFBUTTON2+MB_IconASterisk)<>IDYes then
  exit;

 po_number:=dm.AQ0070po_number.Value;
 dm.ADOConnection1.BeginTrans;
  try
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 with dm.ASP362 do //下面程序段为030328修改(主要是修改采购所对应的预算)
  begin
   close;
   Parameters[1].Value:=dm.aq0070fob.value;
   open;
   if not isempty then
    begin
     edit;
     dm.ASP362STATUS.Value:=5;  //注明请购单已被撤销
     fieldvalues['used_period_'+inttostr(dm.ASP362v_month.Value)]:=
     formatfloat('0.00',
     fieldvalues['used_period_'+inttostr(dm.ASP362v_month.Value)]-
     dm.aq0070sub_total.value/dm.Aq0070EXCHANGE_RATE.Value);
     post;   //修改采购单对应请购单所使用的预算(将已使用的预算减少)
    end;
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 if dm.AQ0070fob.AsVariant <> null then  pochangepr(trim(dm.AQ0070fob.Value));
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  with dm.ADOQuery2 do
   begin
    active := false;
    sql.Clear;
    sql.Add('delete from  data0070');
    sql.Add('where rkey = '+dm.AQ0070rkey.AsString);
    ExecSQL;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0070');
    sql.Add('where fob ='''+trim(dm.AQ0070fob.Value)+'''');
    sql.Add('and rkey<>'+dm.AQ0070rkey.AsString);
    open;
   end;
 if dm.ADOQuery1.IsEmpty then  //如果为空记录代表pr只生成了一张po,可以删pr
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('delete from  data0068');
    sql.Add('where PO_REQ_NUMBER='''+trim(dm.AQ0070fob.Value)+'''');
    dm.ADOQuery2.ExecSQL;
   end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   dm.ADOConnection1.CommitTrans;
   dm.AP69204.Close;
   dm.adoap68.Close;
   dm.ASP362.Close;
   if dm.ADO71.Active=true then dm.ADO71.Close;
   if dm.ADO72.Active=true then dm.ADO72.Close;
   dm.ADOQuery1.Close;
   dm.ADOQuery2.Close;
   if dm.AQ0070fob.AsVariant <> null then
   showmessage('新的请购单已生成,编号为:'+self.pr_number+#13+
                  '  原采购订单号'+po_number+'为了重新使用已被删除,请牢记!!!');
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据保存失败,请认真检查,或通知管理员',mtinformation,[mbcancel],0);
  end;
   pk:=dm.AQ0070rkey.Value;
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   search_option := [lopartialkey];
   dm.AQ0070.Locate('rkey',pk,search_option);
end;

procedure TForm1.N10Click(Sender: TObject);  //结束采购订单
var
 rkey70:integer;
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('update data0070');
    sql.Add('set status = 6');    //使采购订单成为'已收货'状态
    sql.Add('where rkey = '+dm.AQ0070rkey.AsString);
    dm.ADOQuery2.ExecSQL;
    rkey70:=dm.AQ0070rkey.Value;
    dm.AQ0070.Close;
    dm.AQ0070.Open;
    dm.AQ0070.Locate('rkey',rkey70,[]);
   end;
end;

procedure TForm1.N3Click(Sender: TObject);   //检查
begin
 try
  form13:=tform13.Create(application);
  dm.ADO70.Close;
  dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
  dm.ADO70.Open;
  dm.ADO70PO_NUMBER.EditMask := '';
  form13.ShowModal;
  dm.ADO70.Close;
 finally
  form13.free;
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
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.Adoconnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString :=db_ptr.Caption;
  dm.Adoconnection1.Connected :=true;
  dtpk2.Date:=date();
  dtpk1.Date:=date()-3;

  dm.AQ0070.Close;
  dm.AQ0070.Parameters[0].Value := 0;
  dm.AQ0070.Parameters[1].Value := 0;
  dm.AQ0070.Parameters[2].Value := 3;
  dm.AQ0070.Parameters[3].Value := 4;
  dm.AQ0070.Parameters[4].Value := 5;
  dm.AQ0070.Parameters[5].Value := 6;
  dm.AQ0070.Parameters[6].Value := 7;
  dm.AQ0070.Parameters[7].Value := 0;
  dm.AQ0070.Parameters[8].Value:= dtpk1.Date;
  dm.AQ0070.Parameters[9].Value:= dtpk2.Date;
  dm.AQ0070.Open;

//  dm.aq0017.Open;
//  dm.AQ0001.Open;
//  dm.aq0002.open;
//  dm.AQ0024.Open;
//  dm.AQ0199.Open;
  dm.AQ0493.Open;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0077');
   open;
   if isempty then
    begin
     messagedlg('采购审批人员不能为空记录,请运行材料采购审批授权!',mtinformation,[mbok],0);
     application.Terminate;
     exit;
    end;
  end;

 with dm.ADOQuery1 do
  begin                   //查找系统用户的员工指针
   active:=false;
   sql.Clear;             //给编辑人员赋值
   sql.Add('select data0073.employee_ptr,data0005.employee_name');
   sql.Add('from data0073 inner join data0005');
   sql.Add('on data0073.employee_ptr=data0005.rkey');
   sql.Add('where data0073.rkey='+csi_rkey.Caption);
   active:=true;
   v_employee:=fieldvalues['employee_ptr'];
   employee_name:=fieldvalues['employee_name']
  end;

 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select v_dt = getdate()');
   active:=true;   //读取系统时间
   sys_date := strtodate(datetostr(fieldvalues['v_dt']));//12采购定单日期
   long_sysdate :=fieldvalues['v_dt'];
  end;
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select abbr_name from data0015');
   open;
   while not eof do
    begin
     combobox2.Items.Add(dm.ADOQuery2.FieldValues['abbr_name']);
     next;
    end;
   combobox2.Items.Add('全部');
   combobox2.ItemIndex:=combobox2.Items.Count-1;
  end;
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select suplstamat,suplstamisc from data0192');
   active:=true;   
   if fieldvalues['suplstamat']<>null then
    if_print := fieldvalues['suplstamat'];  //审核前是否可以打印
   if fieldvalues['suplstamisc']<>null then  //采购订单编号是否由控制码控制Y/N
    if_suplst := fieldvalues['suplstamisc'];
  end;
  dm.buyemp05.open;
  while not dm.buyemp05.Eof do
   begin
    combobox3.Items.Add(dm.buyemp05.FieldValues['EMPLOYEE_NAME']);
    dm.buyemp05.Next;
   end;
  dm.buyemp05.First; 
  combobox3.Items.Add('全部');
  combobox3.ItemIndex:=combobox3.Items.Count-1;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.AQ0070.SQL.Text);
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 checkbox1click(sender);
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
 dbgrid1.SetFocus;
end;

procedure TForm1.N11Click(Sender: TObject);
var
 rkey70:integer;
begin
//准备修改70状态
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('update data0070');
   sql.Add('set status = 5');    //使采购订单成为'已审批'状态
   sql.Add('where rkey = '+dm.AQ0070rkey.AsString);
   dm.ADOQuery2.ExecSQL;
   rkey70:=dm.AQ0070rkey.Value;
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   dm.AQ0070.Locate('rkey',rkey70,[]);
  end;
end;

function tform1.if_receivd():boolean;
begin
 if_receivd:=false;
 if (dm.AQ0070PO_TYPE.Value='S') then
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0022.rkey from data0071,data0022');
    sql.Add('where data0022.source_ptr=data0071.rkey and');
    sql.Add('data0071.po_ptr='+dm.AQ0070rkey.AsString);
    open;
    if not isempty then if_receivd:=true;
   end
 else
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0235.rkey from data0072,data0235');
    sql.Add('where data0235.D0072_PTR=data0072.rkey and');
    sql.Add('data0072.poptr='+dm.AQ0070rkey.AsString);
    open;
    if not isempty then if_receivd:=true;
   end;
end;

procedure TForm1.N20Click(Sender: TObject);
{var
 s:string;
 sim_total,tax_total:double;
 i:byte;}
begin
{ s:='                             ';
 sim_total:=0;
 tax_total:=0;
 dm.ADO70.Close;
 dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
 dm.ADO70.Open;
 dm.ADO107011.Close;
 dm.ado107011.Parameters[0].Value := dm.AQ0070rkey.Value;
 dm.ADO107011.Open;

 form16:=tform16.Create(application);
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select suplfedship,suplfedmat,suplfedmisc,suplstaship from data0192');
    open;
    form16.Edit1.Text:=dm.ADOQuery1.fieldbyname('suplfedship').AsString;  //smtp
    form16.Edit3.Text:=dm.ADOQuery1.fieldbyname('suplfedmat').AsString;  //发件人地址
    form16.Edit4.Text:=dm.ADOQuery1.fieldbyname('suplfedmisc').AsString; //用户句
    form16.Edit6.Text:=dm.ADOQuery1.fieldbyname('suplstaship').AsString; //密码
   end;
  with dm.ADOQuery2 do
   begin
    active:=false;         //读取装运地点信息
    sql.Clear;
    sql.Add('select factory_address_1,factory_address_2,factory_address_3,');
    sql.Add('CONTACT,PHONE,FAX,email_for_contact');
    sql.Add('from data0024');
    sql.Add('where rkey='+dm.Aq0070SUPP_FAC_ADD_PTR.AsString);
    active:=true;
    form16.Edit2.Text:=self.employee_name;//发件人姓名
    form16.Edit7.Text:=fieldbyname('email_for_contact').AsString;
   end;
   form16.RichEdit1.Lines.Add(dm.AQ0493Company_Name.Value);
   form16.RichEdit1.Lines.Add('采购订单');
   form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
   form16.RichEdit1.Lines.Add('供应商：  '+dm.AQ0070supplier_name.Value+'      请购编号:'
   +dm.AQ0070fob.Value+'   采购订单号： '+dm.AQ0070po_number.Value);
   form16.RichEdit1.Lines.Add('联络人：   '+dm.ADO70SUPPIER_CONTACT.Value+'   电话：'+dm.ADO70CONTACT_PHONE.Value+'     订单日期：'
   +dm.AQ0070po_date.AsString);
   form16.RichEdit1.Lines.Add('装运地点：  '+dm.ADO70factory_location.Value+'    装运方法：'
   +dm.ADO70SHIPPING_METHOD.Value);
   form16.RichEdit1.Lines.Add('装运地址：  '+trim(dm.ADOQuery2.fieldbyname('factory_address_1').AsString)+'  '
   +trim(dm.ADOQuery2.fieldbyname('factory_address_2').AsString)+'  '+trim(dm.ADOQuery2.fieldbyname('factory_address_3').AsString));
   form16.RichEdit1.Lines.Add('联络人：   '+dm.ADOQuery2.fieldbyname('contact').AsString+'   电话：  '+
   dm.ADOQuery2.fieldbyname('phone').AsString+'   传真：  '+dm.ADOQuery2.fieldbyname('fax').AsString);
   form16.RichEdit1.Lines.Add('装运到：  '+dm.AQ0493ship_address.Value+'     货币：    '+
   dm.ADO70curr_name.Value);
   form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
 if (dm.AQ0070PO_TYPE.Value='S') or (dm.AQ0070PO_TYPE.Value='T') then   //如果是标准的采购定单
  begin
   with dm.ADO71 do           //读取标准采购内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
     active:=true;
    end;
  form16.RichEdit1.Lines.Add('材料描述               单位   到货日期    数量   价格   不含税金额   税率%   税金  ');
  form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
 while not dm.ADO71.Eof do
  begin
   form16.RichEdit1.Lines.Add(trim(dm.ADO71inv_part_description.Value)+
   copy(s,1,23-length(trim(dm.ADO71inv_part_description.Value)))
   +dm.ADO71unit_name.Value+'     '+
   dm.ADO71req_DATE.AsString+'   '+dm.ADO71QUAN_ORD.AsString+'   '+dm.ADO71std_price.AsString+'    '+
   formatfloat('0.00',dm.ADO71sim_total.Value)+'    '+dm.ADO71TAX_2.AsString+'     '+formatfloat('0.00',dm.ADO71tax_total.Value));
   form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
   sim_total:=sim_total+dm.ADO71sim_total.Value;
   tax_total:=tax_total+dm.ADO71tax_total.Value;
   dm.ADO71.Next;
  end;
 end
else//杂项
 begin
  with dm.ADO72 do           //读取杂项采购内内容
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
   end;
  form16.RichEdit1.Lines.Add('杂项描述               单位   到货日期    数量   价格   不含税金额   税率%   税金  ');
  form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
 while not dm.ADO72.Eof do
  begin
   form16.RichEdit1.Lines.Add(trim(dm.ADO72DESCRIPTION.Value)+
   copy(s,1,23-length(trim(dm.ADO72DESCRIPTION.Value)))
   +dm.ADO72unit_name.Value+'     '+
   dm.ADO72DEL_DATE.AsString+'   '+dm.ADO72QUAN_ORD.AsString+'   '+dm.ADO72UNIT_PRICE.AsString+'    '+
   formatfloat('0.00',dm.ADO72sim_total.Value)+'    '+dm.ADO72state_TAX.AsString+'     '+formatfloat('0.00',dm.ADO72tax_total.Value));
   form16.RichEdit1.Lines.Add('————————————————————————————————————————————');
   sim_total:=sim_total+dm.ADO72sim_total.Value;
   tax_total:=tax_total+dm.ADO72tax_total.Value;
   dm.ADO72.Next;
  end;
 end;
  form16.RichEdit1.Lines.Add('                                                      小计：  '+formatfloat('0.00',sim_total)+'           '+
  formatfloat('0.00',tax_total));
  form16.RichEdit1.Lines.Add('                                              杂项费用：'+formatfloat('0.00',dm.ADO70MISC_CHARGE.Value));
  form16.RichEdit1.Lines.Add('                                              运输费用：'+formatfloat('0.00',dm.ADO70SHIPPING_COST.Value));
  form16.RichEdit1.Lines.Add('  付款方法：'+dm.ADO70ANALYSIS_CODE_5.Value+copy(s,1,30-(length(trim(dm.ADO70ANALYSIS_CODE_5.Value))))+
         '    杂项运输税：'+formatfloat('0.00',self.misc_ship_tax));
 form16.RichEdit1.Lines.Add('      大写：'+self.SmallTOBig(dm.ADO70SUB_TOTAL.Value)+'          总计： '+formatfloat('0.00',dm.ADO70SUB_TOTAL.Value));
 form16.RichEdit1.Lines.Add('');
 form16.RichEdit1.Lines.Add('                                     '+dm.AQ0493Company_Name.Value);
 form16.RichEdit1.Lines.Add('                                               '+self.employee_name+datetostr(date()));
 for i:=1 to 4 do
  form16.RichEdit1.Lines.Add(dm.ADO107011.fieldbyname('note_pad_line_'+inttostr(i)).AsString);
form16.RichEdit1.Lines.Add('   要求事项:');
form16.RichEdit1.Lines.Add('      1)、每次送货必须有完整的包装；');
form16.RichEdit1.Lines.Add('      2)、所有送货单或交付单上必须显示订货单号码；');
form16.RichEdit1.Lines.Add('      3)、供给本公司的所有物料必须满足对限制有毒、危险物品的政府要求及安全规定以及考虑');
form16.RichEdit1.Lines.Add('      生产和销售国有关环境、电力及电磁方面的规定；');
form16.RichEdit1.Lines.Add('      4)、必须100%准时交货。');
 form16.ShowModal;
 form16.Free;
 dm.ADO70.Close;
 dm.ADO107011.Close;
 dm.ADO71.Close;
 dm.ADO72.Close; }
end;

function tform1.misc_ship_tax():double;
var
 v_ship_tax,v_misc_tax,misc_base:single;
begin
 with dm.ADO200 do    //查找PO的杂项费用
  begin
   active:=false;
   Parameters[0].Value := dm.AQ0070rkey.Value;
   active:=true;
  end;
 v_ship_tax:=0;      //计算杂项与运输费用税金
 v_misc_tax:=0;
 misc_base:=0;
if dm.ADO70STATE_SHIP_TAX_FLAG.Value='Y' then
 v_ship_tax :=dm.ADO70SHIPPING_COST.Value*dm.ADO70FEDERAL_TAX.Value*0.01;
if dm.ADO70STATE_MISC_TAX_FLAG.Value='Y' then
 begin
  dm.ado200.First;
  while not dm.ADO200.Eof do
   begin
    if dm.ADO200TAXABLE.Value='Y' then
     misc_base := misc_base+ dm.ADO200AMOUNT.Value;
    dm.ADO200.Next;
   end;
  v_misc_tax := misc_base*dm.ADO70FEDERAL_TAX.Value*0.01;
 end;
 misc_ship_tax:=v_ship_tax+v_misc_tax;
 dm.ADO200.Close;
end;


function Tform1.SmallTOBig(small:double):string;
var
SmallMonth,BigMonth:string;
wei1,qianwei1:string[2];
qianwei,dianweizhi,qian:integer;
begin
 qianwei:=-2;
 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);{小数点的位置}
for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then{如果读到的不是小数点就继续}
begin
case strtoint(copy(Smallmonth,qian,1)) of{位置上的数转换成大写}
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='三'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of {判断大写位置，可以继续增大到real类型的最大值}
 -3:qianwei1:='厘';
 -2:qianwei1:='分';
 -1:qianwei1:='角';
 0 :qianwei1:='元';
 1 :qianwei1:='拾';
 2 :qianwei1:='佰';
 3 :qianwei1:='千';
 4 :qianwei1:='万';
 5 :qianwei1:='拾';
 6 :qianwei1:='佰';
 7 :qianwei1:='千';
 8 :qianwei1:='亿';
 9 :qianwei1:='十';
 10:qianwei1:='佰';
 11:qianwei1:='千';
end;
 inc(qianwei); //自动加1
 BigMonth :=wei1+qianwei1+BigMonth;{组合成大写金额}
end;
end;
 SmallTOBig:=BigMonth;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
if (self.if_print='Y') then
 begin
  if (dm.AQ0070status.Value<>5) and
     (dm.AQ0070status.Value<>6) and
     (dm.AQ0070status.Value<>7) then
  begin
   showmessage('对不起,没有审批的订单不能够被打印');
   exit;
  end;
 end;

 dm.ADO70.Close;
 dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
 dm.ADO70.Open;
 with dm.ADO200 do    //查找PO的杂项费用
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 with dm.ado107011 do //读取交货记事本4行
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 with dm.ado7011 do //读取订单记事本4行
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;

 with dm.ADO0450 do //读取订单退回原因记事本memo
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 dm.AQ0015.Close;
 dm.AQ0015.Parameters[0].Value := dm.ADO70WAREHOUSE_POINTER.Value;
 dm.AQ0015.Open;

 if dm.ADO70PO_TYPE.Value='S' then   //如果是标准的采购定单
  begin
   with dm.ADO71 do           //读取标准采购内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
     active:=true;
     if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    end;
   if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
    try
    form14:=tform14.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form14.ppImage1.Visible :=false;
      form14.ppImage2.Visible :=false;
     end;
    except
    end;
     Form14.ppReport1.Print;
    finally
     form14.free;
     dm.AQ0015.Close;
    end
   else                               //国外采购
   try
    form17:=tform17.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form17.ppImage1.Visible :=false;
      form17.ppImage2.Visible :=false;
     end;
    except
    end;
    Form17.ppReport1.Print;
   finally
    form17.free;
    dm.AQ0015.Close;
   end;
 end
else               //杂项采购订单
 if dm.ADO70PO_TYPE.Value='M' then
 begin
  with dm.ADO72 do           //读取杂项采购内内容
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO72.Filter <> '' then dm.ADO72.Filter := '';
   end;
  if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
   try
    form15:=tform15.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form15.ppImage1.Visible :=false;
      form15.ppImage2.Visible :=false;
     end;
    except
    end;
    Form15.ppReport1.Print;
   finally
    form15.free;
    dm.AQ0015.Close;
   end
  else                                //国外采购
   try
    form18:=tform18.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form18.ppImage1.Visible :=false;
      form18.ppImage2.Visible :=false;
     end;
    except
    end;
    Form18.ppReport1.Print;
   finally
    form18.free;
    dm.AQ0015.Close;
   end;
  end;

 if dm.AQ0070print_date.AsVariant=null then
 if messagedlg('将该PO标识为已打印吗？',mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
   dm.AQ0070.Edit;
   dm.AQ0070PRINT_DATE.Value :=sys_date;
   dm.AQ0070.Post;
  end;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 try
  form12 := tform12.Create(application);
  dm.ADO70.Close;
  dm.ADO70.Parameters[1].Value := null;
  dm.ADO70.Open;
  dm.ADO70.Append;
  dm.ADO70PO_TYPE.Value := 'S';      //标准采购订单
  dm.ADO70DISCOUNT2_DAYS.Value := 0; //国内采购
  if form12.ShowModal = mrok then
   begin
    dm.AQ0070.Close;
    dm.AQ0070.Open;
    dm.AQ0015.Close;
    dm.ADO70.Close;
   end;
 finally
  form12.free;
 end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 dbgrid1.Columns[0].Width:=112+round((dbgrid1.Width-807)*112/775);
 dbgrid1.Columns[1].Width:=84+round((dbgrid1.Width-807)*84/775);
 dbgrid1.Columns[2].Width:=64+round((dbgrid1.Width-807)*64/775);
 dbgrid1.Columns[3].Width:=83+round((dbgrid1.Width-807)*83/775);
 dbgrid1.Columns[4].Width:=76+round((dbgrid1.Width-807)*76/775);
 dbgrid1.Columns[5].Width:=75+round((dbgrid1.Width-807)*75/775);
 dbgrid1.Columns[6].Width:=62+round((dbgrid1.Width-807)*62/775);
 dbgrid1.Columns[7].Width:=70+round((dbgrid1.Width-807)*70/775);
 dbgrid1.Columns[8].Width:=93+round((dbgrid1.Width-807)*93/775);
 dbgrid1.Columns[9].Width:=56+round((dbgrid1.Width-807)*56/775);
end;

procedure tform1.pochangepr(pr_number:string);
var
 i,id,v_moth:word;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('select CURRENY_PTR from data0068');
  sql.Add('where po_req_number = '''+pr_number+'''');
  open;
  if not IsEmpty then
   v_moth:=fieldvalues['CURRENY_PTR']
  else
   v_moth:=0;
 end;

 if (v_moth=1) or (v_moth=2) then  //从新单拆分
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select po_req_number,CURRENY_PTR from data0068');
    sql.Add('where po_req_number like '''+pr_number+'%''');
    sql.Add('order by po_req_number desc');
    open;
   end
 else                      //从被拆下的单再次拆分
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select po_req_number,CURRENY_PTR from data0068');
    sql.Add('where po_req_number like '''+copy(pr_number,1,
    length(pr_number)-1)+'%''');
    sql.Add('order by po_req_number desc');
    open;
   end;

  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0068');
    sql.Add('where po_req_number ='''+pr_number+'''');
    open;
   end;
if not dm.ADOQuery2.IsEmpty then
 begin
  dm.ADOAP68.Open;
  dm.ADOAP68.Append;
  for i:=2 to 24 do
   dm.ADOAP68.fieldvalues[dm.ADOap68.Fields[i].FieldName]:=
   dm.adoquery2.fieldvalues[dm.adoquery2.Fields[i].FieldName];

  if trim(dm.ADOQuery1.FieldValues['po_req_number'])=pr_number then   //在最后一张单上拆分
   if (dm.ADOQuery1.FieldValues['CURRENY_PTR']=1) or
      (dm.ADOQuery1.FieldValues['CURRENY_PTR']=2) then //第一次拆分
    dm.ADOAP68PO_REQ_NUMBER.Value := pr_number+'R1'
   else     //多次拆分
    begin
     id := strtoint(copy(pr_number,length(pr_number),1))+1;
     dm.ADOAP68PO_REQ_NUMBER.Value := copy(pr_number,1,length(pr_number)-1)+inttostr(id);
    end
  else    //在中间拆分
   begin
    id := strtoint(copy(dm.ADOQuery1.fieldvalues['po_req_number'],
                   length(trim(dm.ADOQuery1.fieldvalues['po_req_number'])),1))+1;
    dm.ADOAP68PO_REQ_NUMBER.Value := copy(dm.ADOQuery1.fieldvalues['po_req_number'],1,
                                   length(trim(dm.ADOQuery1.fieldvalues['po_req_number']))-1)+inttostr(id);
   end;

  dm.adoap68STATUS.Value :=3;      //已批准
  dm.adoap68TOTAL.Value :=0;
  dm.adoap68CURRENY_PTR.Value :=0;//表款该请购单是从po取消中生成的
  dm.ADOAP68.Post;

  if dm.AQ0070PO_TYPE.Value='S' then   //如果是标准的采购定单
  begin
   with dm.ADO71 do           //读取标准采购内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.AQ0070rkey.AsString);
     active:=true;
     if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    end;
   with dm.AP69204 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0069');
     sql.Add('where purch_req_ptr = '+dm.ADOAP68RKEY.AsString);
     open;
    end;
   while not dm.ADO71.Eof do
    begin
     dm.AP69204.Append;
     dm.AP69204.FieldValues['PURCH_REQ_PTR'] := dm.adoap68RKEY.Value;
     dm.AP69204.FieldValues['INVT_PTR'] := dm.ADO71INVT_PTR.Value;
     dm.AP69204.FieldValues['UNIT_PTR'] := dm.ADO71PURCHASE_UNIT_PTR.Value;
     dm.AP69204.FieldValues['req_unit_ptr']:=dm.ADO71WO_PTR.Value;
     dm.AP69204.FieldValues['REQ_DATE'] := dm.ADO71REQ_DATE.Value;
     dm.AP69204.FieldValues['QUANTITY'] := dm.ADO71QUAN_ORD.Value;
     dm.AP69204.FieldValues['req_quantity'] := dm.ADO71QUAN_IN_INSP.Value;
     dm.AP69204.FieldValues['CONVERSION_FACTOR'] := dm.ADO71CONVERSION_FACTOR.Value;
     dm.AP69204.FieldValues['reason'] := dm.ADO71reason.Value;
     dm.AP69204.FieldValues['extra_req'] := dm.ADO71extra_req.Value;
     dm.AP69204.Post;
     dm.ADO71.Next;
    end;
  end
  else
  begin
   with dm.ADO72 do           //读取杂项采购内内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0072');
     sql.Add('where poptr='+dm.AQ0070rkey.AsString);
     active:=true;
     if dm.ADO72.Filter <> '' then dm.ADO72.Filter := '';
    end;
   with dm.AP69204 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0204');
     sql.Add('where purchase_req_ptr='+dm.ADOAP68RKEY.AsString);
     open;
    end;
   while not dm.ADO72.Eof do
    begin
     dm.AP69204.Append;
     dm.AP69204.FieldValues['PURCHASE_REQ_PTR'] := dm.adoap68RKEY.Value;
     dm.AP69204.FieldValues['DESCRIPTION_1'] := dm.ADO72DESCRIPTION.Value;
     dm.AP69204.FieldValues['GUI_GE'] := dm.ADO72GUI_GE.Value;
     dm.AP69204.FieldValues['DESCRIPTION_2'] := dm.ADO72DESCRIPTION2.Value;
     dm.AP69204.FieldValues['QUANTITY_REQUIRED'] := dm.ADO72QUAN_ORD.Value;
     dm.AP69204.FieldValues['REQ_DATE'] := dm.ADO72DEL_DATE.Value;
     dm.AP69204.FieldValues['G_L_PTR'] := dm.ADO72UNIT_PTR.Value;
     dm.AP69204.FieldValues['reason'] := dm.ADO72reason.Value;
     dm.AP69204.FieldValues['UNIT_PRICE'] := 0;

     dm.AP69204.Post;
     dm.ADO72.Next;
    end;
  end;
  self.pr_number:=dm.ADOAP68PO_REQ_NUMBER.Value;
 end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 try
  form19 := tform19.Create(application);
  if (dm.AQ0070PO_TYPE.Value = 'S') then
   begin
    dm.DataSource6.DataSet := dm.ADOQuery4;
    dm.DataSource7.DataSet := dm.ADOQuery6;
    dm.ADOQuery4.Open;
    dm.ADOQuery6.Open;
    if not dm.ADOQuery4.IsEmpty then
     form19.ShowModal
    else
     messagedlg('对不起该采购单还没有收货记录!',mtinformation,[mbok],0);
   end
  else
   begin
    dm.DataSource6.DataSet := dm.ADOQuery5;
    dm.DataSource7.DataSet := dm.ADOQuery7;
    dm.ADOQuery5.Open;
    dm.ADOQuery7.Open;
    if not dm.ADOQuery5.IsEmpty then
     form19.ShowModal
    else
     messagedlg('对不起该采购单还没有收货记录!',mtinformation,[mbok],0);
   end;
 finally
  form19.Free;
  if dm.ADOQuery4.Active = true then dm.ADOQuery4.Close;
  if dm.ADOQuery5.Active = true then dm.ADOQuery5.Close;
  if dm.ADOQuery6.Active = true then dm.ADOQuery6.Close;
  if dm.ADOQuery7.Active = true then dm.ADOQuery7.Close;
 end;

end;

procedure TForm1.N18Click(Sender: TObject);
var
 i:word;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption := '订单:'+dm.aq0070PO_NUMBER.Value+'备注信息';
  with dm.ado107011 do            // 采购订单交货记事本
   begin
    active:=false;
    Parameters[0].Value := dm.AQ0070rkey.Value;
    active:=true;
   end;
  if not dm.ADO107011.IsEmpty then
   for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(dm.ado107011.fieldbyname('note_pad_line_'+inttostr(i)).AsString);

 if edit_note.ShowModal=mrok then
  begin
   if (not dm.ado107011.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
    begin //原记录有记事本
     dm.ado107011.Edit;
     for i:=1 to 4 do
      if edit_note.Memo1.Lines.Count>=i then
       dm.ado107011.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]
      else
       dm.ado107011.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
     dm.ADO107011.UpdateBatch();
    end
   else
    if (not dm.ado107011.IsEmpty) and (trim(edit_note.Memo1.Text)='') then
     begin
      dm.ado107011.Delete;   //如果原记录有记事本但被删除了
      dm.ADO107011.UpdateBatch();
     end
    else
     if (dm.ado107011.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
      begin    //如果原记录没有记事本，但新增了记事本
       dm.ado107011.Append;
       dm.ado107011.fieldvalues['file_pointer'] := dm.Aq0070RKEY.Value;
       dm.ado107011.Fieldvalues['source_type']:=1070;
       for i:=1 to edit_note.Memo1.Lines.Count do
       dm.ado107011.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.memo1.lines[i-1];
       dm.ADO107011.UpdateBatch();
      end;
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if (length(bar1.SimpleText)>5) and ((combobox1.ItemIndex<>combobox1.Items.Count-1)) and      //1
   (combobox2.ItemIndex<>combobox2.Items.Count-1) then
dm.aq0070.Filter := 'po_number like '''+trim(copy(bar1.SimpleText,6,length(bar1.SimpleText)))+'%'''
 +' and discount2_days = '+inttostr(combobox1.ItemIndex)+''
 +' and ware_name = '''+combobox2.Items.Strings[combobox2.ItemIndex]+''''
else
if (length(bar1.SimpleText)>5) and ((combobox1.ItemIndex<>combobox1.Items.Count-1)) and    //2
   (combobox2.ItemIndex=combobox2.Items.Count-1) then
dm.aq0070.Filter := 'po_number like '''+trim(copy(bar1.SimpleText,6,length(bar1.SimpleText)))+'%'''
 +' and discount2_days = '+inttostr(combobox1.ItemIndex)+''
else
if (length(bar1.SimpleText)>5) and ((combobox1.ItemIndex=combobox1.Items.Count-1)) and    //3
   (combobox2.ItemIndex<>combobox2.Items.Count-1) then
dm.aq0070.Filter := 'po_number like '''+trim(copy(bar1.SimpleText,6,length(bar1.SimpleText)))+'%'''
 +' and ware_name = '''+combobox2.Items.Strings[combobox2.ItemIndex]+''''
else
if (length(bar1.SimpleText)>5) and ((combobox1.ItemIndex=combobox1.Items.Count-1)) and    //4
   (combobox2.ItemIndex=combobox2.Items.Count-1) then
 dm.aq0070.Filter := 'po_number like '''+trim(copy(bar1.SimpleText,6,length(bar1.SimpleText)))+'%'''
else
if (length(bar1.SimpleText)<=5) and ((combobox1.ItemIndex<>combobox1.Items.Count-1)) and    //5
   (combobox2.ItemIndex<>combobox2.Items.Count-1) then
 dm.aq0070.Filter := 'discount2_days = '+inttostr(combobox1.ItemIndex)+''
  +' and ware_name = '''+combobox2.Items.Strings[combobox2.ItemIndex]+''''
else
if (length(bar1.SimpleText)<=5) and ((combobox1.ItemIndex<>combobox1.Items.Count-1)) and    //6
   (combobox2.ItemIndex=combobox2.Items.Count-1) then
 dm.aq0070.Filter := 'discount2_days = '+inttostr(combobox1.ItemIndex)+''
else
if (length(bar1.SimpleText)<=5) and ((combobox1.ItemIndex=combobox1.Items.Count-1)) and    //7
   (combobox2.ItemIndex<>combobox2.Items.Count-1) then
 dm.aq0070.Filter := 'ware_name = '''+combobox2.Items.Strings[combobox2.ItemIndex]+''''
else     //8
dm.AQ0070.Filter := '';

end;

procedure TForm1.N19Click(Sender: TObject);
begin
form_auth_info:=tform_auth_info.Create(application);
dm.ADO78.Close;
dm.ADO78.Parameters[1].Value:=dm.AQ0070rkey.Value;
dm.ADO78.Open;
form_auth_info.ShowModal;
form_auth_info.Free;
dm.ADO78.Close;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
 dm.ADOConnection1.BeginTrans;
 try
  self.save_auth;
  dm.AQ0070.Edit;
  dm.AQ0070status.Value:=1;  //待审核
  dm.AQ0070DATE_EDITED.Value:=long_sysdate;
  dm.AQ0070.Post;
  dm.ADOConnection1.CommitTrans;
  dm.ASP78.Close;

 except
  dm.ADOConnection1.RollbackTrans;
  showmessage('数据提交不成功');
 end;
end;

procedure tform1.save_auth();
begin
 with dm.asp78 do
  begin
   close;
   dm.ASp78.Parameters[1].Value := dm.AQ0070rkey.value;
   open;
  end;
 while not dm.ASP78.Eof do dm.asp78.Delete;

 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT USER_PTR FROM Data0077');
  sql.Add('WHERE (lower_limit <= :total1)');
  sql.Add('and (upper_limit >= :total2)');
  sql.Add('ORDER BY rkey');
  Parameters.ParamValues['total1'] := dm.Aq0070SUB_TOTAL.Value/dm.Aq0070EXCHANGE_RATE.Value;
  Parameters.ParamValues['total2'] := dm.Aq0070SUB_TOTAL.Value/dm.Aq0070EXCHANGE_RATE.Value;
  open;
 end;

 if not dm.ADOQuery1.IsEmpty then //不为空表示分级审批
  while not dm.ADOQuery1.Eof do
  begin
   dm.ASp78.Append;
   dm.ASP78po_ptr.Value:=dm.Aq0070RKEY.Value;
   dm.ASP78user_ptr.Value:=dm.ADOQuery1.FieldValues['user_ptr'];
   dm.ASP78ranking.Value:=dm.ADOQuery1.RecNo;
   if dm.ADOQuery1.RecNo=1 then
    dm.asp78auth_flag.value:='Y'
   else
    dm.ASP78auth_flag.Value:='N';
   dm.ASP78.Post;
   dm.ADOQuery1.Next;
  end
 else   //为空记录表示所有人都要参于会签
 begin
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT USER_PTR FROM Data0077');
    sql.Add('order by rkey');  //排序是表示根据金额审批分级
    open;
   end;
  while not dm.ADOQuery2.Eof do
   begin
    dm.ASp78.Append;
    dm.ASP78po_ptr.Value:=dm.Aq0070RKEY.Value;
    dm.ASP78user_ptr.Value:=dm.ADOQuery2.FieldValues['user_ptr'];
    dm.ASP78ranking.Value:=dm.ADOQuery2.RecNo;
    if dm.ADOQuery1.RecNo=1 then
     dm.asp78auth_flag.value:='Y'
    else
     dm.ASP78auth_flag.Value:='N';
    dm.ASP78.Post;
    dm.ADOQuery2.Next;
   end
 end;
  dm.ASP78.First;

end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.AQ0070status.Value=2) then
  DBGrid1.Canvas.Font.Color := clred
 else
  if (dm.AQ0070status.Value=8) then
   DBGrid1.Canvas.Font.Color := cllime;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
 info:string;
begin
if dm.AQ0070status.Value=2 then
 begin
  info:='采购单会签未通过!'+#13;
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select employee_name from data0005');
    sql.Add('where rkey='+dm.AQ0070STATE_TAX.AsString);
    open;
   end;
  with dm.ADO0450 do
   begin
    close;
    Parameters[0].Value:=dm.AQ0070rkey.Value;
    open;
   end;
  info:=info+dm.ADOQuery2.FieldValues['employee_name']+' 于日期: '+dm.AQ0070PRINT_TIME.AsString+'退回'+#13;
  info:=info+'原因如下:'+#13;
  info:=info+dm.ADO0450.FieldValues['memo_text'];
  showmessage(info);
 end
else
 if not dm.AQ0070.IsEmpty then N3Click(sender); 
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey70:integer;
begin
 rkey70:=dm.AQ0070rkey.Value;
 dm.AQ0070.Close;
 dm.AQ0070.Open;
 if rkey70 > 0 then dm.AQ0070.Locate('rkey',rkey70,[]);
end;

procedure TForm1.append_70(v_new: byte; po_type: char);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form4:=tform4.Create(application);
 form4.v_new_type:=v_new; //注意可以多条记录!
 form4.po_type:=po_type;
 dm.ADO70.Close;
 dm.ADO70.Parameters[1].Value := null;
 dm.ADO70.Open;
 form4.TC1.Visible:= false;
 dm.ADO70PO_NUMBER.EditMask:='';
 if form4.ShowModal=mrok then
  begin
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   dm.AQ0070.Locate('rkey',dm.ADO70RKEY.Value,[]);
   dm.ADO70.Close;
  end;
finally
 form4.Free;
end;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
if combobox3.ItemIndex<>combobox3.Items.Count-1 then
 begin
  dm.buyemp05.MoveBy((combobox3.ItemIndex+1)-dm.buyemp05.RecNo);
  with dm.AQ0070 do
   begin
    close;
    sql.Delete(20);
    sql.Insert(20,'and data0070.employee_pointer ='+dm.buyemp05.fieldbyname('rkey').AsString);
    open;
   end;
 end
else
 begin
  with dm.AQ0070 do
   begin
    close;
    sql.Delete(20);
    sql.Insert(20,'');
    open;
   end;
 end;
end;

procedure TForm1.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
 combobox3.DroppedDown:=true;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
form21:=tform21.Create(application);
form21.ShowModal;
form21.Free;
end;

procedure TForm1.N23Click(Sender: TObject);
var
 i,rkey70:integer;
begin
form_mulreport:=tform_mulreport.Create(application);
if form_mulreport.ShowModal=mrok then
 begin
  rkey70:=dm.AQ0070rkey.Value;
  dm.AQ0070.DisableControls;
  for i:=1 to form_mulreport.StG2.RowCount-2 do
   mul_print(strtoint(form_mulreport.StG2.Cells[2,i]));
  dm.AQ0070.Close;
  dm.AQ0070.Open;
  dm.AQ0070.Locate('rkey',rkey70,[]);
  dm.AQ0070.EnableControls;
 end;
form_mulreport.Free;
end;


procedure TForm1.mul_print(rkey70:integer);
begin
 dm.AQ0070.Locate('rkey',rkey70,[]);
 dm.ADO70.Close;
 dm.ADO70.Parameters[1].Value := rkey70;
 dm.ADO70.Open;
 with dm.ADO200 do    //查找PO的杂项费用
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 with dm.ado107011 do //读取交货记事本4行
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 with dm.ado7011 do //读取订单记事本4行
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 with dm.ADO0450 do //读取订单退回原因记事本memo
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70RKEY.Value;
   active:=true;
  end;
 dm.AQ0015.Close;
 dm.AQ0015.Parameters[0].Value := dm.ADO70WAREHOUSE_POINTER.Value;
 dm.AQ0015.Open;

if (self.if_print='Y') then
 begin
  if (dm.ADO70STATUS.Value=5) or (dm.ADO70STATUS.Value=6) or (dm.ADO70STATUS.Value=7) then
   self.m_print;
 end
else
 self.m_print;
 
end;

procedure TForm1.m_print();
begin
 if dm.ADO70PO_TYPE.Value='S' then   //如果是标准的采购定单
  begin
   with dm.ADO71 do           //读取标准采购内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
     active:=true;
     if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    end;
   if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
    try
    form14:=tform14.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form14.ppImage1.Visible :=false;
      form14.ppImage2.Visible :=false;
     end;
    except
    end;
     form14.ppReport1.DeviceType:='Printer';
     form14.ppReport1.ShowPrintDialog:=false;
     Form14.ppReport1.Print;
    finally
     form14.free;
     dm.AQ0015.Close;
    end
   else                               //国外采购
   try
    form17:=tform17.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form17.ppImage1.Visible :=false;
      form17.ppImage2.Visible :=false;
     end;
    except
    end;
    form17.ppReport1.DeviceType:='Printer';
    form17.ppReport1.ShowPrintDialog:=false;
    Form17.ppReport1.Print;
   finally
    form17.free;
    dm.AQ0015.Close;
   end;
 end
else               //杂项采购订单
 if dm.ADO70PO_TYPE.Value='M' then
 begin
  with dm.ADO72 do           //读取杂项采购内内容
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO72.Filter <> '' then dm.ADO72.Filter := '';
   end;
  if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
   try
    form15:=tform15.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form15.ppImage1.Visible :=false;
      form15.ppImage2.Visible :=false;
     end;
    except
    end;
    form15.ppReport1.DeviceType:='Printer';
    form15.ppReport1.ShowPrintDialog:=false;
    Form15.ppReport1.Print;
   finally
    form15.free;
    dm.AQ0015.Close;
   end
  else                                //国外采购
   try
    form18:=tform18.Create(application);
    try
    if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
     begin                        //未审核的订单使签名不可风见
      form18.ppImage1.Visible :=false;
      form18.ppImage2.Visible :=false;
     end;
    except
    end;
    form18.ppReport1.DeviceType:='Printer';
    form18.ppReport1.ShowPrintDialog:=false;
    Form18.ppReport1.Print;
   finally
    form18.free;
    dm.AQ0015.Close;
   end;
  end;
  if dm.ADO70PRINT_DATE.AsVariant=null then
   begin
    dm.ADO70.Edit;
    dm.Ado70PRINT_DATE.Value :=sys_date;
    dm.Ado70.UpdateBatch;
   end;

end;

procedure TForm1.N24Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)<>4) then
 showmessage('对不起,您没有取消审核的权限!')
else
 begin
  if if_receivd then
   messagedlg('该采购已经有收货记录不能取消审核!',mtinformation,[mbok],0)
  else
   begin
    dm.AQ0070.Edit;
    dm.AQ0070status.Value:=8;  //待审核
    dm.AQ0070DATE_EDITED.AsVariant:=null;
    dm.AQ0070.Post;
   end;
 end;
end;

procedure TForm1.N25Click(Sender: TObject);
var
 v_txt:string;
begin
 form16:=tform16.Create(application);
 if dm.AQ0070PO_TYPE.Value = 'M' then
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT dbo.Data0339.TRAN_DESCRIPTION, dbo.Data0339.TRAN_FROM,');
    sql.Add('dbo.Data0339.TRAN_TO, dbo.Data0339.TRAN_DATE,');
    sql.Add('dbo.Data0005.EMPLOYEE_NAME, dbo.Data0339.TRAN_TYPE,');
    sql.Add('Data0072.DESCRIPTION');
    sql.Add('FROM Data0339 INNER JOIN Data0005 ON');
    sql.Add('Data0339.EDITED_BY_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN');
    sql.Add('Data0072 ON dbo.Data0339.DATA0072_PTR = dbo.Data0072.RKEY');
    sql.Add('WHERE dbo.Data0339.TRAN_TYPE <> 6');
    sql.Add('and data0339.po_ptr='+dm.AQ0070rkey.AsString);
    sql.add('order by TRAN_DATE');
    open;
   end;
   while not dm.ADOQuery1.Eof do
    begin
     v_txt:= trim(dm.ADOQuery1.FieldValues['EMPLOYEE_NAME'])+
             trim(dm.ADOQuery1.fieldbyname('TRAN_DATE').AsString)+
             trim(dm.ADOQuery1.FieldValues['TRAN_DESCRIPTION']);
     form16.Memo1.Lines.Add(v_txt);
     v_txt:='物品名称:'+trim(dm.ADOQuery1.fieldbyname('DESCRIPTION').AsString)+
            '原值:'+trim(dm.ADOQuery1.fieldbyname('TRAN_FROM').AsString)+
            '新值:'+trim(dm.ADOQuery1.fieldbyname('TRAN_TO').AsString);

     form16.Memo1.Lines.Add(V_TXT);
     dm.ADOQuery1.Next;
    end;
  end
 else
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('SELECT Data0339.TRAN_DESCRIPTION, Data0339.TRAN_FROM,');
     sql.Add('Data0339.TRAN_TO, Data0339.TRAN_DATE,');
     sql.Add('Data0005.EMPLOYEE_NAME, Data0017.INV_PART_NUMBER');
     sql.Add('FROM Data0017 INNER JOIN Data0071 ON');
     sql.Add('Data0017.RKEY = Data0071.INVT_PTR RIGHT OUTER JOIN');
     sql.Add('Data0339 INNER JOIN');
     sql.Add('Data0005 ON Data0339.EDITED_BY_PTR = Data0005.RKEY ON');
     sql.Add('Data0071.RKEY = Data0339.DATA0071_PTR');
     sql.Add('WHERE Data0339.TRAN_TYPE <> 6');
     sql.Add('and data0339.po_ptr='+dm.AQ0070rkey.AsString);
     sql.add('order by TRAN_DATE');
     open;
    end;
   while not dm.ADOQuery1.Eof do
    begin
     v_txt:= trim(dm.ADOQuery1.FieldValues['EMPLOYEE_NAME'])+
             trim(dm.ADOQuery1.fieldbyname('TRAN_DATE').AsString)+
             trim(dm.ADOQuery1.FieldValues['TRAN_DESCRIPTION']);
     form16.Memo1.Lines.Add(v_txt);
     v_txt:='材料编码:'+trim(dm.ADOQuery1.fieldbyname('INV_PART_NUMBER').AsString)+
            '原值:'+trim(dm.ADOQuery1.fieldbyname('TRAN_FROM').AsString)+
            '新值:'+trim(dm.ADOQuery1.fieldbyname('TRAN_TO').AsString);

     form16.Memo1.Lines.Add(V_TXT);
     dm.ADOQuery1.Next;
    end;
  end;
 dm.ADOQuery1.Close;
 form16.ShowModal;
 form16.Free;
end;

end.
