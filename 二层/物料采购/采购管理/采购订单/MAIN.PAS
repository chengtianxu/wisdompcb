unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBGridEh,ComCtrls, Grids, DBGrids, DBCtrls, Mask,
  Menus, ExtCtrls,QuickRpt, DB, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
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
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N13: TMenuItem;
    Splitter1: TSplitter;
    N20: TMenuItem;
    N12: TMenuItem;
    N18: TMenuItem;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    N19: TMenuItem;
    CheckBox8: TCheckBox;
    N21: TMenuItem;
    BitBtn3: TBitBtn;
    ComboBox3: TComboBox;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    ComboBox4: TComboBox;
    N35: TMenuItem;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    DBGridEh1: TDBGridEh;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    PopupMenu2: TPopupMenu;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    BitBtn1: TBitBtn;
    N22: TMenuItem;
    memo1: TMemo;
    ComboBox5: TComboBox;
    Label1: TLabel;
    mni_CPayDetail: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);

    procedure checkvar();
    procedure append_70(v_new:byte;po_type:char);
    procedure pochangepr(pr_number:string);
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
    procedure N26Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure ComboBox5Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure mni_CPayDetailClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    print:Boolean;
    sql,sssql,sSql :string;
    { Private declarations }
//    employee_name: string;
//    long_sysdate: tdatetime;
    if_print,pr_number: string;      //审核前是否可以打印po
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
   function find_code(code:string):Boolean;
   function save_auth(isInf:boolean):boolean;
   procedure update_delete(rkey70:Integer;ttype:string);
   function find_qianhuo(rkey70:integer;PO_TYPE:string):Boolean;
  public
    { Public declarations }
   if_suplst:string;   //PO编号是否由控制码控制 
 //  v_employee: integer;
   sys_date: tdatetime;
  end;

var
  Form1: TForm1;
//  v_new_type:byte; //新建采购定单时0,新建标准定单...1,新建杂项采购定单

implementation
uses damo, supp_search, add_po, edit_add_po, save_po_number, po_inspection,
  desi_report, desi_reportmic, common,
   received_info, note, auth_info,
   qian_huo, mul_report, PO_change, edit_req_date, Usel,UContractPayDetail;
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
var i:integer;
Sqlstr:string;
begin
 try
   
  //Form_sel:=TForm_sel.Create(Application);
  if Form_sel.ShowModal=mrok then
  begin
   dm.AQ0070.Close;
   dm.AQ0070.Parameters[8].Value:=formatdatetime('YYYY/MM/DD',Form_sel.DateTimePicker1.Date);
   dm.AQ0070.Parameters[9].Value:=Form_sel.DateTimePicker2.Date;
 //  dtpk1.Date:=Form_sel.DateTimePicker1.Date;
 //  dtpk2.Date:=Form_sel.DateTimePicker2.Date;
   for i:=1 to Form_sel.sgrid1.RowCount-2 do
   if Form_sel.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_sel.sgrid1.Cells[2,i];
  //dm.AQ0070.SQL.Text:=sSql+Sqlstr+'order by po_number';
   dm.AQ0070.SQL.Text:=sSql+Sqlstr;
   dm.AQ0070.Open;
   DBGridEh1.DataSource:=nil;
   DBGridEh1.DataSource:=dm.DataSource1;
   sssql:=dm.AQ0070.SQL.Text;
   print:=False;
   ComboBox5.ItemIndex:=2;
  end;
  finally
    Form_sel.Hide;
    //Form_sel.Free;
    end;
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
// dm.AQ0070.Parameters[8].Value:= dtpk1.Date;
// dm.AQ0070.Parameters[9].Value:= dtpk2.Date;
 dm.AQ0070.Prepared;
 DM.AQ0070.open;
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
     sql.Delete(SQL.Count-3);
     sql.Insert(SQL.Count-2,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     Prepared;
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
//if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
//   and (trim(edit1.Text)<>'') then
// try
//  form_supp:=tform_supp.Create(application);
//  form_supp.Edit1.Text := trim(edit1.Text);
// if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
//  begin
//   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
//   edit1.Font.Color := clwindowtext;
//   label7.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
//   with dm.AQ0070 do
//    begin
//     close;
//     sql.Delete(SQL.Count-3);
//     sql.Insert(SQL.Count-2,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
//     Prepared;
//     open;
//    end;
//  end
// else
//  begin
//   //messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
//   label7.Caption := '';
//   //edit1.SetFocus;
//  end;
// finally
//  form_supp.Free;
// end
//else
//if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
//  and (trim(edit1.Text)='') then
// with dm.AQ0070 do
//  begin
//   close;
//   sql.Delete(SQL.Count-3);
//   sql.Insert(SQL.Count-2,'');
//   Prepared;
//   open;
//   label7.Caption:='';
//  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 pk:tbookmark;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
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
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
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
 n26.Enabled:=true;
 N35.Enabled := True;
if dm.AQ0070CSI_USER_POINTER.AsVariant=null then
 n26.Caption:='询价'
else
 n26.Caption:='取消询价';

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
    N35.Enabled :=False; 
   end;
  4:
   begin                    //已暂缓
    n2.Enabled := false;    //不能编辑
    n9.Enabled := false;    //取消
    n10.Enabled := false;   //030528修改
    n11.Enabled := false;
    N35.Enabled :=False;
   end;
  3:
   begin                       //被保留号
    n8.Enabled := false;
    n11.Enabled := false;
    N35.Enabled :=False;
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
     N35.Enabled :=False;
     n2.Enabled := false;
     n8.Enabled := false;
     n9.Enabled := false;
     n10.Enabled := false;
    end;
  7:                         //已完成
    begin
     N35.Enabled :=False;
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
    n26.Enabled := false;
    N35.Enabled :=False;
   end;
 end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
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
   Parameters.ParamValues['edit_empl_ptr'] := StrToInt(user_ptr);
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
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
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
   Parameters.ParamValues['edit_empl_ptr'] := StrToInt(user_ptr);
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
//var
// pk:integer;
// search_option:tlocateoptions;
// po_number:string;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;

 if if_receivd then
  begin
   messagedlg('该采购已经有收货记录不能取消,请使用结束功能',mtinformation,[mbok],0);
   exit;
  end;

 if application.MessageBox('订单将被删除,您是否确认?',
 '程序执行确认',MB_YesNo+MB_DEFBUTTON2+MB_IconASterisk)<>IDYes then
  exit;

// po_number:=dm.AQ0070po_number.Value;
 dm.ADOConnection1.BeginTrans;
 try
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
{
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
     dm.aq0070sub_total.value*dm.Aq0070EXCHANGE_RATE.Value);
     post;   //修改采购单对应请购单所使用的预算(将已使用的预算减少)
    end;
  end;
    }
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if dm.AQ0070fob.AsVariant <> null then  pochangepr(trim(dm.AQ0070fob.Value));
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 self.update_delete(dm.AQ0070rkey.Value,dm.AQ0070PO_TYPE.Value);
  with dm.ADOQuery2 do
   begin
    active := false;
    sql.Clear;
    sql.Add('delete from data0070');
    sql.Add('where rkey = '+dm.AQ0070rkey.AsString);
    ExecSQL;
   end;

{  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0070');
    sql.Add('where fob ='''+trim(dm.AQ0070fob.Value)+'''');
    open;
   end;
 if dm.ADOQuery1.IsEmpty then  //如果为空记录代表pr只生成了一张po,可以删pr
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('delete from  data0068');
    sql.Add('where PO_REQ_NUMBER='''+trim(dm.AQ0070fob.Value)+'''');
    ExecSQL;
   end;
 }
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   dm.ADOConnection1.CommitTrans;
   dm.AP69204.Close;
   dm.adoap68.Close;
   dm.ASP362.Close;
   if dm.ADO71.Active=true then dm.ADO71.Close;
   if dm.ADO72.Active=true then dm.ADO72.Close;
   dm.ADOQuery1.Close;
   dm.ADOQuery2.Close;
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   ShowMsg('删除操作成功！',1);
 //  if dm.AQ0070fob.AsVariant <> null then
//   showmessage('新的请购单已生成,编号为:'+self.pr_number+
 //                 '  原采购订单号'+po_number+'为了重新使用已被删除,请牢记!!!');
 except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
 end;
 //  pk:=dm.AQ0070rkey.Value;

 //  search_option := [lopartialkey];
 //  dm.AQ0070.Locate('rkey',pk,search_option);
end;

procedure TForm1.N10Click(Sender: TObject);  //结束采购订单
var
 rkey70:integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
 begin
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

   with dm.ADO0339 do
    begin
     active:=false;
     Parameters.ParamValues['po_ptr'] := dm.AQ0070rkey.Value;
     Parameters.ParamValues['edit_empl_ptr'] := user_ptr;
     Parameters.ParamValues['tran_type'] := 5;
     Parameters.ParamValues['tran_desc'] := '采购定单状态已更改';
     Parameters.ParamValues['tran_from'] := '状态已审核5';
     Parameters.ParamValues['tran_to'] := '采购订单已被标识已收货6';
     Parameters.ParamValues['data0071_ptr'] := null;
     Parameters.ParamValues['data0072_ptr'] := null;
     ExecSQL;
    end;
     
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

begin

//dm.ADOConnection1.Open;
// rkey73:='72';
// user_ptr:='3';
// vprev:='4';

if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
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
  print:=True;
  PreColumn := DBGridEh1.Columns[0];
  sSql:=DM.AQ0070.SQL.Text;
if dm.Adoconnection1.Connected then
 begin

  dm.AQ0070.Close;
  dm.AQ0070.Parameters[0].Value := 0;
  dm.AQ0070.Parameters[1].Value := 0;
  dm.AQ0070.Parameters[2].Value := 3;
  dm.AQ0070.Parameters[3].Value := 4;
  dm.AQ0070.Parameters[4].Value := 5;
  dm.AQ0070.Parameters[5].Value := 6;
  dm.AQ0070.Parameters[6].Value := 7;
  dm.AQ0070.Parameters[7].Value := 0;
  dm.AQ0070.Parameters[8].Value:= date()-2;
  dm.AQ0070.Parameters[9].Value:= date();
  dm.AQ0070.Prepared;
  dm.AQ0070.Open;
  sql:=DM.AQ0070.SQL.Text;
  dm.AQ0493.Open;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select v_dt = getdate()');
   active:=true;   //读取系统时间
   sys_date := strtodate(datetostr(fieldvalues['v_dt']));//12采购定单日期
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

function TForm1.find_qianhuo(rkey70: integer;PO_TYPE:string): Boolean;
begin
 with dm.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    if PO_TYPE='S' then
     sql.Text:='select rkey from data0071 where PO_PTR='+IntToStr(rkey70)+
              ' and QUAN_ORD-QUAN_RECD>0'
    else
     sql.Text:='select rkey from data0072 where POPTR='+IntToStr(rkey70)+
              ' and QUAN_ORD-QUANTITY_RECEIVED>0';
    open;             //采购明细是否存在有欠货的记录
    if not IsEmpty then
     Result:=True
    else
     Result:=False;
  end;
end;

procedure TForm1.N11Click(Sender: TObject);
var
 rkey70:integer;
begin
//准备修改70状态
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 if Self.find_qianhuo(dm.AQ0070rkey.Value,dm.AQ0070PO_TYPE.Value) then
 begin
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
                 //  dm.AQ0070PO_TYPE.Value
   with dm.ADO0339 do
    begin
     active:=false;
     Parameters.ParamValues['po_ptr'] := dm.AQ0070rkey.Value;
     Parameters.ParamValues['edit_empl_ptr'] := user_ptr;
     Parameters.ParamValues['tran_type'] := 9;
     Parameters.ParamValues['tran_desc'] := '采购定单状态已更改';
     Parameters.ParamValues['tran_from'] := '从状态已收货6';
     Parameters.ParamValues['tran_to'] := '采购订单已被标识审批5';
     Parameters.ParamValues['data0071_ptr'] := null;
     Parameters.ParamValues['data0072_ptr'] := null;
     ExecSQL;
    end;
 end
 else
  ShowMsg('该订单已无欠货记录,不能重启!!!',1);
end;

function tform1.if_receivd():boolean;
begin
 if_receivd:=false;
 if (dm.AQ0070PO_TYPE.Value='S') or (dm.AQ0070PO_TYPE.Value='T') then
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
 3:wei1:='叁'; 4:wei1:='肆';
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
 3 :qianwei1:='仟';
 4 :qianwei1:='万';
 5 :qianwei1:='拾';
 6 :qianwei1:='佰';
 7 :qianwei1:='仟';
 8 :qianwei1:='亿';
 9 :qianwei1:='拾';
 10:qianwei1:='佰';
 11:qianwei1:='仟';
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

if dm.AQ0070CSI_USER_POINTER.AsVariant=null then
 begin
  showmessage('对不起,没有询价的订单不能够被打印');
  exit;
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

    try
    form14:=tform14.Create(application);

    form14.ppReport1.Reset;
    if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
     form14.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'std_purchorder.rtm'       //R:\NIERP\Report\std_purchorder.rtm
    else

     form14.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'std_o_purchorder.rtm';       //R:\nierp\report\std_o_purchorder.rtm

    form14.ppReport1.Template.LoadFromFile;

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
    end;
                              //国外采购
  end
else
 if dm.ADO70PO_TYPE.Value='M' then        //杂项采购订单
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
 
   try
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
     form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_purchorder.rtm'       //R:\NIERP\Report\misc_purchorder.rtm
    else
     form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_0_purchorder.rtm';       //R:\nierp\report\misc_0_purchorder.rtm

    form15.ppReport1.Template.LoadFromFile;

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
   end;
                              //国外采购
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
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
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
     dm.AP69204.FieldValues['req_unit_ptr'] := dm.ADO71WO_PTR.Value;
     dm.AP69204.FieldValues['REQ_DATE'] := dm.ADO71REQ_DATE.Value;
     dm.AP69204.FieldValues['QUANTITY'] := dm.ADO71QUAN_ORD.Value;
     dm.AP69204.FieldValues['CONVERSION_FACTOR'] := dm.ADO71CONVERSION_FACTOR.Value;
     dm.AP69204.FieldValues['reason'] := dm.ADO71reason.Value;
     dm.AP69204.FieldValues['extra_req'] := dm.ADO71extra_req.Value;
     dm.AP69204.FieldValues['rohs'] := dm.ADO71rohs.Value;
     dm.AP69204.FieldValues['avl_flag'] := dm.ADO71avl_flag.Value;
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
     dm.AP69204.FieldValues['rohs'] := dm.ADO72rohs.Value;
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
  if (dm.AQ0070PO_TYPE.Value = 'S')  then
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
  with dm.ado107011 do
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

function tform1.save_auth(isInf:Boolean):boolean;
var
 iRkey14:Integer;
begin
 result:=true;
 iRkey14:=0;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT USER_PTR FROM Data0077 inner join data0015');
  sql.Add('on data0077.warehouse_ptr=data0015.rkey');
  sql.Add('WHERE (lower_limit <= :total1)');
  sql.Add('and (upper_limit >= :total2)');
  sql.Add('and data0015.abbr_name='+quotedstr(dm.AQ0070ware_name.Value));
  SQL.Add('and data0077.purchase_type='+quotedstr(dm.AQ0070PURCHASE_TYPE.Value));
  sql.Add('ORDER BY Data0015.ABBR_NAME,data0077.seq_no');
  Parameters.ParamValues['total1']:=dm.Aq0070SUB_TOTAL.Value*dm.Aq0070EXCHANGE_RATE.Value;
  Parameters.ParamValues['total2']:=dm.Aq0070SUB_TOTAL.Value*dm.Aq0070EXCHANGE_RATE.Value;
  open;
 end;

 if not dm.ADOQuery1.IsEmpty then //不为空表示分级审批
 begin

   if isInf then
   begin
     DM.adoquery2.Close;
     DM.adoquery2.SQL.Text:='select * from data0014 where rkey is null';
     DM.adoquery2.Open;
     DM.adoquery2.append;
     DM.adoquery2.fieldvalues['MESSAGE'] := '有一张采购单需要通过您的审批,采购人：'+
                               dm.AQ0070employee_name.Value+
                               '采购编号:'+dm.AQ0070po_number.Value;
     DM.adoquery2.fieldvalues['whosend']:= strtoint(rkey73);
     DM.adoquery2.post;
     iRkey14:=DM.adoquery2.FieldValues['rkey'];
   end;

   with dm.asp78 do
    begin
     close;
     dm.ASp78.Parameters[1].Value := dm.AQ0070rkey.value;
     open;
    end;
   while not dm.ASP78.Eof do dm.asp78.Delete;

  while not dm.ADOQuery1.Eof do
  begin
   dm.ASp78.Append;
   dm.ASP78po_ptr.Value:=dm.Aq0070RKEY.Value;
   dm.ASP78user_ptr.Value:=dm.ADOQuery1.FieldValues['user_ptr'];
   dm.ASP78ranking.Value:=dm.ADOQuery1.RecNo;
   if dm.ADOQuery1.RecNo=1 then
    dm.ASP78auth_flag.Value:='Y'
   else
    dm.ASP78auth_flag.Value:='N';
   dm.ASP78.Post;

   if isInf then
   begin
     DM.adoquery2.SQL.Text:='insert into data0314(d14_ptr,emp_ptr) '+
                         'values('+inttostr(iRkey14)+','+dm.ASP78user_ptr.AsString+')';
     DM.adoquery2.ExecSQL;
   end;

   dm.ADOQuery1.Next;
  end;

 end
 else   //为空记录表示采购审批定流程有误
  result:=false;

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

function TForm1.find_code(code: string): Boolean;
var
  invNumber:string;
begin

  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, SUM(dbo.Data0071.QUAN_ORD) '
                   +' AS quan_ord, ISNULL(z_t.zaitu, 0) AS zaitu, ISNULL(vmi.vmi_quantotal, 0) AS vmi_quantotal, dbo.Data0017.REPORT_VALUE2'
                   +' FROM         dbo.Data0071 INNER JOIN'
                   +' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY LEFT OUTER JOIN'
                   +' (SELECT     Data0071_1.INVT_PTR, SUM(Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD) AS zaitu'
                   +' FROM   dbo.Data0071 AS Data0071_1 INNER JOIN'
                   +' dbo.Data0070 AS Data0070_1 ON Data0071_1.PO_PTR = Data0070_1.RKEY'
                   +' WHERE      (Data0070_1.STATUS = 5) AND (Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD > 0)'
                   +' GROUP BY Data0071_1.INVT_PTR) AS z_t ON dbo.Data0071.INVT_PTR = z_t.INVT_PTR LEFT OUTER JOIN'
                   +' (SELECT  TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal'
                   +' FROM          dbo.DATA0134'
                   +' WHERE      (QUAN_ON_HAND > 0)'
                   +' GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0071.INVT_PTR = vmi.INVENTORY_PTR'
                   +' WHERE     (dbo.Data0017.REPORT_VALUE2 > 0) '
                   +' AND (dbo.Data0071.PO_PTR = '+code+')'
                   +' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, dbo.Data0017.REPORT_VALUE2, '
                   +' z_t.zaitu, vmi.vmi_quantotal' 
                   +' HAVING (SUM(dbo.Data0071.QUAN_ORD) + dbo.Data0017.QUAN_ON_HAND + ISNULL(z_t.zaitu, 0) + ISNULL(vmi.vmi_quantotal, 0) > dbo.Data0017.REPORT_VALUE2)';
  DM.tmp.Open;
  invNumber :='';
  if DM.tmp.IsEmpty then
  begin
    Result:=False;
  end
  else
  begin
    DM.tmp.First;
    while not DM.tmp.Eof do
    begin
      if DM.tmp.RecordCount=DM.tmp.RecNo then
      begin
        invNumber := invNumber + QuotedStr(DM.tmp.FieldByName('INV_PART_NUMBER').AsString);
      end
      else
      begin
        invNumber := invNumber + QuotedStr(DM.tmp.FieldByName('INV_PART_NUMBER').AsString)+',';
      end;
      DM.tmp.Next;
    end;
     messagedlg('你请购的物料编码 '+ invNumber+'本次请购数+在途数量+现有库存+vmi已超过最高库存,请提升最高库存后再继续',mtconfirmation,[mbcancel],0);
     Result :=True;
  end;

end;

procedure TForm1.N21Click(Sender: TObject);
var
  isInf:Boolean;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;

 if dm.AQ0070contract_pay.Value=True then  //按合同付款
  begin
    with dm.ADOQuery1 do
    begin
      Close;
      sql.Text:='select * from data0617  where po_ptr= '+dm.AQ0070rkey.asstring;
      Open;
      if IsEmpty then
      begin
        ShowMessage('该订单是按合同付款，请先设置合同付款明细');
        exit;
      end;
    end;
  end;


 if find_code(dm.AQ0070rkey.AsString)  then   //超过最高库存
  begin
   Exit;
  end;

 isInf:=messagedlg('是否ERP内部信息通知采购审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes;
 try
  dm.ADOConnection1.BeginTrans;
  if not self.save_auth(isInf) then
   begin
     dm.ADOConnection1.RollbackTrans;
     ShowMsg('采购审批流程未正确定义',1);
     exit;
   end;

    dm.AQ0070.Edit;
    dm.AQ0070status.Value:=1;  //待审核
    dm.AQ0070DATE_EDITED.Value:=common.getsystem_date(dm.ADOQuery1,0);
    dm.AQ0070.Post;
  dm.ADOConnection1.CommitTrans;
  ShowMsg('提交审批成功!',1);
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
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
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form4:=tform4.Create(application);
    form4.v_new_type:=v_new; //注意可以多条记录!
    form4.po_type:=po_type;    //采购类型S标准采购 M杂项采购
    dm.ADO70.Close;
    dm.ADO70.Parameters[1].Value := null;
    dm.ADO70.Open;
   // dm.ado70.fieldbyname('COntract_pay').value:=false;//contract_pay
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
 if (combobox3.ItemIndex<>combobox3.Items.Count-1)and
   (combobox4.ItemIndex = 0) then
  begin
   dm.buyemp05.MoveBy((combobox3.ItemIndex+1)-dm.buyemp05.RecNo);
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'and data0070.employee_pointer ='+dm.buyemp05.fieldbyname('rkey').AsString+#13+
     'and data0070.PRINT_DATE IS NULl');
     Prepared;
     open;
    end;
  end
else
  if (combobox3.ItemIndex<>combobox3.Items.Count-1)and
     (combobox4.ItemIndex = 1) then
    begin
    dm.buyemp05.MoveBy((combobox3.ItemIndex+1)-dm.buyemp05.RecNo);
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'and data0070.employee_pointer ='+dm.buyemp05.fieldbyname('rkey').AsString +#13+
     'and data0070.PRINT_DATE IS NOT NULl');
     Prepared;
     open;
    end;
  end
 else
   if (combobox3.ItemIndex<>combobox3.Items.Count-1)and
   (combobox4.ItemIndex = 2) then
   begin
    dm.buyemp05.MoveBy((combobox3.ItemIndex+1)-dm.buyemp05.RecNo);
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'and data0070.employee_pointer ='+dm.buyemp05.fieldbyname('rkey').AsString);
     Prepared;
     open;
    end;
  end 
else
  if (combobox3.ItemIndex=combobox3.Items.Count-1)and
   (combobox4.ItemIndex = 0) then
   begin
    with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'and data0070.PRINT_DATE IS  NULl');
     Prepared;
     open;
    end;
  end
else
  if (combobox3.ItemIndex=combobox3.Items.Count-1)and
     (combobox4.ItemIndex = 1) then
   begin
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'and data0070.PRINT_DATE IS NOT NULl');
     Prepared;
     open;
    end;
  end
 else
  begin
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(SQL.Count-2);
     sql.Insert(SQL.Count-1,'');
     Prepared;
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
 if form21.ShowModal=mrok then
 begin

 end;
form21.Free;
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

    try
    form14:=tform14.Create(application);

    form14.ppReport1.Reset;
    if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
     form14.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'std_purchorder.rtm'       //R:\NIERP\Report\std_purchorder.rtm
    else
     form14.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'std_o_purchorder.rtm';       //R:\NIERP\Report\std_purchorder.rtm

    form14.ppReport1.Template.LoadFromFile;

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
    end;

  end
 else               //杂项采购订单
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

   try
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
     form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_purchorder.rtm'      //R:\NIERP\Report\misc_purchorder.rtm
    else
     form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_0_purchorder.rtm';      //R:\NIERP\Report\misc_purchorder.rtm

    form15.ppReport1.Template.LoadFromFile;
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
   end;

  end;

  if dm.ADO70PRINT_DATE.AsVariant=null then
   begin
    dm.ADO70.Edit;
    dm.Ado70PRINT_DATE.Value :=sys_date;
    dm.Ado70.UpdateBatch;
   end;

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

if (self.if_print='Y') then      //未审核不可以打印
 begin
  if (dm.ADO70STATUS.Value=5) or (dm.ADO70STATUS.Value=6) or (dm.ADO70STATUS.Value=7) then
   self.m_print;
 end
else
 self.m_print;
 
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



procedure TForm1.N24Click(Sender: TObject);
begin
if (strtoint(vprev)<>4) then
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

procedure TForm1.N26Click(Sender: TObject);
var
 invdesc:string;
begin
 if n26.Caption='询价' then
  begin
  invdesc:='';
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
      'select max(rEQ_DATE) as max_date ,'+#13+
      'data0017.INV_PART_DESCRIPTION'+#13+
      ' from data0071 inner join'+#13+
      '(SELECT     INVT_PTR'+#13+
      'FROM         Data0071'+#13+
      'WHERE     (PO_PTR = '+dm.AQ0070rkey.AsString+')'+#13+
      'GROUP BY INVT_PTR) as d71 on data0071.invt_ptr=d71.invt_ptr'+#13+
      'inner join data0017 on data0071.invt_ptr=data0017.rkey'+#13+
      'where data0071.po_ptr<>'+dm.AQ0070rkey.AsString+#13+
      'group by data0071.invt_ptr,data0017.INV_PART_DESCRIPTION'+#13+
      'having getdate()- max(rEQ_DATE)>40';
     open;
     while not eof do
      begin
       invdesc:=invdesc+fieldbyname('INV_PART_DESCRIPTION').AsString+#13;
       next;
      end;
    end;
   if invdesc<>'' then
   messagedlg('本次采购如下物料在最近40天没有采购,务必询价!'+#13+invdesc,
   mtWarning,[mbok],0);
   dm.ADO70.Close;
   dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
   dm.ADO70.Open;

   dm.ADO70.Edit;
   dm.ADO70CSI_USER_POINTER.AsString:=rkey73;
   dm.ADO70.UpdateBatch();

   dm.AQ0070.Close;
   dm.AQ0070.Open;
   dm.AQ0070.Locate('rkey',dm.ADO70RKEY.Value,[]);
   dm.ADO70.Close;
   n26.Caption:='取消询价';
   //加入日志更新语句
  end
 else
  begin
   dm.ADO70.Close;
   dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
   dm.ADO70.Open;

   dm.ADO70.Edit;
   dm.ADO70CSI_USER_POINTER.AsVariant:=null;
   dm.ADO70.UpdateBatch();
   dm.AQ0070.Close;
   dm.AQ0070.Open;
   dm.AQ0070.Locate('rkey',dm.ADO70RKEY.Value,[]);
   dm.ADO70.Close;
   n26.Caption:='询价';
      //加入日志更新语句
  end;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  form14:=tform14.Create(application);
  form14.ppReport1.Reset;
  form14.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'std_purchorder.rtm';           //R:\NIERP\Report\std_purchorder.rtm
  form14.ppReport1.Template.LoadFromFile;
  form14.ppReport1.SaveAsTemplate := true;
  form14.ppdesigner1.ShowModal;
  form14.Free;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  form14:=tform14.Create(application);
  form14.ppReport1.Reset;
  form14.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'std_o_purchorder.rtm';           //R:\NIERP\Report\std_purchorder.rtm
  form14.ppReport1.Template.LoadFromFile;
  form14.ppReport1.SaveAsTemplate := true;
  form14.ppdesigner1.ShowModal;
  form14.Free;
end;

procedure TForm1.N33Click(Sender: TObject);
begin
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_purchorder.rtm';       //R:\NIERP\Report\misc_purchorder.rtm
    form15.ppReport1.Template.LoadFromFile;
   form15.ppReport1.SaveAsTemplate := true;
   form15.ppdesigner1.ShowModal;
   form15.Free;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_0_purchorder.rtm';       //R:\NIERP\Report\misc_purchorder.rtm
    form15.ppReport1.Template.LoadFromFile;
   form15.ppReport1.SaveAsTemplate := true;
   form15.ppdesigner1.ShowModal;
   form15.Free;

end;

procedure TForm1.update_delete(rkey70: Integer; ttype: string);
begin
 if ttype='S' then
  begin
   with dm.ADOQuery2 do
   begin
     close;
     sql.Text:='update data0069 set status=0 '+
     'from data0069 inner join data0071 on '+
     'data0069.rkey=data0071.rkey69 '+
     'where data0071.po_ptr='+inttostr(rkey70);
     ExecSQL;
   end;

   with dm.ADOQuery2 do
   begin
     close;
     sql.Text:='update data0068 set status=2 '+
     'where EXISTS(select data0069.PURCH_REQ_PTR '+
     'from data0069 inner join data0071 on '+
     'data0069.rkey=data0071.rkey69 '+
     'where data0071.po_ptr='+inttostr(rkey70)+
     'and data0069.PURCH_REQ_PTR=data0068.rkey '+
     'group by data0069.PURCH_REQ_PTR)';
     ExecSQL;
   end;
  end
 else
  begin
   with dm.ADOQuery2 do
   begin
     close;
     sql.Text:='update data0204 set status=0 '+
     'from data0204 inner join data0072 on '+
     'data0204.rkey=data0072.rkey204 '+
     'where data0072.poptr='+inttostr(rkey70);
     ExecSQL;
   end;

   with dm.ADOQuery2 do
   begin
     close;
     sql.Text:='update data0068 set status=2 '+
     'where EXISTS(select data0204.PURCHASE_REQ_PTR '+
     'from data0204 inner join data0072 on '+
     'data0204.rkey=data0072.rkey204 '+
     'where data0072.poptr='+inttostr(rkey70)+
     'and data0204.PURCHASE_REQ_PTR=data0068.rkey '+
     'group by data0204.PURCHASE_REQ_PTR)';
     ExecSQL;
   end;
  end;
end;



procedure TForm1.N35Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    dm.ADO70.Close;
    dm.ADO70.Parameters[1].Value := dm.AQ0070rkey.Value;
    dm.ADO70.Open;
    frm_edit_req_date:=Tfrm_edit_req_date.Create(Application);

    if frm_edit_req_date.ShowModal=mrok then
    begin
      BitBtn3Click(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
     frm_edit_req_date.Free;
  end;
end;



procedure TForm1.BitBtn5Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
 try
  Form_sel:=TForm_sel.Create(Application);
  if Form_sel.ShowModal=mrok then
  begin
   dm.AQ0070.Close;
   dm.AQ0070.Parameters[8].Value:=Form_sel.DateTimePicker1.Date;
   dm.AQ0070.Parameters[9].Value:=Form_sel.DateTimePicker2.Date;
 //  dtpk1.Date:=Form_sel.DateTimePicker1.Date;
//   dtpk2.Date:=Form_sel.DateTimePicker2.Date;
   for i:=1 to Form_sel.sgrid1.RowCount-2 do
   if Form_sel.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_sel.sgrid1.Cells[2,i];
   dm.AQ0070.SQL.Text:=sSql+Sqlstr+'order by po_number';
   dm.AQ0070.Open;
   DBGridEh1.DataSource:=nil;
   DBGridEh1.DataSource:=dm.DataSource1;
  end;
  finally
    Form_sel.Free;
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';

end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var i : integer;
begin
  for i:= 1 to DBGrid1.Columns.Count do
  begin
    //恢复所有标题字体为默认
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;
  if DM.AQ0070.Sort<>(Column.FieldName+' ASC') then      //判断原排序方式
  begin
    DM.AQ0070.Sort := Column.FieldName+' ASC';
    Column.Title.Font.Color := clRed;          //改变标题行字体为红色，表示当前的排序方式为升序
    Column.Title.Font.Style := [fsBold];
  end
  else
  begin
    DM.AQ0070.Sort := Column.FieldName+' DESC';
    Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
    Column.Title.Font.Style := [fsBold];
  end;
  label6.Caption:=column.Title.Caption;
  //edit1.SetFocus;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 begin
  if (dm.AQ0070status.Value=2) then
   DBGridEh1.Canvas.Font.Color := clred
  else
  if (dm.AQ0070status.Value=8) then
  DBGridEh1.Canvas.Font.Color :=RGB(69 ,139 ,0);
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end;

end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AQ0070.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AQ0070.Sort:=Column.FieldName+' DESC';
  end;


 if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label6.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;


procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (Key=46 ) then Key := 0;
 if (key=VK_Insert)then
 begin
  KEY:=0;
  Shift:=[];
 end;
 if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.AQ0070.SQL.Text);

 if (chr(key)='C')and(ssCtrl in Shift) then
 begin
  N22Click(Sender);
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
 DM.AQ0070.Close;
 DM.AQ0070.Open;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
 if DM.AQ0070.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'采购单管理')
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  form14:=tform14.Create(application);
  form14.ppReport1.Reset;
  form14.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'std_purchorder.rtm';           //R:\NIERP\Report\std_purchorder.rtm
  form14.ppReport1.Template.LoadFromFile;
  form14.ppReport1.SaveAsTemplate := true;
  form14.ppdesigner1.ShowModal;
  form14.Free;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  form14:=tform14.Create(application);
  form14.ppReport1.Reset;
  form14.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'std_o_purchorder.rtm';           //R:\NIERP\Report\std_purchorder.rtm
  form14.ppReport1.Template.LoadFromFile;
  form14.ppReport1.SaveAsTemplate := true;
  form14.ppdesigner1.ShowModal;
  form14.Free;
end;

procedure TForm1.N38Click(Sender: TObject);
begin
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_purchorder.rtm';       //R:\NIERP\Report\misc_purchorder.rtm
    form15.ppReport1.Template.LoadFromFile;
   form15.ppReport1.SaveAsTemplate := true;
   form15.ppdesigner1.ShowModal;
   form15.Free;
end;

procedure TForm1.N39Click(Sender: TObject);
begin
    form15:=tform15.Create(application);
    form15.ppReport1.Reset;
    form15.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'misc_0_purchorder.rtm';       //R:\NIERP\Report\misc_purchorder.rtm
    form15.ppReport1.Template.LoadFromFile;
   form15.ppReport1.SaveAsTemplate := true;
   form15.ppdesigner1.ShowModal;
   form15.Free;

end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N22Click(Sender: TObject);
begin
 Memo1.SelectAll;
 Memo1.CopyToClipboard;
end;

procedure TForm1.DBGridEh1CellClick(Column: TColumnEh);
begin

// Memo1.Text:=Column.Field.AsString;
end;

procedure TForm1.ComboBox5Change(Sender: TObject);
var Tsql:string;
begin
  if print = True then Tsql:=sSql else Tsql:=sssql;

  if ComboBox5.Text='否'then
  begin
    DM.AQ0070.Close;
    DM.AQ0070.SQL.Text:=Tsql+'and data0070.print_date IS  NULL' ;
    DM.AQ0070.Open;
  end;
  if ComboBox5.Text='是'then
  begin
    DM.AQ0070.Close;
    DM.AQ0070.SQL.Text:=Tsql+'and data0070.print_date IS not NULL' ;
    DM.AQ0070.Open;
  end;
  if ComboBox5.Text='全部'then
  begin
    DM.AQ0070.Close;
    DM.AQ0070.SQL.Text:=Tsql ;
    DM.AQ0070.Open;
  end;

 end;

procedure TForm1.DBGridEh1DblClick(Sender: TObject);
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

procedure TForm1.mni_CPayDetailClick(Sender: TObject);
var
  Lfrm:TfrmCPayDetail;
//  Lrkey: integer;
begin

  if   dm.AQ0070.IsEmpty then exit;
  if dm.AQ0070.FieldByName('contract_pay').AsBoolean=False then
   begin
   ShowMessage('该订单不是按合同付款，不用设置！');
   exit;
   end;

  LFrm:=TfrmCPayDetail.Create(self);
  try
   LFrm.Frkey70:=dm.AQ0070.fieldbyname('rkey').Value;
   LFrm.FSUB_TOTAL70:=dm.AQ0070.fieldbyname('SUB_TOTAL').Value;
   Lfrm.lbl_money.Caption:= dm.AQ0070.fieldbyname('SUB_TOTAL').Value;
   LFrm.GetData(LFrm.Frkey70);
   if  dm.AQ0070.fieldbyname('status').Value<>8  then
   begin
    LFrm.eh617.ReadOnly:=true;
    Lfrm.btn_save.enabled:=false;
   end
   else
   if  dm.AQ0070.fieldbyname('status').Value=8  then
   begin
    LFrm.eh617.ReadOnly:=false;
    Lfrm.btn_save.enabled:=true;
   end ;
   
   if LFrm.showmodal=mrok then
   begin
    BitBtn7Click(BitBtn7);
    dm.AQ0070.Locate('rkey',Lfrm.Frkey70,[]);
   end;
  finally
   Lfrm.free;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
self.checkvar;
end;

end.
