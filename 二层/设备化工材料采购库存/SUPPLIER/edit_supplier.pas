unit edit_supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask, Menus, DB,
  ADODB, Grids, DBGrids;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Bevel1: TBevel;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    ScrollBar1: TScrollBar;
    Bevel2: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label26: TLabel;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label27: TLabel;
    Bevel3: TBevel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    BitBtn10: TBitBtn;
    Bevel4: TBevel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    Bevel5: TBevel;
    Label33: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    Bevel6: TBevel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label38: TLabel;
    Label39: TLabel;
    DBGrid1: TDBGrid;
    Bevel7: TBevel;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit34: TDBEdit;
    Label42: TLabel;
    DBEdit35: TDBEdit;
    Label43: TLabel;
    DBEdit36: TDBEdit;
    Label44: TLabel;
    DBEdit37: TDBEdit;
    Label45: TLabel;
    DBEdit38: TDBEdit;
    Label46: TLabel;
    DBEdit39: TDBEdit;
    Label47: TLabel;
    DBEdit40: TDBEdit;
    Label48: TLabel;
    DBEdit41: TDBEdit;
    copy_lab: TLabel;
    MaskEdit1: TMaskEdit;
    Splitter1: TSplitter;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label49: TLabel;
    procedure ScrollBar1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormActivate(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure save_note();
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);//更改控件的状态
  private
    { Private declarations }
    v_close:byte;    //是否正常退出(0,1)(是,否)
    control_edit1:boolean;
    function  Get_control_edit: boolean;
    procedure Set_control_edit(const Value: boolean);
    procedure Change_state(const Value1:boolean);//更改控件的状态
  public
    { Public declarations }
    property control_edit:boolean read Get_control_edit write Set_control_edit  default true;
  end;

var
  Form2: TForm2;
  po_note,debmem_note,rfq_note,common_pad:tstringlist;
  v_edit:boolean;
implementation
uses damo, main, note, country_search, curr_search, account_search,
  supp_ship;
{$R *.dfm}

procedure TForm2.ScrollBar1Change(Sender: TObject);
begin
 dbedit14.DataField:='contact_name_'+inttostr(scrollbar1.Position);
 dbedit15.DataField:='cont_phone_'+inttostr(scrollbar1.Position);
 dbedit16.DataField:='email_for_contact'+inttostr(scrollbar1.Position);
 label15.Caption:='    联络人:'+inttostr(scrollbar1.Position);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
 var
  v_message:integer;
begin
 if dm.adotable1.State=dsinsert then
  begin
   dm.adotable1.Cancel;
   v_close:=1;
   form1.Show;
   ModalResult:=mrcancel;
  end
 ELSE
 if (dm.adotable1.Modified) or (v_edit) then
  begin
   v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
   if v_message=7 then
    begin
    dm.adotable1.Cancel;     //no取消对当前记录的修改包括新增
    dm.ADOQuery2.CancelBatch();
    v_close:=1;
    form1.Show;
    ModalResult:=mrcancel;
    end
   else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
   else                    //cancel不存盘也不保存
    exit;
   end
 ELSE
 BEGIN
  v_close:=1;
  form1.Show;
  ModalResult:=mrcancel;
 END;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 case node.SelectedIndex of
 0: notebook1.PageIndex:=0;
 1: notebook1.PageIndex:=1;
 2: notebook1.PageIndex:=2;
// 3: notebook1.PageIndex:=3; 供应商出口地址,
// 4: notebook1.PageIndex:=4; EDI资讯    被取消 12.6
 5: notebook1.PageIndex:=5;
 6: notebook1.PageIndex:=6;
end;
 headercontrol1.Sections[1].Text:=node.Text;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i,j:byte;
 v_mask:string;
begin
 if dm.ADOTable1EDI_OUT_NEW_PO.Value=0 then
  dbcheckbox1.Enabled:=false
 else
  dbcheckbox1.Enabled:=true;
 v_edit:=false;                        //是否编辑值设为 false
 treeview1.FullExpand;
 treeview1.Items[1].Selected:=true;
if dm.ADOTable1.fieldvalues['country_ptr']<>null then
with dm.adoquery1 do
 begin           //查找国家或地区 允许为null
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select country_code,country_name from data0250');
  sql.Add('where country_rkey='+dm.ADOTable1.fieldbyname('country_ptr').AsString);
  active:=true;
  edit1.Text:=FieldValues['country_code'];
  edit1.Font.Color:=clwindowtext;
  label39.Caption:=FieldValues['country_name'];
 end;
with dm.adoquery1 do
 begin           //查找货币 它不可能为空新增时已赋值为默认
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select curr_code,curr_name from data0001');
  sql.Add('where rkey='+dm.ADOTable1.fieldbyname('CURRENCY_PTR').AsString);
  active:=true;
  edit2.Text:=FieldValues['curr_code'];
  edit2.Font.Color:=clwindowtext;
  label38.Caption:=FieldValues['curr_name'];
 end;
if dm.ADOTable1.fieldvalues['ACC_PAYABLE_PTR']<>null then
with dm.adoquery1 do
 begin           //查找总账账目   允许为null
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select gl_acc_number,gl_description from data0103');
  sql.Add('where rkey='+dm.ADOTable1.fieldbyname('ACC_PAYABLE_PTR').AsString);
  active:=true;
  if not isempty then
   begin
  edit3.Text:=trim(FieldValues['gl_acc_number']);
  edit3.Font.Color:=clwindowtext;
  label27.Caption:=FieldValues['gl_description'];
   end;
 end;
if dm.ADOTable1.State=dsedit then //如果编辑状态
 begin
  with dm.ADOQuery2 do    //读取装运地点
   begin
    if Active=true then Active:=false;
    sql.Clear;
    sql.Add('select * from data0024 where supplier_ptr=:rkey');
    Parameters.ParamValues['rkey']:=dm.ADOTable1RKEY.Value;
    active:=true;
   end;

  maskedit1.Text := trim(DM.ADOTable1.FieldValues['code']);
  if dm.AQ04.FieldValues['seed_flag']=2  then //设置掩码
   begin
    for i:=length(maskedit1.Text) downto 1 do
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then //找出第几位开始为前缀
    begin                                                      //不是数字字符就为前缀
     maskedit1.EditMask := copy(maskedit1.Text,1,i)+copy('9999999999',1,10-i)+';1; ';
     v_mask :=maskedit1.EditMask;
     for j:=1 to i do
      insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask  := v_mask;
     maskedit1.Text := trim(DM.ADOTable1.FieldValues['code']);
     break;
    end;
    maskedit1.SetFocus;
   end
  else
   if dm.AQ04.FieldValues['seed_flag']=4 then
    begin
     maskedit1.Enabled :=false;
     dbedit2.SetFocus;
    end
   else
    maskedit1.SetFocus;
 end
else           //如果新增状态
 begin
 if copy_lab.Caption='0' then  //代表不是从复制而来的需要打开
  with dm.ADOQuery2 do          //装运地点
   begin
    if Active=true then Active:=false;
    sql.Clear;
    sql.Add('select * from data0024 where supplier_ptr is null');
    active:=true;
   end;

  if dm.AQ04.FieldValues['seed_flag']<>1 then
   begin
   maskedit1.text := trim(dm.AQ04.Fieldvalues['seed_value']);
   if dm.AQ04.FieldValues['seed_flag']=2  then
    for i:=length(maskedit1.Text) downto 1 do //设置掩码
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
     begin                                    //不是数字字符就为前缀
      maskedit1.EditMask := copy(maskedit1.Text,1,i)+copy('9999999999',1,10-i)+';1; ';
      v_mask := maskedit1.EditMask;
      for j:=1 to i do
       insert('\',v_mask,2*j-1);      //从奇数位插入
      maskedit1.EditMask := v_mask;
      maskedit1.text := trim(dm.AQ04.Fieldvalues['seed_value']);
      break;
     end;
    if dm.AQ04.FieldValues['seed_flag']=4 then
     begin
      maskedit1.Enabled :=false;
      dbedit2.SetFocus;
     end
    else
     maskedit1.SetFocus;
   end
  else
   begin
    maskedit1.Text := '';
    maskedit1.SetFocus;
   end;
 end;
//****************************************************************************
end;

procedure TForm2.DBRadioGroup1Click(Sender: TObject);
begin
 if dbradiogroup1.ItemIndex=1 then
  dbcheckbox1.Enabled :=true
 else
  begin
   dbcheckbox1.Field.Value :=0;
   dbcheckbox1.Enabled :=false;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i,v_length:byte;
 v_seed,v_last,new_seed,v_end:string;

begin
 if trim(maskedit1.Text)='' then
  begin
   messagedlg('供应商代码不能为空!',mtwarning,[mbok],0);
   notebook1.PageIndex:=1;
   maskedit1.SetFocus;
   exit;
  end
 else
 if dm.aq04seed_flag.Value<>1 then //控制码从04中读取
  begin
   v_end:=copy(maskedit1.Text,length(trim(maskedit1.Text)),1);
   if (v_end<'0') or (v_end>'9') then
   begin
    application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
    maskedit1.SetFocus;
    exit;
   end;
  end;

 if trim(dbedit2.Text)='' then
  begin
   messagedlg('供应商名称不能为空!',mtwarning,[mbok],0);
   notebook1.PageIndex:=1;
   dbedit2.SetFocus;
   exit;
  end;

 if trim(dbedit3.Text)='' then
  begin
   messagedlg('供应商缩写不能为空!',mtwarning,[mbok],0);
   notebook1.PageIndex:=1;
   dbedit3.SetFocus;
   exit;
  end;
 if trim(dbmemo1.Text)='' then
  begin
   messagedlg('供应商地址不能为空!',mtwarning,[mbok],0);
   notebook1.PageIndex:=1;
   dbmemo1.SetFocus;
   exit;
  end;

 if dm.ADOQuery2.IsEmpty then
  begin
   messagedlg('至少需要一个装运地点!',mtwarning,[mbok],0);
   notebook1.PageIndex:=6;
   exit;
  end;


//***************************************************************************
 dm.ADOTable1CODE.Value :=trim(maskedit1.Text);
 if dm.ADOTable1.State=dsedit then    // 如果是编辑状态时保存所有数据
  begin        // 开始...1
   dm.ADOConnection1.BeginTrans;     //起用事物处理
   save_note;
  TRY
   dm.ADOTable1.Post;
  except
   dm.ADOConnection1.RollbackTrans;
   notebook1.PageIndex:=1;
   maskedit1.SetFocus;
   exit;
  end;
  try
   dm.ADOQuery2.UpdateBatch();     //保存装运地点
   dm.ADOConnection1.CommitTrans;  //提交事物
  except
   dm.ADOConnection1.RollbackTrans;
  end;
  v_close:=1;
  form1.Show;
  ModalResult:=mrok;
 end    // 结束...1
else                   //如果是新增或复制状态
 begin
 dm.ADOConnection1.BeginTrans;  //起用事物处理

   TRY


    dm.ADOTable1.Post;
   except
    dm.ADOConnection1.RollbackTrans;
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    exit;
   end;  //保存主表

 if dm.aq04seed_flag.Value<>1 then //代码由控制码控制
  begin
   v_seed := trim(maskedit1.Text);
   v_length :=length(v_seed);
   if v_seed>=trim(dm.AQ04.FieldValues['seed_value']) then    //如果代码是从04中取值
   for i := length(v_seed) downto 1 do                        // 更新data0004
   if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then   //如果不是数字
    begin
     v_last := inttostr(1000000000+strtoint(copy(v_seed,i+1,v_length-i))+1);
     new_seed := copy(v_seed,1,i)+copy(v_last,10-(v_length-i)+1,v_length-i);
     dm.AQ04.Edit;            //使前缀不变后缀加1
     dm.AQ04.FieldValues['seed_value'] := new_seed;
     dm.AQ04.Post;
     break;
    end
   else  //如果是数字
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := inttostr(10000000000+strtoint(v_seed)+1);
      new_seed := copy(v_last,11-v_length+1,v_length);
      dm.AQ04.Edit;
      dm.AQ04.FieldValues['seed_value'] := new_seed;
      dm.AQ04.Post;
     end;
  end;

   dm.ADOTable1.Edit;
   save_note;                      //保存记事本记录
   dm.ADOQuery2.First;
   while not dm.ADOQuery2.Eof do
    begin
     dm.ADOQuery2.Edit;
     dm.ADOQuery2.FieldValues['supplier_ptr']:=dm.ADOTable1RKEY.Value;
     dm.ADOQuery2.Next;
    end;
   try
    dm.ADOQuery2.UpdateBatch();
    dm.ADOTable1.Post;
    dm.ADOConnection1.CommitTrans;
   except
    dm.ADOConnection1.RollbackTrans;
   end;
 if copy_lab.Caption='1' then   //如果是复制过来则退出
  begin
   v_close:=1;
   form1.Show;
   ModalResult:=mrok;
  end
 else
  begin
  dm.ADOTable1.Append;
  form1.append_add_field();
  treeview1.Items[1].Selected:=true;
  notebook1.PageIndex:=1;
  if dm.AQ04.FieldValues['seed_flag']<>1 then
   begin
    maskedit1.Text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
    dbedit2.SetFocus;      //重新给供应商代码赋值
   end
  else
   begin
    maskedit1.Text := '';
    maskedit1.SetFocus;
   end;
  dm.ADOQuery2.Close;
  dm.ADOQuery2.Open;   //刷新装运地址
  v_edit:=false;       //使是否编辑过变量成为假
  edit1.Text := '';
  edit1.Font.Color := clwindowtext;
  label39.Caption := '';
  edit3.Text := '';
  edit3.Font.Color := clwindowtext;
  label27.Caption := '';
  with dm.adoquery1 do
   begin           //查找货币 它不可能为空新增时已赋值为默认
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select curr_code,curr_name from data0001');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('CURRENCY_PTR').AsString);
    active:=true;
    edit2.Text:=FieldValues['curr_code'];
    edit2.Font.Color:=clwindowtext;
    label38.Caption:=FieldValues['curr_name'];
   end;
 end;

end;
//******************************************
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 po_note:=tstringlist.Create;
 debmem_note:=tstringlist.Create;
 rfq_note:=tstringlist.Create;
 common_pad:=tstringlist.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 po_note.Free;
 debmem_note.Free;
 rfq_note.Free;
 common_pad.Free;    // 释放记事本所有变量
end;

procedure TForm2.N1Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='采购定单记事本:'+dbedit3.Text;
  edit_note.Memo1.Lines.Assign(po_note);
  if edit_note.ShowModal=mrok then
     begin
      po_note.Text:=edit_note.Memo1.Text;
      v_edit:=true;
     end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
 try
  edit_note := tedit_note.Create(application);
  edit_note.Caption := '借项备忘录:'+dbedit3.Text;
  edit_note.Memo1.Lines.Assign(debmem_note);
  if edit_note.ShowModal =mrok then
   begin
    debmem_note.Text:=edit_note.Memo1.Text;
    v_edit:=true;
   end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='一般记事本:'+dbedit3.Text;
  edit_note.Memo1.Lines.Assign(common_pad);
  if edit_note.ShowModal=mrok then
     begin
      common_pad.Text:=edit_note.Memo1.Text;
      v_edit:=true;
     end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='交货记事本:'+dbedit3.Text;
  edit_note.Memo1.Lines.Assign(rfq_note);
  if edit_note.ShowModal=mrok then
   begin
    rfq_note.Text:=edit_note.Memo1.Text;
    v_edit:=true;
   end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
 i:byte;
begin
 if dm.ADOTable1.FieldValues['po_note_pad_ptr']<>null then
  with dm.adoquery1 do
   begin                        //读取采购定单记事本
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('PO_NOTE_PAD_PTR').AsString);
    active:=true;
    for i:=1 to 4 do
     po_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
   end;
 if dm.ADOTable1.FieldValues['DEBMEM_NOTE_PAD_PTR']<>null then
  with dm.adoquery1 do
   begin                        //读取借项备忘记事本
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('DEBMEM_NOTE_PAD_PTR').AsString);
    active:=true;
    for i:=1 to 4 do
     debmem_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
   end;
 if dm.ADOTable1.FieldValues['RFQ_NOTE_PAD_PTR']<>null then
  with dm.ADOQuery1 do
   begin                        //读取交货记事本
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('RFQ_NOTE_PAD_PTR').AsString);
    active:=true;
    for i:=1 to 4 do
     rfq_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
   end;
 if dm.ADOTable1.FieldValues['common_pad_ptr']<>null then
  with dm.adoquery1 do
   begin                        //读取一般资讯记事本
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('common_pad_ptr').AsString);
    active:=true;
    for i:=1 to 4 do
     common_pad.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
   end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  country_form := Tcountry_form.Create(Application);
  country_form.Edit1.Text:=trim(edit1.Text);
 if country_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
 else
  IF country_form.showmodal=mrok then
  begin
   edit1.Text:=country_form.ADOQuery1.FieldValues['country_code'];
   edit1.Font.Color:=clwindowtext;
   label39.Caption:=country_form.ADOQuery1.FieldValues['country_name'];
   dm.ADOTable1.FieldValues['country_ptr']:=country_form.ADOQuery1.FieldValues['country_rkey'];
   edit2.SetFocus;
  end
  else
   edit1.SetFocus;
 finally
  country_form.free;
 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 try
  curr_form := Tcurr_form.Create(Application);
  curr_form.Edit1.Text:=trim(edit2.Text);
  if curr_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
  IF curr_form.showmodal=mrok then
   begin
    edit2.Text:=curr_form.ADOQuery1.FieldValues['curr_code'];
    edit2.Font.Color:=clwindowtext;
    label38.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
    dm.ADOTable1.FieldValues['currency_ptr']:=curr_form.ADOQuery1.FieldValues['rkey'];
    dbedit14.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  curr_form.free;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)<>'') then
 try
  country_form := Tcountry_form.Create(Application);
  country_form.Edit1.Text:=edit1.Text;
 if comparetext(edit1.text,country_form.ADOQuery1.Fieldbyname('country_code').AsString)=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   label39.Caption:=country_form.ADOQuery1.FieldValues['country_name'];
   dm.ADOTable1.FieldValues['country_ptr']:=country_form.ADOQuery1.FieldValues['country_rkey'];
  end
 else
  begin
   messagedlg('国家代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label39.Caption:='';
   edit1.SetFocus;
  end;
 finally
  country_form.free;
 end
else
 if (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)='') then
  begin
   dm.ADOTable1.FieldValues['country_ptr']:=null;
   label39.Caption:='';
  end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
 if activecontrol.Name<>'BitBtn5' then
 begin
  try
  curr_form := Tcurr_form.Create(Application);
  curr_form.Edit1.Text:=edit2.Text;
  if comparetext(edit2.text,curr_form.ADOQuery1.Fieldbyname('curr_code').AsString)=0 then
   begin
    edit2.Font.Color:=clwindowtext;
    label38.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
    dm.ADOTable1.FieldValues['currency_ptr']:=curr_form.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('货币代码不正确,请重新输入或选择',mtinformation,[mbok],0);
    label38.Caption:='   ';
    edit2.SetFocus;
   end;
  finally
   curr_form.free;
  end;
 end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
 try
  account_form := Taccount_form.Create(Application);
  account_form.Edit1.Text:=edit3.Text;
  if account_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
 IF account_form.showmodal=mrok then
  begin
   edit3.Text:=account_form.ADOQuery1.FieldValues['gl_acc_number'];
   edit3.Font.Color:=clwindowtext;
   label27.Caption:=account_form.ADOQuery1.FieldValues['gl_description'];
   dm.ADOTable1.FieldValues['ACC_PAYABLE_PTR']:=account_form.ADOQuery1.FieldValues['rkey'];
   DBEDIT17.SetFocus;
  end
 else
  edit3.SetFocus;
 finally
  account_form.free;
 end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color:=clblue;
  end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(edit3.Text)<>'') then
 try
  account_form := Taccount_form.Create(Application);
  account_form.Edit1.Text:=edit3.Text;
 if comparetext(edit3.text,account_form.ADOQuery1.Fieldbyname('gl_acc_number').AsString)=0 then
  begin
   edit3.Font.Color:=clwindowtext;
   label27.Caption:=account_form.ADOQuery1.FieldValues['gl_description'];
   dm.ADOTable1.FieldValues['ACC_PAYABLE_PTR']:=account_form.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('账目代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label27.Caption:='';
   edit3.SetFocus;
  end;
 finally
  account_form.free;
 end
else
 if (activecontrol.Name<>'BitBtn6') and (trim(edit3.Text)='') then
  begin
   dm.ADOTable1.FieldValues['ACC_PAYABLE_PTR']:=null;
   label27.Caption:='';
  end;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
 dm.ADOQuery2.Edit;
try
 form3:=tform3.Create(application);
 if form3.ShowModal=mrok then
  v_edit:=true;
finally
 form3.free;
end;

end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
  n6click(sender);
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADOQuery2.IsEmpty then
 N6Click(sender);
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  dm.ADOQuery2.Append;
  if dm.ADOTable1.State=dsedit then
   dm.ADOQuery2.FieldValues['supplier_ptr']:=dm.ADOTable1RKEY.Value
  else            //给供应商指针赋值
   dm.ADOQuery2.FieldValues['supplier_ptr']:=null; //给国家指针赋值
 dm.ADOQuery2.FieldValues['country_ptr']:=dm.ADOTable1.FieldValues['country_ptr'];
 dm.ADOQuery2.fieldvalues['CITY_TAX_PTR']:=1;      //默认没有增值税
 dm.ADOQuery2.FieldValues['tax_on_tax'] := 'N';    //税上征税已被隐藏
 dm.ADOQuery2.FieldValues['SHIPPING_LEAD_TIME']:=0;
 dm.ADOQuery2.FieldValues['state']:=dm.ADOTable1STATE.Value;
 dm.ADOQuery2.FieldValues['zip']:=dm.ADOTable1ZIP.Value;
 dm.ADOQuery2.FieldValues['phone']:=dm.ADOTable1PHONE.Value;
 dm.ADOQuery2.fieldvalues['fax']:=dm.ADOTable1FAX.Value;
 dm.ADOQuery2.FieldValues['LANGUAGE_FLAG'] :=dm.ADOTable1LANGUAGE_FLAG.Value;
 dm.ADOQuery2.FieldValues['state_invt_tax_flag']:='Y'; //材料
 dm.ADOQuery2.FieldValues['state_ship_tax_flag']:='N'; //装运
 dm.ADOQuery2.FieldValues['STATE_MISC_TAX_FLAG']:='N'; //杂项
 dm.ADOQuery2.FieldValues['FACTORY_ADDRESS_1']:=dm.ADOTable1BILLING_ADDRESS_1.Value;
 dm.ADOQuery2.FieldValues['FACTORY_ADDRESS_2']:=dm.ADOTable1BILLING_ADDRESS_2.Value;
 dm.ADOQuery2.FieldValues['FACTORY_ADDRESS_3']:=dm.ADOTable1BILLING_ADDRESS_3.Value;
 dm.ADOQuery2.FieldValues['state']:=dm.ADOTable1STATE.Value;
 dm.ADOQuery2.FieldValues['zip']:=dm.ADOTable1zip.Value;
 dm.ADOQuery2.FieldValues['phone']:=dm.ADOTable1phone.Value;
 dm.ADOQuery2.FieldValues['fax']:=dm.ADOTable1fax.Value;

{ with dm.adoquery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select suplstaship,suplstamat,suplstamisc from data0192');
   sql.Add('where rkey=1');   //data0192第一条记录代表默认值
   active:=true;             //自动赋值已被取消(12.6)
 dm.ADOQuery2.FieldValues['state_invt_tax_flag']:=fieldvalues['suplstamat'];
 dm.ADOQuery2.FieldValues['state_ship_tax_flag']:=fieldvalues['suplstaship'];
 dm.ADOQuery2.FieldValues['STATE_MISC_TAX_FLAG']:=fieldvalues['suplstamisc'];
  end;}
try
 form3:=tform3.Create(application);
 if form3.ShowModal=mrok then
  v_edit:=true;
finally
 form3.free;
end;

end;

procedure TForm2.N7Click(Sender: TObject);
begin
 dm.ADOQuery2.DeleteRecords(arcurrent);
 v_edit:=true;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
if dm.ADOQuery2.IsEmpty then
 begin
  n6.Enabled := false;
  n7.Enabled := false;
 end
else
 begin
  n6.Enabled := true;
  n7.Enabled := true;
 end;
end;

procedure Tform2.save_note();
var
i:byte;
begin
//***************记事本保存
 if dm.ADOTable1.FieldValues['PO_NOTE_PAD_PTR']<>null then
  with dm.adoquery1 do             //保存采购定单记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('PO_NOTE_PAD_PTR').AsString);
    active:=true;
    if trim(po_note.Text)<>'' then
     begin
      edit;
      for i:=1 to po_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := po_note.Strings[i-1];
      post;
     end
    else
     begin
      Delete;
      dm.ADOTable1.fieldvalues['PO_NOTE_PAD_PTR']:=null;
     end;
   end
 else
  if trim(po_note.Text)<>'' then
   with dm.adoquery1 do
    begin
    if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0011 where file_pointer is null');
     active:=true;
     append;
     FieldValues['file_pointer']:=dm.ADOTable1RKEY.Value;
     FieldValues['source_type']:=1023;
     for i:=1 to po_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=po_note.Strings[i-1];
     post;
     dm.ADOTable1PO_NOTE_PAD_PTR.Value:=fieldvalues['rkey'];
    end;

if dm.ADOTable1.FieldValues['debmem_NOTE_PAD_PTR']<>null then
  with dm.adoquery1 do             //保存借项备忘记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('debmem_NOTE_PAD_PTR').AsString);
    active:=true;
    if trim(debmem_note.Text)<>'' then
     begin
      edit;
      for i:=1 to debmem_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := debmem_note.Strings[i-1];
      post;
     end
    else
     begin
      Delete;
      dm.ADOTable1.fieldvalues['debmem_NOTE_PAD_PTR']:=null;
     end;
   end
 else
  if trim(debmem_note.Text)<>'' then
   with dm.adoquery1 do
    begin
    if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0011 where file_pointer is null');
     active:=true;
     append;
     FieldValues['file_pointer']:=dm.ADOTable1RKEY.Value;
     FieldValues['source_type']:=2023;
     for i:=1 to debmem_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=debmem_note.Strings[i-1];
      post;
      dm.ADOTable1debmem_NOTE_PAD_PTR.Value:=fieldvalues['rkey'];
    end;

if dm.ADOTable1.FieldValues['RFQ_NOTE_PAD_PTR']<>null then
  with dm.adoquery1 do             //保存交货记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('RFQ_NOTE_PAD_PTR').AsString);
    active:=true;
    if trim(rfq_note.Text)<>'' then
     begin
      edit;
      for i:=1 to rfq_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := rfq_note.Strings[i-1];
      post;
     end
    else
     begin
      Delete;
      dm.ADOTable1.fieldvalues['rfq_NOTE_PAD_PTR']:=null;
     end;
   end
 else
  if trim(rfq_note.Text)<>'' then
   with dm.adoquery1 do
    begin
    if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0011 where file_pointer is null');
     active:=true;
     append;
     FieldValues['file_pointer']:=dm.ADOTable1RKEY.Value;
     FieldValues['source_type']:=5023;
     for i:=1 to rfq_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=rfq_note.Strings[i-1];
      post;
      dm.ADOTable1rfq_NOTE_PAD_PTR.Value:=fieldvalues['rkey'];
    end;

if dm.ADOTable1.FieldValues['common_PAD_PTR']<>null then
 with dm.adoquery1 do             //保存一般定单记事本
  begin
  if active=true then active:=false;
   sql.Clear;
   sql.Add('select * from data0011');
   sql.Add('where rkey='+dm.ADOTable1.fieldbyname('common_PAD_PTR').AsString);
   active:=true;
  if trim(common_pad.Text)<>'' then
   begin
    edit;
    for i:=1 to common_pad.Count do
    FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := common_pad.Strings[i-1];
    post;
   end
  else
   begin
    Delete;
    dm.ADOTable1.fieldvalues['common_PAD_PTR']:=null;
   end;
 end
else
 if trim(common_pad.Text)<>'' then
   with dm.adoquery1 do
    begin
    if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0011 where file_pointer is null');
     active:=true;
     append;
     FieldValues['file_pointer']:=dm.ADOTable1RKEY.Value;
     FieldValues['source_type']:=4023;
     for i:=1 to common_pad.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=common_pad.Strings[i-1];
      post;
      dm.ADOTable1common_PAD_PTR.Value:=fieldvalues['rkey'];
    end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then //非正常退出
  begin
   dm.adotable1.Cancel;     //no取消对当前记录的修改包括新增
   dm.ADOQuery2.CancelBatch();
   v_close:=1;
   form1.Show;
  end;
end;

function TForm2.Get_control_edit: boolean;
begin
  result:=control_edit1;
end;

procedure TForm2.Set_control_edit(const Value: boolean);
begin
  control_edit1:=value;
  Change_state(control_edit1);
end;

procedure TForm2.Change_state(const Value1: boolean);
begin
////
   dbedit1.Enabled:=value1;
   DBEdit2.Enabled:=Value1;
   DBEdit3.Enabled:=Value1;
   DBEdit7.Enabled:=Value1;
   DBEdit8.Enabled:=Value1;
   DBEdit9.Enabled:=Value1;
   DBEdit10.Enabled:=Value1;
   DBEdit11.Enabled:=Value1;
   DBEdit12.Enabled:=Value1;
   DBEdit13.Enabled:=Value1;
   DBEdit14.Enabled:=Value1;
   DBEdit15.Enabled:=Value1;
   DBEdit16.Enabled:=Value1;
   DBMemo1.Enabled:=Value1;
   Edit1.Enabled:=Value1;
   Edit2.Enabled:=Value1;
   BitBtn4.Enabled:=Value1;
   BitBtn5.Enabled:=Value1;
   BitBtn1.Enabled:=Value1;
   BitBtn2.Enabled:=Value1;
   DBRadioGroup2.Enabled:=Value1;
   ScrollBar1.Enabled:=Value1;

   DBEdit17.Enabled:=Value1;
   DBEdit18.Enabled:=Value1;
   DBEdit19.Enabled:=Value1;
   DBEdit20.Enabled:=Value1;
   DBEdit21.Enabled:=Value1;
   DBEdit22.Enabled:=Value1;
   DBCheckBox3.Enabled:=Value1;
   edit3.Enabled:=Value1;
   BitBtn6.Enabled:=Value1;
   BitBtn10.Enabled:=Value1;
   DBEdit23.Enabled:=Value1;
   DBEdit24.Enabled:=Value1;
   DBEdit25.Enabled:=Value1;
   DBEdit26.Enabled:=Value1;
   DBRadioGroup1.Enabled:=Value1;
   DBEdit27.Enabled:=Value1;
   DBCheckBox1.Enabled:=Value1;

   DBEdit28.Enabled:=Value1;
   DBEdit29.Enabled:=Value1;
   DBEdit30.Enabled:=Value1;
   DBGrid1.Enabled:=Value1;
   DBMemo2.Enabled:=Value1;

   DBEdit34.Enabled:=Value1;
   DBEdit35.Enabled:=Value1;
   DBEdit36.Enabled:=Value1;
   DBEdit37.Enabled:=Value1;
   DBEdit38.Enabled:=Value1;
   DBEdit39.Enabled:=Value1;
   DBEdit40.Enabled:=Value1;
   DBEdit41.Enabled:=Value1;

   n5.Enabled:=Value1;
   n6.Enabled:=Value1;
   n7.Enabled:=Value1;
   //if  Value1=false then
  // MaskEdit1.SetFocus;
  // MaskEdit1.Enabled:=Value1;

end;

end.
