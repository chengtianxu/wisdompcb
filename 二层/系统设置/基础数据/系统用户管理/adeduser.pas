unit adeduser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, Grids, DBGridEh,
  Menus, DBGrids;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    aped_fg: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    BitBtn5: TBitBtn;
    Label5: TLabel;
    Label7: TLabel;
    Edit8: TEdit;
    Edit7: TEdit;
    TreeView1: TTreeView;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ImageList4: TImageList;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    sgrid1: TStringGrid;
    CheckBox2: TCheckBox;
    Edit5: TEdit;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox2: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   rkey_p,EMPLOYEE_PTR,GROUP_PTR:integer;
   PASSWORD:string;
   procedure get_treedate(treeview:Ttreeview);
   procedure show_sgrid(leve,rkey:integer; Node: TTreeNode);
   procedure append_sgrid(leve,rkey,right:integer; node: TTreeNode);
   procedure locate_419(right:integer);
   procedure locate_aded419(rkey,right:integer);
   function number_error(number: string): boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses DAMO, common, usergroup,md5,Pick_Item_Single ,ConstVar;

{$R *.dfm}
procedure TForm2.show_sgrid(leve, rkey: integer; Node: TTreeNode);
var
 i,rkey_parent:integer;
 node_parent:TTreeNode;
begin
 if leve=0 then
  begin
   for i:=1 to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Clear;
   sgrid1.RowCount:=2;
   dm.ads74.First;
   while not dm.ads74.Eof do
   begin
    if dm.ads74MAIN_PTR.Value=rkey then
     begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=dm.ads74DESCRIPTION.Value;
      sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ads74rights.Value;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ads74FUNCTION_ID.AsString;
      sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ads74seqno.Value;
      sgrid1.RowCount:=sgrid1.RowCount+1;
     end;
    dm.ads74.Next;
   end;
  end
 else
  if leve=1 then
   begin
     for i:=1 to sgrid1.RowCount-2 do
      sgrid1.Rows[i].Clear;
     sgrid1.RowCount:=2;
     dm.ads74.First;
     while not dm.ads74.Eof do
     begin
      if dm.ads74manu_ptr.Value=rkey then
       begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=dm.ads74DESCRIPTION.Value;
        sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ads74rights.Value;
        sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ads74FUNCTION_ID.AsString;
        sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ads74seqno.Value;
        sgrid1.RowCount:=sgrid1.RowCount+1;
       end;
      dm.ads74.Next;
     end;
   end
  else
   begin
    node_parent:=node.Parent;
    rkey_parent:= Pinteger(node_parent.Data)^;
    if rkey_P<> Pinteger(node_parent.Data)^ then
     begin
      for i:=1 to sgrid1.RowCount-2 do
       sgrid1.Rows[i].Clear;
      sgrid1.RowCount:=2;
      dm.ads74.First;
      while not dm.ads74.Eof do
       begin
        if dm.ads74manu_ptr.Value=rkey_parent then
         begin
          sgrid1.Cells[0,sgrid1.RowCount-1]:=dm.ads74DESCRIPTION.Value;
          sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ads74rights.Value;
          sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ads74FUNCTION_ID.AsString;
          sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ads74seqno.Value;
          sgrid1.RowCount:=sgrid1.RowCount+1;
         end;
        dm.ads74.Next;
       end;
     end;
    rkey_P:=Pinteger(node_parent.Data)^;
   end;
end;

procedure TForm2.locate_aded419(rkey, right: integer);
begin
if dm.ads74.Locate('FUNCTION_ID',rkey,[]) then
 begin
  dm.ads74.Edit;
  dm.ads74USER_RIGHTS.Value:=right;
  dm.ads74.Post;
 end
else
 begin
  dm.ads74.Append;
  dm.ads74FUNCTION_ID.Value:=rkey;
  dm.ads74USER_RIGHTS.Value:=right;
  dm.ads74seqno.Value:=dm.ads74seq_no.Value;
  if self.aped_fg.Caption='0' then
   dm.ads74USER_PTR.Value:=dm.ads73RKEY.Value
  else
   dm.ads74USER_PTR.Value:=0;
  dm.ads74.Post;
 end;
end;

procedure TForm2.locate_419(right: integer);
begin
dm.aq419.First;
while not dm.aq419.Eof do
 begin
  locate_aded419(dm.aq419rkey.Value,right);
  dm.aq419.Next;
 end;
end;

procedure TForm2.append_sgrid(leve, rkey,right: integer;node: TTreeNode);
begin
 if leve=0 then
  begin
   dm.aq419.Filter:='main_ptr='+inttostr(rkey);
   locate_419(right);
   show_sgrid(leve,rkey,node);
   dm.aq419.Filter:='';
  end
 else
  if leve=1 then
   begin
    dm.aq419.Filter:='manu_ptr='+inttostr(rkey);
    locate_419(right);
    show_sgrid(leve,rkey,node);
    dm.aq419.Filter:='';
   end
  else
   begin
    locate_aded419(rkey,right);
    self.rkey_p:=0;
    show_sgrid(leve,rkey,node)
   end;
end;

procedure TForm2.get_treedate(treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey:^integer;
begin
dm.ADOQuery2.close;
dm.ADOQuery2.sql.Text:='select * from SYSTEM_MENU'+#13+
          'order by main_ptr, seq_no';
dm.ADOQuery2.open;

dm.ADOQuery3.close;
dm.ADOQuery3.sql.Text:='SELECT Data0419.DESCRIPTION, Data0419.PROGRAME,'+#13+
       'Data0419.manu_ptr, Data0419.RKEY,prev_tp'+#13+
    'FROM Data0419'+#13+
    'where manu_ptr>0'+#13+
    'ORDER BY Data0419.manu_ptr,Data0419.SEQ_NO';
dm.ADOQuery3.open;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select * from SYSTEM_MAIN'+#13+
            'order by seq_no';
  open;
  while not dm.ADOQuery1.Eof do
   begin
    new(rkey);
    rkey^ := fieldvalues['rkey'];
    node := treeview.Items.AddObject
    (nil,fieldbyname('DESCRIPTION').AsString,rkey); //增加一级菜单
     node.ImageIndex:=fieldvalues['image_index'];
     node.SelectedIndex:=40;

      dm.ADOQuery2.Filter:='main_ptr='+fieldbyName('rkey').AsString;
      dm.ADOQuery2.First;
      while not dm.ADOQuery2.Eof do
       begin
        new(rkey);
        rkey^:=dm.ADOQuery2.fieldvalues['rkey'];
        node:=treeview.Items.AddChildObject
        (node,dm.ADOQuery2.fieldbyname('DESCRIPTION').AsString,rkey); //增加二级菜单
        node.ImageIndex:=dm.ADOQuery2.fieldvalues['image_index']+10;
        node.SelectedIndex:=40;

       dm.ADOQuery3.Filter:='manu_ptr='+dm.ADOQuery2.fieldbyName('rkey').AsString;
       dm.ADOQuery3.First;
       while not dm.ADOQuery3.Eof do
       begin
        new(rkey);
        rkey^:=dm.ADOQuery3.fieldvalues['rkey'];
        node:=treeview.Items.AddChildObject(node,
        StringReplace(dm.ADOQuery3.fieldbyname('DESCRIPTION').AsString,' ','',[])+
        ' '+trim(dm.ADOQuery3.fieldbyname('prev_tp').AsString),
         rkey); //增加三级菜单
        node.ImageIndex:=-1;
        node.SelectedIndex:=40;
        node:=node.Parent;
        dm.ADOQuery3.Next;
       end;


        node:=node.Parent;
        dm.ADOQuery2.Next;
       end;
       
    if node.Parent<>nil then node:=node.Parent;

    dm.adoquery1.next;
   end;
 end;

 treeview.FullCollapse; //全部折叠
 treeview.Items[0].Selected:=true;
 dm.ADOQuery2.Filter:='';
 dm.ADOQuery3.Filter:='';
 dm.ADOQuery1.Close;
 dm.ADOQuery2.Close;
 dm.ADOQuery3.Close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 sgrid1.Cells[0,0]:='程序名称';
 sgrid1.Cells[1,0]:='权限';
 sgrid1.ColWidths[2]:=0;
 sgrid1.ColWidths[3]:=0;

 if self.aped_fg.Caption='1' then   //新增
 begin
  dm.ads74.Close;
  dm.ads74.Parameters[0].Value:=0;
  dm.ads74.Open;
 end
 else                              //编辑
  begin
   dm.ads74.Close;
   dm.ads74.Parameters[0].Value:=dm.ads73RKEY.Value;
   dm.ads74.Open;
   self.EMPLOYEE_PTR:=dm.ads73EMPLOYEE_PTR.Value;
   self.GROUP_PTR:=dm.ads73GROUP_PTR.Value;
   self.PASSWORD:=dm.ads73PASSWORD.Value;
  end;
 self.get_treedate(treeview1);
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);

begin

 show_sgrid(node.Level,Pinteger(node.Data)^,node)

end;

procedure TForm2.BitBtn6Click(Sender: TObject);
var
 I,j:integer;
begin
 for i:=sgrid1.Selection.Top to sgrid1.Selection.Bottom do
  begin

   for j:=sgrid1.Selection.Top to sgrid1.RowCount-2 do
    begin
     if j=sgrid1.Selection.Top then
     if dm.ads74.Locate('FUNCTION_ID',strtoint(sgrid1.Cells[2,j]),[]) then
      dm.ads74.Delete;
     sgrid1.Rows[j].Text:=sgrid1.Rows[j+1].Text;
    end;

   if sgrid1.Selection.Top<=sgrid1.RowCount-2 then
    sgrid1.RowCount:=sgrid1.RowCount-1;
  end;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
var
 i:integer;
begin
   for i:=1 to sgrid1.RowCount-2 do
    begin
     if dm.ads74.Locate('FUNCTION_ID',strtoint(sgrid1.Cells[2,i]),[]) then
      dm.ads74.Delete;
     sgrid1.Rows[i].Clear;
    end;
   sgrid1.RowCount:=2;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
 node:TTreeNode;
begin
node:=treeview1.Selected;
self.append_sgrid(node.Level,Pinteger(node.Data)^,1,node);
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
var
 node:TTreeNode;
begin
node:=treeview1.Selected;
self.append_sgrid(node.Level,Pinteger(node.Data)^,2,node);
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
var
 node:TTreeNode;
begin
node:=treeview1.Selected;
self.append_sgrid(node.Level,Pinteger(node.Data)^,3,node);
end;

procedure TForm2.BitBtn10Click(Sender: TObject);
var
 node:TTreeNode;
begin
node:=treeview1.Selected;
self.append_sgrid(node.Level,Pinteger(node.Data)^,4,node);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'EMPL_CODE/员工代码/200,EMPLOYEE_NAME/员工姓名/200,';
    InputVar.Sqlstr := ' select rkey, EMPL_CODE, EMPLOYEE_NAME, ABBR_NAME'+#13+
                        'from data0005'+#13+
                        'where ACTIVE_FLAG=''Y''';
    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='EMPL_CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      EMPLOYEE_PTR :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit3.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
      label4.Caption := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME'];
      if trim(edit1.Text)='' then
       edit1.Text:=edit3.Text;
      if trim(edit2.Text)='' then
       edit2.Text:=label4.Caption;
      edit7.SetFocus;
     end
    else
     edit3.SetFocus;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;

end;

procedure TForm2.Edit3Exit(Sender: TObject);
var
 sqlstr:string;
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit3.Text)<>'')  then
begin

  Sqlstr := ' select rkey, EMPL_CODE, EMPLOYEE_NAME, ABBR_NAME'+#13+
                        'from data0005'+#13+
                        'where ACTIVE_FLAG=''Y'''+#13+
                        'and EMPL_CODE='+QuotedStr(edit3.Text);
  OpenQuery(dm.ADOQuery1,sqlstr);
 if not dm.ADOQuery1.IsEmpty then
  begin
   label4.Caption:=dm.ADOQuery1.fieldbyname('EMPLOYEE_NAME').AsString;
   EMPLOYEE_PTR:=dm.ADOQuery1.fieldbyname('rkey').AsInteger;
   if trim(edit1.Text)='' then
    edit1.Text:=edit3.Text;
   if trim(edit2.Text)='' then
    edit2.Text:=label4.Caption;
  end
 else
  begin
   messagedlg('请输入正确的员工代码!',mtinformation,[mbok],0);
   edit3.SetFocus;
  end;
end
else
if (activecontrol.Name<>'BitBtn3') and (trim(edit3.Text)='')  then
 begin
  label4.Caption:='';
  EMPLOYEE_PTR:=0;
 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
 node:TTreeNode;
begin

with Tform_group.Create(Application) do
try
 if Showmodal=mrok then
  begin
   if not dm.ads74.IsEmpty then
   if not Msg_Dlg_Ask('使用角色授权,原有权限将丢失,继续吗?','提示',1) then
    exit;

   dm.ads74.First;
   while not dm.ads74.Eof do dm.ads74.Delete;
   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Text:='select * from data0074'+#13+
                          'where USER_PTR='+ads73rkey.AsString;
   dm.ADOQuery1.Open;
   while not dm.ADOQuery1.Eof do
    begin
     dm.ads74.Append;
     dm.ads74FUNCTION_ID.Value:=dm.ADOQuery1.FieldValues['FUNCTION_ID'];
     dm.ads74USER_RIGHTS.Value:=dm.ADOQuery1.FieldValues['USER_RIGHTS'];
     dm.ads74seqno.Value:=dm.ADOQuery1.Fieldbyname('seqno').AsString;
     if self.aped_fg.Caption='0' then
      dm.ads74USER_PTR.Value:=dm.ads73RKEY.Value
     else
      dm.ads74USER_PTR.Value:=0;
     dm.ads74.Post;
     dm.ADOQuery1.Next;
    end;

   edit4.Text:=ads73USER_FULL_NAME.Value;
   group_ptr:=ads73rkey.Value;
   node:=treeview1.Selected;
   show_sgrid(node.Level,Pinteger(node.Data)^,node);
   CheckBox2.Checked:=ads73message_flag.Value;
   ComboBox1.ItemIndex:=ads73hrpopm.Value;

   ComboBox2.ItemIndex:=
    ComboBox2.Items.IndexOfObject(Pointer(ads73warehouse_ptr.Value));
   dm.ADOQuery1.Close;
  end;
finally
 Free;
end;
end;

function TForm2.number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0073');
  sql.Add('where USER_LOGIN_NAME='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
  if trim(edit1.Text)='' then
   begin
    messagedlg('登录名称不能为空!',mtinformation,[mbok],0);
    edit1.SetFocus;
    exit;
   end;
  if trim(edit2.Text)='' then
   begin
    messagedlg('用户名称不能为空!',mtinformation,[mbok],0);
    edit2.SetFocus;
    exit;
   end;
  if (trim(edit3.Text)='') and (edit3.Enabled) then
   begin
    messagedlg('员工代码不能为空!',mtinformation,[mbok],0);
    edit3.SetFocus;
    exit;
   end;

 if trim(edit7.Text)<>trim(edit8.Text) then
  begin
   messagedlg('两次输入的密码不相等请重新确认',mtinformation,[mbok],0);
   edit7.SetFocus ;
   exit;
  end;

if (aped_fg.Caption='1') and (number_error(trim(edit1.Text))) then  //新增
 begin
  messagedlg('登录名称重复!请手工重新输入',mterror,[mbok],0);
  edit1.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
dm.ADOConnection1.BeginTrans;
try
if (aped_fg.Caption='1') then
 begin
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:=
   'SELECT rkey,USER_LOGIN_NAME, USER_FULL_NAME, PASSWORD, USER_GROUP_FLAG,'+#13+
   'LANGUAGE_FLAG, GROUP_PTR, EMPLOYEE_PTR, ACTIVE_FLAG, message_flag,'+#13+
   'rpl_pr_ptr, rpl_po_ptr,NETWORK_IP,epiboly_ptr,draw_materiel_ptr,hrpopm,'+#13+
   'validity_date,warehouse_ptr FROM Data0073 where rkey is null';
  dm.ADOQuery1.Open;
  dm.ADOQuery1.Append;
  dm.ADOQuery1.FieldValues['USER_LOGIN_NAME']:=trim(edit1.Text);
  dm.ADOQuery1.FieldValues['USER_FULL_NAME']:=trim(edit2.Text);
  dm.ADOQuery1.FieldValues['NETWORK_IP']:=trim(edit5.Text);
  if checkbox1.Checked then                    
   dm.ADOQuery1.FieldValues['ACTIVE_FLAG']:=0     //有效
  else
   dm.ADOQuery1.FieldValues['ACTIVE_FLAG']:=1;
  dm.ADOQuery1.FieldValues['message_flag']:=checkbox2.Checked;
  dm.ADOQuery1.FieldValues['LANGUAGE_FLAG']:='C';
  DM.ADOQuery1.FieldByName('hrpopm').AsInteger:=ComboBox1.ItemIndex;   //网页人事权限
  if trim(edit3.Text)<>'' then        //新增用户
   begin
    dm.ADOQuery1.FieldValues['EMPLOYEE_PTR']:=self.EMPLOYEE_PTR;
    dm.ADOQuery1.FieldValues['USER_GROUP_FLAG']:=1;
    dm.ADOQuery1.FieldValues['validity_date']:=dtpk1.Date; //密码有效期
   end
  else
   dm.ADOQuery1.FieldValues['USER_GROUP_FLAG']:=0;   //角色

  if trim(edit8.Text)<>'' then
   dm.ADOQuery1.FieldValues['PASSWORD']:=MD5Print(MD5String(trim(edit8.Text)));
  if self.GROUP_PTR>0 then
   dm.ADOQuery1.FieldValues['GROUP_PTR']:=self.GROUP_PTR;
  if ComboBox2.ItemIndex>=0 then
   dm.ADOQuery1.FieldByName('warehouse_ptr').AsInteger:=
       Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex])
  else
   dm.ADOQuery1.FieldByName('warehouse_ptr').AsVariant:=null;

  dm.ADOQuery1.Post;
  dm.ads74.First;
  while not dm.ads74.Eof do
   begin
    dm.ads74.Edit;
    dm.ads74USER_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
    dm.ads74.Post;
    dm.ads74.Next;
   end;
  dm.ads74.UpdateBatch();
  dm.ADOQuery1.Refresh;
  dm.ADOQuery1.Edit;
  dm.ADOQuery1.FieldValues['rpl_pr_ptr']:=dm.ADOQuery1.FieldValues['rkey'];   //请购
  dm.ADOQuery1.FieldValues['rpl_po_ptr']:=dm.ADOQuery1.FieldValues['rkey'];   //采购
  dm.ADOQuery1.FieldValues['epiboly_ptr']:=dm.ADOQuery1.FieldValues['rkey'];   //外发
  dm.ADOQuery1.FieldValues['draw_materiel_ptr']:=dm.ADOQuery1.FieldValues['rkey']; //生产领料审批
  dm.ADOQuery1.Post;
 end
else
 begin
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:=
   'SELECT rkey,USER_LOGIN_NAME, USER_FULL_NAME, PASSWORD, USER_GROUP_FLAG,'+#13+
   'LANGUAGE_FLAG, GROUP_PTR, EMPLOYEE_PTR, ACTIVE_FLAG, message_flag,'+#13+
   'NETWORK_IP,hrpopm,validity_date,warehouse_ptr FROM Data0073'+#13+
   'where rkey ='+dm.ads73RKEY.AsString;
  dm.ADOQuery1.Open;
  dm.ADOQuery1.Edit;
  dm.ADOQuery1.FieldValues['USER_LOGIN_NAME']:=trim(edit1.Text);
  dm.ADOQuery1.FieldValues['USER_FULL_NAME']:=trim(edit2.Text);
  dm.ADOQuery1.FieldValues['NETWORK_IP']:=trim(edit5.Text);
  DM.ADOQuery1.FieldByName('hrpopm').AsInteger:=ComboBox1.ItemIndex;   //网页人事权限
  if checkbox1.Checked then
   dm.ADOQuery1.FieldValues['ACTIVE_FLAG']:=0
  else
   dm.ADOQuery1.FieldValues['ACTIVE_FLAG']:=1;
  dm.ADOQuery1.FieldValues['message_flag']:=checkbox2.Checked;
  if trim(edit3.Text)<>'' then
   begin
    dm.ADOQuery1.FieldValues['EMPLOYEE_PTR']:=self.EMPLOYEE_PTR;
    dm.ADOQuery1.FieldValues['validity_date']:=dtpk1.Date; //密码有效期
   end;
  if trim(edit8.Text)<>self.PASSWORD then
  dm.ADOQuery1.FieldValues['PASSWORD']:=MD5Print(MD5String(trim(edit8.Text)));

  if self.GROUP_PTR>0 then
  dm.ADOQuery1.FieldValues['GROUP_PTR']:=self.GROUP_PTR;
  if ComboBox2.ItemIndex>=0 then
   dm.ADOQuery1.FieldByName('warehouse_ptr').AsInteger:=
       Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex])
  else
   dm.ADOQuery1.FieldByName('warehouse_ptr').AsVariant:=null;
  dm.ADOQuery1.Post;
  dm.ads74.UpdateBatch();
 end;
 dm.ADOConnection1.CommitTrans;
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   edit1.SetFocus;
  end;
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ads74.Close;
 dm.aq419.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 with dm.ADOQuery2 do
 begin
   close;
   SQL.Text:='select rkey,abbr_name from data0015 order by warehouse_code';
   open;
   while not Eof do
   begin
     ComboBox2.Items.AddObject(fieldbyname('abbr_name').AsString,
                       Pointer(FieldByName('rkey').AsInteger));
     next;
   end;
 end;
end;

procedure TForm2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 IF Key=8 then  //退格健删除工厂
 ComboBox2.ItemIndex:=-1;
end;

end.
