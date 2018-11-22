unit edit_lo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    chk1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, warehouse_search, damo;
{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
   dm.AQ16.Cancel;
   v_close:=1;
   self.ModalResult:=mrcancel;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
  if form_wh.ADOQuery1.IsEmpty then
   begin
    messagedlg('抱歉没有找到相关记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if form_wh.ShowModal=mrok then
   begin
    dm.AQ16whouse_ptr.Value := form_wh.ADOQuery1.FieldValues['rkey'];
    edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    label5.Caption:=form_wh.ADOQuery1.Fieldbyname('abbr_name').AsString;
    edit1.Font.Color:=clwindowtext;
    bitbtn1.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_wh.free;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i,j:byte;
 v_mask:string;
begin
 if dm.AQ16.FieldValues['whouse_ptr']<>null then
 begin
   with dm.temp do
   begin
    close;
    sql.Text:='select rkey,warehouse_code,abbr_name from data0015 '+
              'where rkey='+dm.AQ16whouse_ptr.AsString;
    open;
    edit1.Text := fieldbyname('warehouse_code').AsString;
    edit1.Font.Color :=clwindowtext;
    label5.Caption:=fieldbyname('abbr_name').AsString;
   end;


   self.ComboBox1.ItemIndex:=dm.AQ16location_type.Value;
 end;


 if dm.AQ16.FieldValues['code']<>null then //编辑
 begin
  maskedit1.Text := trim(dm.AQ16.FieldValues['code']);
  if dm.AQ04.FieldValues['seed_flag']=2  then
  begin
   for i:=length(maskedit1.Text) downto 1 do
   if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
   begin                                    //不是数字字符就为前缀
    Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
    v_mask :=Maskedit1.editmask;
    for j:=1 to i do
    insert('\',v_mask,2*j-1);      //从奇数位插入
    maskedit1.EditMask := v_mask;
    maskedit1.Text := trim(dm.AQ16.FieldValues['code']);
    break;
   end;
  end
  else
   if dm.AQ04.FieldValues['seed_flag']=4 then
    begin
     maskedit1.Enabled :=false;
     dbedit2.SetFocus;
    end
   else
    begin
     maskedit1.SetFocus;
     maskedit1.SelectAll;
    end;
 end
 else                                             //新增状态
 if dm.AQ04.FieldValues['seed_flag']<>1 then
  begin
  maskedit1.text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
  if dm.AQ04.FieldValues['seed_flag']=2  then
  for i:=length(maskedit1.Text) downto 1 do //设置掩码
  if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
  begin                                    //不是数字字符就为前缀
   Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
   v_mask :=Maskedit1.editmask;
   for j:=1 to i do
    insert('\',v_mask,2*j-1);      //从奇数位插入
   maskedit1.EditMask := v_mask;
   maskedit1.Text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
   break;
  end;
  if dm.AQ04.FieldValues['seed_flag']=4 then
   begin
    maskedit1.Enabled :=false;
    dbedit2.SetFocus;
   end
  else
   maskedit1.SelectAll;
  end
 else                             //新增状态中当编码为完全手工编号
  begin
   maskedit1.Text := '';
   maskedit1.SetFocus;
  end;
  
  if trim(ComboBox1.Text) = '材料仓' then
  begin
    chk1.Checked := false;
    chk1.Visible := false;
  end;
  if trim(ComboBox1.Text) = '成品仓' then
  begin
    chk1.Visible := true;
    if dm.AQ16RelationOrder.Value = False then
    begin
      chk1.Checked := False;
    end;
    if dm.AQ16RelationOrder.Value = True then
    begin
      chk1.Checked := True;
    end;
  end
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color =clwindowtext then
  begin
   edit1.Font.Color :=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') then
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
  if comparetext(trim(edit1.Text),form_wh.ADOQuery1.fieldbyname('warehouse_code').AsString)=0 then
   begin
    edit1.Font.Color := clwindowtext;
    dm.AQ16.FieldValues['whouse_ptr']:=form_wh.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('仓库代码不正确!请重新输入',mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 finally
  form_wh.free;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i,v_length:byte;
 v_seed,v_last,new_seed,v_end:string;
 rkey:integer;
begin
 if trim(maskedit1.Text) = '' then
  begin
   messagedlg('位置编号不能为空!',mterror,[mbcancel],0);
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

 if trim(dbedit2.Text) = '' then
  begin
   messagedlg('位置名称不能为空!',mterror,[mbcancel],0);
   dbedit2.SetFocus;
   exit;
  end;
 if trim(edit1.Text) = '' then
  begin
   messagedlg('请确定位置属于哪个工厂!',mterror,[mbcancel],0);
   edit1.SetFocus;
   exit;
  end;
//*****************************************************************************
 dm.AQ16.Fieldvalues['code']:=maskedit1.Text;//给代码赋值
 dm.AQ16location_type.Value:=self.ComboBox1.ItemIndex;
 if chk1.Checked = true then dm.AQ16RelationOrder.Value := true;
 if chk1.Checked = false then dm.AQ16RelationOrder.Value := false;
if dm.AQ16.State=dsedit then //如果编辑
 begin
  dm.AQ16.Post;
  form1.BtBrushClick(sender);
  v_close:=1;
  self.ModalResult:=mrok;
 end
else   //新增
 begin
  
  dm.ADOConnection1.BeginTrans;  //启用事物处理
  try
   dm.AQ16.Post;
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   Form2.Free;
  end;

  if dm.aq04seed_flag.Value<>1 then //代码由控制码控制
  begin
   v_seed := trim(maskedit1.Text);
   v_length :=length(v_seed);
   if v_seed>=trim(dm.AQ04.FieldValues['seed_value']) then //如果代码是从04中取值
   for i := length(v_seed) downto 1 do                       // 更新data0004
   if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
     v_last := inttostr(10000+strtoint(copy(v_seed,i+1,v_length-i))+1);
     new_seed := copy(v_seed,1,i)+copy(v_last,5-(v_length-i)+1,v_length-i);
     dm.AQ04.Edit;            //使前缀不变后缀加1
     dm.AQ04.FieldValues['seed_value'] := new_seed;
     dm.AQ04.Post;
     break;
   end
   else
   if i=1 then //如果第一位仍然是数字
   begin
     v_last := inttostr(100000+strtoint(v_seed)+1);
     new_seed := copy(v_last,6-v_length+1,v_length);
     dm.AQ04.Edit;
     dm.AQ04.FieldValues['seed_value'] := new_seed;
     dm.AQ04.Post;
   end;
  end;


   if Form1.is_new then
   begin
     dm.AQ16.Append;
     Label5.Caption:='';
     edit1.Text := '';
     if dm.AQ04.FieldValues['seed_flag']<>1 then
     begin
       maskedit1.text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
       dbedit2.SetFocus;
     end
     else
     begin
       maskedit1.Text := '';
       maskedit1.SetFocus;
     end;               //以上实现如果是新建的连续增加
     v_close:=1;Close;
     Form1.BtBrushClick(Sender);
   end
   else   //如果是复制则保存后正常退出
   begin
      v_close:=1;Close;
      Form1.BtBrushClick(Sender);
   end;
  //edit1.Text := '';
  //edit1.Font.Color := clblue;
 end;

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
 dm.AQ16.Cancel;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  if trim(ComboBox1.Text) = '材料仓' then
  begin
    chk1.Checked := false;
    chk1.Visible := false;
  end;
  if trim(ComboBox1.Text) = '成品仓' then
  begin
    chk1.Visible := true;
  end
end;

end.
