unit device_inv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DBCtrls, Grids,
  ImgList, Menus, DB, ADODB, DBGrids, ExtDlgs;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    HeaderControl1: THeaderControl;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBCheckBox5: TDBCheckBox;
    Label16: TLabel;
    DBCheckBox6: TDBCheckBox;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit6: TEdit;
    BitBtn8: TBitBtn;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Memo1: TMemo;
    Label27: TLabel;
    BitBtn9: TBitBtn;
    Label28: TLabel;
    Bevel1: TBevel;
    Label31: TLabel;
    Edit7: TEdit;
    BitBtn10: TBitBtn;
    Edit8: TEdit;
    BitBtn11: TBitBtn;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ComboBox1: TComboBox;
    TreeView2: TTreeView;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Label50: TLabel;
    Splitter1: TSplitter;
    Label30: TLabel;
    DBEdit18: TDBEdit;
    ctype: TLabel;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    OpenPictureDialog1: TOpenPictureDialog;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    Label29: TLabel;
    Label51: TLabel;
    DBEdit17: TDBEdit;
    DBEdit22: TDBEdit;
    Label52: TLabel;
    Label53: TLabel;
    DBGrid1: TDBGrid;
    Label54: TLabel;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbbox_visible();
    procedure dbbox_additem(i:byte);
    procedure update_note;
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses update_inv,damo, invtype_search, inv_serach, empl_search,
  supplier_search, Unit_search, account_search, note_search,
  warehouse_search, loca_search, main;

{$R *.dfm}

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 dm.AQ17.Cancel;
 dm.ADO20.Close;
 if label50.Caption = '1' then //如果是新增第一次开始编辑并保存
  begin
   dm.AQ17.Close;
   dm.AQ17.Open;
  end;
 dm.AQ18.CancelBatch(arall);
 v_close:=1; //正常退出
 form2.show;
 close;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 treeview1.FullExpand;
 treeview1.Items[1].Selected := true;

 if dm.AQ17S_B_N.Value='S' then
  combobox1.ItemIndex :=0
 else
  if dm.AQ17S_B_N.Value='B' then
   combobox1.ItemIndex :=1
  else
   combobox1.ItemIndex :=2;

  edit10.Text := formatfloat('0.00',dm.AQ17FAILURE_RATE.Value);

  if dm.AQ17FAILURE_RATE.Value>=1 then
   edit9.Text := '1.00'
  else
   edit9.Text := '0.00';
  if (strtoint(form1.vprev.Caption)=1) or (strtoint(form1.vprev.Caption)=3) then
   begin
    DBEdit3.ReadOnly := true;
    DBEdit3.Color := cl3dlight;
    DBEdit4.ReadOnly := true;
    DBEdit4.Color := cl3dlight;
    DBEdit9.ReadOnly := true;
    DBEdit9.Color := cl3dlight;
   end;
 if (strtoint(form1.vprev.Caption)<>4) then
  self.Panel1.Enabled:=false;
 dm.Aq0023.Open;
end;

procedure TForm3.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 case node.SelectedIndex of
 0: notebook1.PageIndex:=0;
 1: notebook1.PageIndex:=1;
 2: notebook1.PageIndex:=2;
 3: notebook1.PageIndex:=3;
 4: begin
     notebook1.PageIndex:=4;
     if treeview2.Items.Count<>0 then
     treeview2.Items[0].Selected:=true;
    end;
 5: notebook1.PageIndex:=5;
 6: notebook1.PageIndex:=6;//成本计算被取消12.6
 7: notebook1.PageIndex:=7;
 8: notebook1.PageIndex:=8;
 9: notebook1.PageIndex:=9;
end;
 headercontrol1.Sections[1].Text:=node.Text;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
 i:byte;
// rkey17:integer;
begin
 if (strtofloat(edit9.Text)=0) then  //保存失败率
  dm.AQ17FAILURE_RATE.Value :=0
 else
  dm.AQ17FAILURE_RATE.Value :=strtofloat(edit10.Text)/strtofloat(edit9.Text);
//==============================================================================
 if not dm.AQ1711.IsEmpty then
  with dm.AQ1711 do             //保存记事本
   begin
    if trim(memo1.Text)<>'' then
     begin
      edit;
       for i:=1 to 4 do
        if memo1.Lines.Count>=i then
         FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=memo1.Lines[i-1]
        else
         FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:='';
      post;
     end
    else
     Delete;
   end
 else         //如果原来没有记事本
  if trim(memo1.Text)<>'' then
   with dm.AQ1711 do
    begin
     append;
     FieldValues['file_pointer']:=dm.AQ17RKEY.Value;
     FieldValues['source_type']:=17;
     for i:=1 to memo1.Lines.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=memo1.Lines[i-1];
     post;
    end;
//==============================================================================

  if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
    dm.AQ17STOCK_PURCH.Value:=1;  //转换率
  if strtoint(label50.Caption)<>1 then self.update_note();//日志文件更改记录

  dm.AQ17.Post;

 try
  if (dm.ADO20.State=dsinsert) or (dm.ADO20.State=dsedit) then
  dm.ADO20.Post;
 except
  treeview1.Items[1].Selected := true;
  dbedit3.SetFocus;
  exit;
 end;
{
 rkey17:=dm.AQ17RKEY.Value;
 dm.AQ17.Close;
 dm.AQ17.Open;
 dm.AQ17.Locate('rkey',rkey17,[]);
}
 dm.AQ17.Refresh;
 dm.AQ18.UpdateBatch(arall);  //工厂
 v_close:=1; //正常退出
 form2.Show;
 close;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 try
  form_invtype:=tform_invtype.Create(application);
  form_invtype.Edit1.Text :=trim(edit1.Text);
  if form_invtype.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
   if form_invtype.ShowModal=mrok then
    begin
     edit1.Text := form_invtype.ADOQuery1GROUP_NAME.Value;
     edit1.Font.Color := clwindowtext;
     label35.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
     dm.AQ17GROUP_PTR.Value := form_invtype.ADOQuery1RKEY.Value;
     ctype.Caption:=form_invtype.ADOQuery1ctype.Value;
     dbcheckbox1.SetFocus;
    end
   else
    edit1.SetFocus;
 finally
  form_invtype.free;
 end;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)<>'') then
 try
  form_invtype := Tform_invtype.Create(Application);
  form_invtype.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_invtype.ADOQuery1.Fieldbyname('group_name').AsString))=0 then
  begin
   edit1.Font.Color := clwindowtext;
   label35.Caption := form_invtype.ADOQuery1.FieldValues['GROUP_DESC'];
   dm.AQ17GROUP_PTR.Value := form_invtype.ADOQuery1RKEY.Value;
   ctype.Caption := form_invtype.ADOQuery1ctype.Value;
  end
 else
  begin
   messagedlg('材料类别不正确,请重新输入或选择',mtinformation,[mbok],0);
   label35.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_invtype.free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)='') then
 begin
  label35.Caption := '';
 end;

end;

procedure TForm3.FormShow(Sender: TObject);
var
 i:byte;
 node :ttreenode;
begin
//==============================================================================
if dm.AQ17GROUP_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找材料类别不能为空
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select group_name,group_desc,ttype from data0496');
  sql.Add('where rkey='+dm.AQ17GROUP_PTR.AsString);
  active:=true;
  edit1.Text := FieldValues['group_name'];;
  edit1.Font.Color := clwindowtext;
  label35.Caption := FieldValues['group_desc'];

  if fieldvalues['ttype']='P' then
   ctype.Caption:='原材料'
  else
   if fieldvalues['ttype']='T' then
    ctype.Caption:='外发加工'
   else
    ctype.Caption:='杂项';
 end;
//==============================================================================
if dm.AQ17AUTHORIZED_BUYER_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找采购员
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select empl_code,employee_name from data0005');
  sql.Add('where rkey='+dm.AQ17AUTHORIZED_BUYER_PTR.AsString);
  active:=true;
  edit3.Text := FieldValues['empl_code'];;
  edit3.Font.Color := clwindowtext;
  label37.Caption := FieldValues['employee_name'];
 end;
//==============================================================================
if dm.AQ17PREF_SUPPLIER_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找首选供应商
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select code,supplier_name from data0023');
  sql.Add('where rkey='+dm.AQ17PREF_SUPPLIER_PTR.AsString);
  active:=true;
  edit4.Text := FieldValues['code'];;
  edit4.Font.Color := clwindowtext;
  label38.Caption := FieldValues['supplier_name'];
 end;
//==============================================================================
if dm.AQ17G_L_CODE_BUY_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找首选供应商
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select gl_acc_number,gl_description from data0103');
  sql.Add('where rkey='+dm.AQ17G_L_CODE_BUY_PTR.AsString);
  active:=true;
  if not isempty then
   begin
    edit8.Text := trim(FieldValues['gl_acc_number']);;
    label34.Caption := trim(FieldValues['gl_description']);
   end;
 end;
//==============================================================================
  edit5.Text := dm.Aq0002.FieldValues['expr1'];;   //查找采购单位,不为空
  edit5.Font.Color := clwindowtext;
  label39.Caption :=dm.Aq0002.FieldValues['expr2'];
  label41.Caption := edit5.Text;
  label44.Caption := edit5.Text;
//==============================================================================
  edit6.Text := dm.Aq0002.FieldValues['unit_code'];  //查找存货单位,不为空
  edit6.Font.Color := clwindowtext;
  label42.Caption := dm.Aq0002.FieldValues['unit_name'];
  label43.Caption := edit6.Text;
  label40.Caption := edit6.Text;
//==============================================================================
  with dm.AQ1711 do                        //读取记事本
   begin
    close;
    Parameters[0].Value:=dm.AQ17RKEY.Value;
    open;
    if not IsEmpty then
    for i:=1 to 4 do
      memo1.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
   end;
//==============================================================================
dm.AQ15.Open;
dm.AQ18.Close;                      //原材料仓库查找
dm.AQ18.Parameters[0].Value := dm.AQ17RKEY.Value;
dm.AQ18.Open;
while not dm.AQ18.Eof do
 begin
 with dm.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select warehouse_code,warehouse_name from data0015');
   sql.Add('where rkey='+dm.AQ18whouse_ptr.AsString);
   active:=true;
   node :=TREEVIEW2.Items.ADD(treeview2.Selected,FIELDvalues['WAREHOUSE_CODE']+' '+FIELDvalues['WAREHOUSE_NAME']);
   node.ImageIndex:=0;
   node.SelectedIndex:=0;
  end;
 for i:=1 to 5 do  //data0018中的location_ptr(i)最多只有五个
 IF dm.AQ18.FieldValues['location_ptr'+inttostr(i)]<>null THEN
  with dm.ADOQuery1 do
   begin
    active := false;
    sql.Clear;
    sql.Add('select code,location from data0016');
    sql.Add('where rkey='+dm.AQ18.fieldbyname('location_ptr'+inttostr(i)).AsString);
    active := true;
    node :=TREEVIEW2.Items.ADDchild(node,FIELDvalues['CODE']+' '+FIELDvalues['location']);
    node.ImageIndex:=1;
    node.SelectedIndex:=1;
    node:=node.Parent;
   end
 else
  break;
  dm.AQ18.Next;
 end;
 dm.AQ18.First;
 treeview2.FullExpand;
//==============================================================================
 stringgrid1.Cells[0,0] := '参数号';
 stringgrid1.Cells[1,0] := '参数名称';
 stringgrid1.Cells[2,0] := '值';
 dm.aq0499.open;
if not dm.AQ0499.IsEmpty then //如果不为空
 begin
  dm.AQ0499.first;
  stringgrid1.RowCount := dm.AQ0499.RecordCount+1;
  dbbox_visible();  //使有参数的控件可用
  for i:=1 to dm.AQ0499.RecordCount do
   begin
    stringgrid1.Cells[0,i] := dm.AQ0499SEQ_NO.AsString;
    stringgrid1.Cells[1,i] := dm.AQ0499PARAMETER_desc.Value;
    if strtoint(label50.Caption) = 1 then //新增包括复制
     dm.AQ17.Fieldvalues['IES_PARAMETER_VALUE'+inttostr(i)]:=dm.AQ0499DEF_VALUE.Value;
    dbbox_additem(i);   //给每一个参数增加可选项目
    dm.AQ0499.Next;
   end;
 end;
 dm.AQ0499.Close;
//==============================================================================
dm.ADO20.Close;        //图片信息表
dm.ADO20.Parameters[0].Value:=dm.AQ17RKEY.Value;
dm.ADO20.Open;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
 try
  form_empl:=tform_empl.Create(application);
  form_empl.Edit1.Text :=trim(edit3.Text);
  if form_empl.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_empl.ShowModal=mrok then
    begin
     edit3.Text := form_empl.ADOQuery1.FieldValues['empl_code'];
     edit3.Font.Color := clwindowtext;
     label37.Caption := form_empl.ADOQuery1.FieldValues['employee_name'];
     dm.AQ17AUTHORIZED_BUYER_PTR.Value := form_empl.ADOQuery1.FieldValues['rkey'];
     edit4.SetFocus;
    end
   else
    edit3.SetFocus;
 finally
  form_empl.free;
 end;
end;

procedure TForm3.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)<>'') then
 try
  form_empl := Tform_empl.Create(Application);
  form_empl.Edit1.Text:=trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_empl.ADOQuery1.Fieldbyname('empl_code').AsString))=0 then
  begin
   edit3.Font.Color:=clwindowtext;
   label37.Caption:=form_empl.ADOQuery1.FieldValues['employee_name'];
   dm.AQ17AUTHORIZED_BUYER_PTR.Value := form_empl.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('替代材料名称不正确,请重新输入或选择',mtinformation,[mbok],0);
   label37.Caption := '';
   edit3.SetFocus;
  end;
 finally
  form_empl.free;
 end
else
 if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)='') then
  begin
   dm.AQ17AUTHORIZED_BUYER_PTR.AsVariant :=null;
   label37.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text :=trim(edit4.Text);
  if form_supp.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
   if form_supp.ShowModal=mrok then
    begin
     edit4.Text := form_supp.ADOQuery1.FieldValues['code'];
     edit4.Font.Color := clwindowtext;
     label38.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
     dm.AQ17PREF_SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
     edit5.SetFocus;
    end
   else
    edit4.SetFocus;
 finally
  form_supp.free;
 end;
end;

procedure TForm3.Edit4Click(Sender: TObject);
begin
 if edit4.Font.Color=clwindowtext then
  begin
   edit4.SelectAll;
   edit4.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(edit4.Text)<>'') then
 try
  form_supp := Tform_supp.Create(Application);
  form_supp.Edit1.Text:=trim(edit4.Text);
 if comparetext(trim(edit4.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit4.Font.Color:=clwindowtext;
   label38.Caption:=form_supp.ADOQuery1.FieldValues['supplier_name'];
   dm.AQ17PREF_SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label38.Caption := '';
   edit4.SetFocus;
  end;
 finally
  form_supp.free;
 end
else
 if (activecontrol.Name<>'BitBtn6') and (trim(edit4.Text)='') then
  begin
   dm.AQ17PREF_SUPPLIER_PTR.AsVariant :=null;
   label38.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TForm3.BitBtn7Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit5.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit5.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit5.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit5.Font.Color := clwindowtext;
     label39.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     label41.Caption := edit5.Text;
     label44.Caption := edit5.Text;
     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value:=1;
     dbedit7.SetFocus;
    end
   else
    edit5.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TForm3.BitBtn8Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit6.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit6.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit6.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit6.Font.Color := clwindowtext;
     label42.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     label43.Caption := edit6.Text;
     label40.Caption := edit6.Text;
     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value:=1;
     dbedit11.SetFocus;
    end
   else
    edit6.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TForm3.Edit5Click(Sender: TObject);
begin
 if edit5.Font.Color=clwindowtext then
  begin
   edit5.SelectAll;
   edit5.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit5Exit(Sender: TObject);
begin
 if activecontrol.Name<>'BitBtn7' then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;
  form_unit.Edit1.Text:=trim(edit5.Text);
 if comparetext(trim(edit5.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit5.Font.Color:=clwindowtext;
   label39.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   label41.Caption := edit5.Text;
   label44.Caption := edit5.Text;
   dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
    dm.AQ17STOCK_PURCH.Value:=1;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label39.Caption:='';
   edit5.SetFocus;
  end;
 finally
  form_unit.free;
 end;
end;

procedure TForm3.Edit6Exit(Sender: TObject);
begin
 if activecontrol.Name<>'BitBtn8' then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text:=trim(edit6.Text);
 if comparetext(trim(edit6.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit6.Font.Color:=clwindowtext;
   label42.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   label43.Caption := edit6.Text;
   label40.Caption := edit6.Text;
   dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
    dm.AQ17STOCK_PURCH.Value:=1;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label42.Caption:='';
   edit6.SetFocus;
  end;
 finally
  form_unit.free;
 end;
end;

procedure TForm3.Edit6Click(Sender: TObject);
begin
 if edit6.Font.Color=clwindowtext then
  begin
   edit6.SelectAll;
   edit6.Font.Color :=clblue;
  end;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
  0:dm.AQ17S_B_N.Value:='S';
  1:dm.AQ17S_B_N.Value:='B';
  2:dm.AQ17S_B_N.Value:='N';
 end;
end;

procedure TForm3.BitBtn10Click(Sender: TObject);
begin
 try
  form_account:=tform_account.Create(application);
  form_account.Edit1.Text :=trim(edit7.Text);
  if form_account.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit7.SetFocus;
   end
  else
   if form_account.ShowModal=mrok then
    begin
     edit7.Text := form_account.ADOQuery1.FieldValues['gl_acc_number'];
     edit7.Font.Color := clwindowtext;
     label33.Caption := form_account.ADOQuery1.FieldValues['gl_description'];
     dm.AQ17G_L_CODE_SELL_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
     dbedit8.SetFocus;
    end
   else
    edit7.SetFocus;
 finally
  form_account.free;
 end;
end;

procedure TForm3.Edit7Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn10') and (trim(edit7.Text)<>'') then
 try
  form_account := Tform_account.Create(Application);
  form_account.Edit1.Text:=trim(edit7.Text);
 if comparetext(trim(edit7.text),trim(form_account.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit7.Font.Color:=clwindowtext;
   label33.Caption:=form_account.ADOQuery1.FieldValues['gl_description'];
   dm.AQ17G_L_CODE_SELL_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('帐目代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label33.Caption := '';
   edit7.SetFocus;
  end;
 finally
  form_account.free;
 end
else
 if (activecontrol.Name<>'BitBtn10') and (trim(edit7.Text)='') then
  begin
   dm.AQ17G_L_CODE_SELL_PTR.AsVariant :=null;
   label33.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TForm3.Edit7Click(Sender: TObject);
begin
if edit7.Font.Color=clwindowtext then
 begin
  edit7.SelectAll;
  edit7.Font.Color :=clblue;
 end;
end;

procedure TForm3.Edit8Click(Sender: TObject);
begin
 if edit8.Font.Color=clwindowtext then
  begin
   edit8.SelectAll;
   edit8.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit8Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn11') and (trim(edit8.Text)<>'') then
 try
  form_account := Tform_account.Create(Application);
  form_account.Edit1.Text:=trim(edit8.Text);
 if comparetext(trim(edit8.text),trim(form_account.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit8.Font.Color:=clwindowtext;
   label34.Caption:=form_account.ADOQuery1.FieldValues['gl_description'];
   dm.AQ17G_L_CODE_BUY_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('帐目代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label34.Caption := '';
   edit8.SetFocus;
  end;
 finally
  form_account.free;
 end
else
 if (activecontrol.Name<>'BitBtn11') and (trim(edit8.Text)='') then
  begin
   dm.AQ17G_L_CODE_buy_PTR.AsVariant :=null;
   label34.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TForm3.BitBtn11Click(Sender: TObject);
begin
 try
  form_account:=tform_account.Create(application);
  form_account.Edit1.Text :=trim(edit8.Text);
  if form_account.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit8.SetFocus;
   end
  else
   if form_account.ShowModal=mrok then
    begin
     edit8.Text := form_account.ADOQuery1.FieldValues['gl_acc_number'];
     edit8.Font.Color := clwindowtext;
     label34.Caption := form_account.ADOQuery1.FieldValues['gl_description'];
     dm.AQ17G_L_CODE_buy_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
     treeview1.SetFocus;
    end
   else
    edit8.SetFocus;
 finally
  form_account.free;
 end;

end;

procedure TForm3.BitBtn9Click(Sender: TObject);
var
i:byte;
begin
 try
  form_note:=tform_note.Create(application);
  if form_note.ShowModal=mrok then
   begin
   memo1.Clear;
   for i:=1 to 4 do
   memo1.lines.add(form_note.Adoquery1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
   end;
 finally
  form_note.free;
 end;
end;

procedure TForm3.Memo1Change(Sender: TObject);
begin
 if memo1.Lines.Count>=4 then
  memo1.WantReturns :=false
 else
  memo1.WantReturns :=true;
end;

procedure TForm3.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit9.Text)>0 //小数点不能重复
    then abort;
end;

procedure TForm3.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit10.Text)>0 //小数点不能重复
    then abort;
end;

procedure TForm3.Edit9Exit(Sender: TObject);
begin
 if trim(edit9.Text)='' then edit9.Text:='0';
  edit9.Text := formatfloat('0.00',strtofloat(edit9.Text));
end;

procedure TForm3.Edit10Exit(Sender: TObject);
begin
 if trim(edit10.Text)='' then edit10.Text:='0';
 edit10.Text := formatfloat('0.00',strtofloat(edit10.Text));
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
if treeview2.Items.Count<>0 then
 begin
  case TREEView2.Selected.Level of
  0: begin
      n1.Visible:=true;
      n2.Visible:=true;
      n7.Visible:=true;
      n3.Visible:=false;
      n4.Visible:=false;
      n6.Visible:=false;
     end;
  1: begin
      n1.Visible:=false;
      n2.Visible:=false;
      n7.Visible:=false;
      n3.Visible:=true;
      n4.Visible:=true;
      n6.Visible:=true;
     end;
  end;
 end
else
 begin
  n1.Visible:=true;
  n2.Visible:=false;
  n7.Visible:=false;
  n3.Visible:=false;
  n4.Visible:=false;
  n6.Visible:=false;
 end;
end;

procedure TForm3.N1Click(Sender: TObject);
var
 NODE:TTREENODE;
 i:integer;
begin
   try
   form_wh := Tform_wh.Create(Application);
 if form_wh.ShowModal=mrok then
  begin
   if treeview2.items.count>0 then  //如果treeveiw控件已有数据
    begin   //检查是否有重复记录
     For i:=0 to Treeview2.items.count-1 do
     if TREEVIEW2.ITEMS[i].text=form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_CODE').ASSTRING+' '+form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_NAME').ASSTRING then
     begin
      Messagedlg('该仓库已经存在!',mtinformation,[mbOK],0);
      exit;
     end;
     node:=treeview2.Selected;
     if node.Parent=nil then
      NODE:=TREEVIEW2.Items.Add(node,form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_CODE').ASSTRING+' '+form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_NAME').ASSTRING)
     else
      NODE:=TREEVIEW2.Items.Add(node.parent,form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_CODE').ASSTRING+' '+form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_NAME').ASSTRING);
     node.ImageIndex:=0;
     node.SelectedIndex:=0;
     node.Selected:=true;
     end
   else        //如果treeview控件没有数据
    begin
     NODE:=TREEVIEW2.Items.AddFirst(treeview2.selected,form_wh.adoQuery1.FIELDBYNAME('WAREHOUSE_CODE').ASSTRING+' '+form_wh.ADOQuery1.FIELDBYNAME('WAREHOUSE_NAME').ASSTRING);
     node.ImageIndex:=0;
     node.SelectedIndex:=0;
     node.Selected:=true;
    end;
  dm.AQ18.Append;
  dm.AQ18whouse_ptr.Value:=form_wh.adoQuery1.FIELDvalues['RKEY'];
  dm.AQ18invent_ptr.Value:=dm.AQ17RKEY.Value;
    try
    form_lo := Tform_lo.Create(Application);
    if form_lo.ShowModal=mrok then
    begin
     node:=treeview2.Items.AddChild(node,form_lo.adoquery1.fieldbyname('code').asstring+' '+form_lo.adoquery1.fieldbyname('location').asstring);
     node.ImageIndex:=1;
     node.SelectedIndex:=1;
     dm.aq18.fieldbyname('location_ptr1').asstring:=form_lo.adoquery1.fieldbyname('rkey').asstring;
     dm.aq18.Post;
    end;
   if dm.AQ18.State=dsedit then dm.AQ18.Post;
     treeview2.FullExpand;
    finally
     form_lo.free;
    end;
  end;
finally
form_wh.free;
end;
end;

procedure TForm3.N3Click(Sender: TObject);
var
node:ttreenode;
i:integer;
begin
node:=treeview2.Selected;
IF node.Parent<>nil THEN
   NODE:=node.parent;
if node.Count = 5 then //交节点下的子节点数目不能多于5个
 begin
  showmessage('仓库位置已满5个不能再增加了！');
 end
else
try
  form_lo := Tform_lo.Create(Application);
  if form_lo.ShowModal=mrok then
   begin
    if node.Count>0 then  //如果有子节点那幺就去找位置是否重复
      For i:=0 to node.count-1 do
       if node.ITEM[i].text=form_lo.ADOQuery1.FIELDBYNAME('code').ASSTRING+' '+form_lo.ADOQuery1.FIELDBYNAME('location').ASSTRING
        then
         begin  //如果子节点的文本已存在
          Messagedlg('仓库位置已经存在!',mtinformation,[mbOK],0);
          exit;
         end;

     node:=treeview2.Items.AddChild(node,form_lo.ADOQuery1.fieldbyname('code').asstring+' '+form_lo.ADOQuery1.fieldbyname('location').asstring);
     node.ImageIndex:=1;
     node.SelectedIndex:=1;
   dm.AQ18.Edit;
   dm.AQ18.fieldvalues['location_ptr'+inttostr(node.parent.Count)]:=form_lo.ADOQuery1.fieldvalues['rkey'];
   dm.AQ18.Post;
    node.Selected:=true;
    treeview2.FullExpand;
 end;
finally
form_lo.free;
end;

end;

procedure TForm3.TreeView2Change(Sender: TObject; Node: TTreeNode);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey]; //查找data0018仓库数据
if node.Parent<>nil then  //如果不在第一层
 begin
  node:=node.Parent;
  dm.aq15.locate('WAREHOUSE_CODE',copy(node.text,1,pos(' ',node.text)-1),searchoption);
  dm.AQ18.locate('WHOUSE_PTR',dm.aq15.fieldbyname('RKEY').ASINTEGER,searchoption);
  label46.Font.Color:=clgray;
  label47.font.color:=clgray;
  label48.font.color:=clgray;
  dbedit19.Enabled:=false;
  dbedit20.Enabled:=false;
  dbedit21.Enabled:=false;
 end
else                      //如果在第一层
 begin
  dm.aq15.locate('WAREHOUSE_CODE',copy(node.text,1,pos(' ',node.text)-1),searchoption);
  dm.AQ18.locate('WHOUSE_PTR',dm.aq15.fieldbyname('RKEY').ASINTEGER,searchoption);
  label46.Font.Color:=clwindowtext;
  label47.font.color:=clwindowtext;
  label48.font.color:=clwindowtext;
  dbedit19.Enabled:=true;
  dbedit20.Enabled:=true;
  dbedit21.Enabled:=true;
 end;
end;

procedure TForm3.N2Click(Sender: TObject);
var
 node :ttreenode;
//on_hand :single;
begin
{on_hand :=0;         //因为0019数据被删除此程序作费
with dm.ADOQuery1 do
 begin
  active:=false;
  sql.Clear;
  sql.Add('select quan_on_hand from data0019');
  sql.Add('where inv_whouse_ptr='+dm.AQ18rkey.AsString);
  active:=true;
  while not eof do
   begin
    on_hand :=fieldvalues['quan_on_hand'];
    next;
   end;
 end;
if on_hand>0 then
 messagedlg('该仓库已有库存,不能删除',mterror,[mbcancel],0)
else
 begin}
  dm.AQ18.Delete;
  node:=treeview2.Selected;
  node.Delete;
//end;
end;

procedure TForm3.N4Click(Sender: TObject);
var
 node:ttreenode;
 i:integer;
begin
 node:=treeview2.Selected;
 dm.AQ18.Edit;
 if node.index=node.Parent.count-1 then //如果是删除最后一个仓库位置
  begin
  dm.AQ18.FieldValues['location_ptr'+inttostr(node.parent.Count)]:=null;
  dm.AQ18.Post;
  node.Delete;
  end
 else             //如果是删除中间仓库位置
  begin
   for i:=node.index+1 to node.Parent.Count do
    begin
     if i < node.Parent.Count then
      dm.AQ18.fieldvalues['location_ptr'+inttostr(i)]:=dm.AQ18.FieldValues['location_ptr'+inttostr(i+1)]
     else
      dm.AQ18.FieldValues['location_ptr'+inttostr(i)]:=null;
    end;
  dm.AQ18.Post;
  node.delete;
 end;
end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if (acol=2) and (arow=stringgrid1.RowCount-1) then
   canselect:=false;
end;

procedure TForm3.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if stringgrid1.RowCount=2 then  abort;
 if length(stringgrid1.Cells[1,stringgrid1.row])>=15 then
 if key<>#8 then
  abort; //最多输入15个字符
end;

procedure TForm3.BitBtn1Enter(Sender: TObject);
begin
 if trim(dbedit3.Text)='' then
  begin
   messagedlg('材料代码不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit3.SetFocus;
   exit;
  end;
 if trim(dbedit4.Text)='' then
  begin
   messagedlg('材料名称不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit4.SetFocus;
   exit;
  end;
 if trim(dbedit9.Text)='' then
  begin
   messagedlg('材料规格不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit9.SetFocus;
   exit;
  end;

 if trim(edit1.Text)='' then
  begin
   messagedlg('材料类别能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   edit1.SetFocus;
   exit;
  end;
//==============================================================================
if (strtofloat(edit9.Text)>0) and (strtofloat(edit10.Text)=0) then
 begin
  messagedlg('失败率输入不正确!',mterror,[mbcancel],0);
  treeview1.Items[2].Selected := true;
  edit9.SetFocus;
  exit;
 end
else
 if (strtofloat(edit9.Text)=0) and (strtofloat(edit10.Text)>0) then
  begin
   messagedlg('失败率输入不正确!',mterror,[mbcancel],0);
   treeview1.Items[2].Selected := true;
   edit10.SetFocus;
   exit;
  end
 else
  if (strtofloat(edit9.Text)>strtofloat(edit10.Text)) then
   begin
    messagedlg('失败率输入不正确!',mterror,[mbcancel],0);
    treeview1.Items[2].Selected := true;
    edit9.SetFocus;
    exit;
   end;
//=============================================================================
 if dm.AQ18.IsEmpty then
  begin
   messagedlg('至少输入一个仓库!',mterror,[mbcancel],0);
   treeview1.Items[4].Selected := true;
   treeview2.SetFocus;
   exit;
  end;
if dbedit10.Field.Value<=0 then
 begin
   messagedlg('保存期限应大于零!',mterror,[mbcancel],0);
   treeview1.Items[3].Selected := true;
   dbedit10.SetFocus;
   exit;
 end;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then // 非正常退出
 begin
  dm.AQ17.Cancel;
  if label50.Caption = '1' then //如果是新增第一次开始编辑并保存
   begin
    dm.AQ17.Close;
    dm.AQ17.Open;
   end;
  dm.AQ18.CancelBatch(arall);
  form2.show;
 end;
end;

procedure TForm3.dbbox_visible();
begin
case dm.AQ0499.RecordCount of
1:dbcombobox1.Visible:=true;
2:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
 end;
3:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
 end;
4:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
 end;
5:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
 end;
6:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
  dbcombobox6.Visible:=true;
 end;
7:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
  dbcombobox6.Visible:=true;
  dbcombobox7.Visible:=true;
 end;
8:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
  dbcombobox6.Visible:=true;
  dbcombobox7.Visible:=true;
  dbcombobox8.Visible:=true;
 end;
9:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
  dbcombobox6.Visible:=true;
  dbcombobox7.Visible:=true;
  dbcombobox8.Visible:=true;
  dbcombobox9.Visible:=true;
 end;
10:
 begin
  dbcombobox1.Visible:=true;
  dbcombobox2.Visible:=true;
  dbcombobox3.Visible:=true;
  dbcombobox4.Visible:=true;
  dbcombobox5.Visible:=true;
  dbcombobox6.Visible:=true;
  dbcombobox7.Visible:=true;
  dbcombobox8.Visible:=true;
  dbcombobox9.Visible:=true;
  dbcombobox10.Visible:=true;
 end;
end;

end;

procedure TForm3.dbbox_additem(i:byte);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey,tvalue from data0338');
  sql.Add('where parameter_ptr='+dm.AQ0499PARAMETER_PTR.AsString);
  open;
  while not eof do
   begin
    case i of
     1: dbcombobox1.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     2: dbcombobox2.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     3: dbcombobox3.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     4: dbcombobox4.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     5: dbcombobox5.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     6: dbcombobox6.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     7: dbcombobox7.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     8: dbcombobox8.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     9: dbcombobox9.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
     10:dbcombobox10.Items.Add(trim(dm.ADOQuery1.fieldvalues['tvalue']));
    end;
    next;
   end;
 end;
end;

procedure TForm3.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
{
if (sender as tdbcombobox).Items.Count>0 then
 if key<>#8 then
   abort;
}
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
 dbimage1.Stretch:=checkbox1.Checked;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
 OpenPictureDialog1.Execute;
if trim(OpenPictureDialog1.filename)<>'' then
 if dm.ADO20.IsEmpty then
  begin
   dm.ADO20.Append;
   dm.ADO20SOURCE_PTR.Value:=dm.AQ17RKEY.Value;
   dbimage1.picture.LoadFromFile(OpenPictureDialog1.filename);
  end
 else
  begin
   dm.ADO20.Edit;
   dbimage1.picture.LoadFromFile(OpenPictureDialog1.filename);
  end;
end;

procedure TForm3.update_note;
begin
 if comparetext(trim(dm.ADO0017inv_part_number.Value),trim(dm.AQ17INV_PART_NUMBER.Value))<>0 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.AQ17RKEY.AsString+',5,''更改材料项目编号'',');
    sql.Add(''''+dm.ADO0017inv_part_number.Value+''','''+dm.AQ17INV_PART_NUMBER.Value+''','+form1.csi_empl_ptr.caption+',');
    sql.add(''''+form1.v_date+''',89)');
    ExecSQL;
   end;
 if comparetext(trim(dm.ADO0017INV_NAME.Value),trim(dm.AQ17INV_NAME.Value))<>0 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.AQ17RKEY.AsString+',6,''更改材料项目名称'',');
    sql.Add(''''+dm.ADO0017INV_NAME.Value+''','''+dm.AQ17INV_NAME.Value+''','+form1.csi_empl_ptr.caption+',');
    sql.add(''''+form1.v_date+''',89)');
    ExecSQL;
   end;
 if comparetext(trim(dm.ADO0017INV_DESCRIPTION.Value),trim(dm.AQ17INV_DESCRIPTION.Value))<>0 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.AQ17RKEY.AsString+',7,''更改材料项目规格'',');
    sql.Add(''''+dm.ADO0017INV_DESCRIPTION.Value+''','''+dm.AQ17INV_DESCRIPTION.Value+''','+form1.csi_empl_ptr.caption+',');
    sql.add(''''+form1.v_date+''',89)');
    ExecSQL;
   end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.AQ1711.Close;
dm.Aq0023.Close;
dm.AQ15.Close;
end;

procedure TForm3.DBEdit7Exit(Sender: TObject);
begin
if trim(dbedit7.Text)='' then dm.AQ17STOCK_PURCH.Value:=0;
end;

procedure TForm3.DBEdit11Exit(Sender: TObject);
begin
if trim(dbedit11.Text)='' then dm.AQ17STOCK_PURCH.Value:=0;
end;

end.
