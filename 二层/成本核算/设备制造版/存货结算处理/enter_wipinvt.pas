unit enter_wipinvt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB;

type
  TForm_entinvt = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
    function find_error(rkey444,invt_ptr,dept_ptr :integer):boolean; overload;
    function find_error(rkey444,invt_ptr,dept_ptr ,rkey462:integer):boolean; overload;
  public
    { Public declarations }
    dept_ptr,invent_ptr,whouse_ptr:integer;
  end;

var
  Form_entinvt: TForm_entinvt;

implementation

uses inv_serach, Unit_sercode, uDM, pick_item_single, constvar;

{$R *.dfm}

function TForm_entinvt.find_error(rkey444, invt_ptr,dept_ptr,rkey462: integer): boolean;
begin
 result:=false;
 with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0462'+#13+
            'where d0443_ptr='+inttostr(rkey444)+#13+
            'and invent_ptr='+inttostr(invt_ptr)+#13+
            'and rkey<>'+inttostr(rkey462)+#13+    //不要选中在编辑的这个材料号
            'and dept_ptr='+inttostr(dept_ptr)+#13+
            'and warehouse_ptr='+inttostr(whouse_ptr); //增加08-10-16 andy
  open;
 end;
 if not dm.Qery.IsEmpty then result:=true;
end;

function TForm_entinvt.find_error(rkey444, invt_ptr,dept_ptr: integer): boolean;
begin
 result:=false;
 with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0462'+#13+
            'where d0443_ptr='+inttostr(rkey444)+#13+
            'and invent_ptr='+inttostr(invt_ptr)+#13+
            'and dept_ptr='+inttostr(dept_ptr)+#13+
            'and warehouse_ptr='+inttostr(whouse_ptr); //增加08-10-16 andy
  open;
 end;
 if not dm.Qery.IsEmpty then result:=true;
end;

procedure TForm_entinvt.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
  begin
    ShowMessage('请先确定工厂');
    Edit6.SetFocus;
    Exit;
  end;
  form_sercode:=tform_sercode.Create(application);
  form_sercode.Edit1.Text:=edit1.Text;
  if form_sercode.ADOQuery1.IsEmpty then
    messagedlg('没有找到符合条件的记录!',mtinformation,[mbcancel],0)
  else
  if form_sercode.ShowModal=mrok then
  begin
    edit1.Text:=form_sercode.ADOQuery1dept_code.Value;
    label7.Caption:=form_sercode.ADOQuery1dept_name.Value;
    self.dept_ptr:=form_sercode.ADOQuery1rkey.Value;
    edit2.SetFocus;
  end;
  form_sercode.Free;
end;

procedure TForm_entinvt.BitBtn2Click(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('请确定工序');
    Edit1.SetFocus;
    Exit;
  end;
  form_inv:=Tform_inv.Create(application);
  form_inv.adoquery1.Close;
  form_inv.adoquery1.Parameters[0].Value:='%'+trim(edit2.Text)+'%';
  form_inv.adoquery1.Open;
  if form_inv.adoquery1.IsEmpty then
    messagedlg('没有找到符合条件的记录!',mtinformation,[mbcancel],0)
  else
  if form_inv.ShowModal=mrok then
  begin
    edit2.Text:=form_inv.adoquery1INV_PART_NUMBER.Value;
    self.invent_ptr:=form_inv.adoquery1RKEY.Value;
    label6.Caption:=form_inv.adoquery1INV_NAME.Value+'-'+
                        form_inv.adoquery1INV_DESCRIPTION.Value;
    edit3.Text:=form_inv.adoquery1UNIT_NAME.Value;

    with DM.ADOtemp do
    begin
      Active:=False;
      Parameters[0].Value:=invent_ptr;
      Parameters[1].Value:=DM.DS444RKEY.Value;
      Parameters[2].Value:=DM.DS444RKEY.Value;
      Parameters[3].Value:=whouse_ptr;
      Parameters[4].Value:=invent_ptr;
      Parameters[5].Value:=DM.DS444RKEY.Value;
      Parameters[6].Value:=whouse_ptr;
      Parameters[7].Value:=invent_ptr;
      Active:=True;
      Edit4.Text:=FieldValues['STD_PRICE'];
    end;
    edit5.SetFocus;
  end;
  form_inv.Free;
end;

procedure TForm_entinvt.Edit5KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if trim(edit5.Text) = '' then edit5.Text := '0';
end;

procedure TForm_entinvt.Button1Click(Sender: TObject);
var rkey:integer;
begin
 if dm.AD462.State=dsedit then
 begin
  if find_error(dm.DS444RKEY.Value,invent_ptr,dept_ptr,dm.AD462rkey.Value) then   //新增 2006-12-1
  begin
    messagedlg('同一工序材料编码不能重复!',mterror,[mbcancel],0);
    edit2.SetFocus;
  end
  else begin
    dm.AD462DEPT_PTR.Value:=self.dept_ptr;
    dm.AD462INVENT_PTR.Value:=self.invent_ptr;
    dm.AD462WAREHOUSE_PTR.Value:=self.whouse_ptr;  //新增 2008-10-15
    dm.AD462QUAN.AsString:=edit5.Text;
    dm.AD462.Post;
    self.ModalResult:=mrok;
  end;
 end
 else begin
  if find_error(dm.DS444RKEY.Value,invent_ptr,dept_ptr) then
  begin
    messagedlg('同一工序材料编码不能重复!',mterror,[mbcancel],0);
    edit2.SetFocus;
  end
  else begin
    dm.AD462.Append;
    dm.AD462D0443_PTR.Value:=dm.DS444RKEY.Value;
    dm.AD462DEPT_PTR.Value:=self.dept_ptr;
    dm.AD462INVENT_PTR.Value:=self.invent_ptr;
    dm.AD462warehouse_ptr.Value:=self.whouse_ptr;  //新增 2008-10-15
    dm.AD462QUAN.AsString:=edit5.Text;
    dm.AD462STD_PRICE.AsString:=edit4.Text;
    dm.AD462.Post;
    rkey:=dm.AD462RKEY.Value;
    dm.AD462.Close;
    dm.AD462.Open;
    dm.AD462.Locate('rkey',rkey,[]);
    edit2.Text:='';
    label6.Caption:='';
    self.invent_ptr:=0;
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='0';
    edit2.SetFocus;
  end;
 end;
end;

procedure TForm_entinvt.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then
  abort
 else if key = chr(46) then
  if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm_entinvt.Button2Click(Sender: TObject);
begin
  self.ModalResult:=mrcancel;
end;

procedure TForm_entinvt.Button1Enter(Sender: TObject);
begin
 if trim(edit1.Text)='' then
 begin
  messagedlg('请输入工序代码!',mterror,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;
 if trim(edit2.Text)='' then
 begin
  messagedlg('请输入材料编码!',mterror,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;
 if strtofloat(trim(edit5.Text))=0 then
 begin
  messagedlg('在线数量不允许为零!',mterror,[mbcancel],0);
  edit5.SetFocus;
  exit;
 end;
end;

procedure TForm_entinvt.Edit1Exit(Sender: TObject);
begin
  if (trim(edit1.Text)<>'') and (activecontrol.Name<>'BitBtn1') then
  with dm.Qery do
  begin
    close;
    sql.Text:='select rkey,dept_code,dept_name,active_flag,is_cost_dept,ttype'+#13+
              'from data0034'+#13+
              'where dept_code='''+trim(edit1.Text)+'''';
    open;
    if IsEmpty then
    begin
      messagedlg('部门编码输入错误!!!',mterror,[mbcancel],0);
      edit1.Text:='';
      edit1.SetFocus;
    end
    else
    if FieldValues['rkey']<>self.dept_ptr then
    if ((FieldValues['is_cost_dept']=1) and (FieldValues['active_flag']=0)) or (FieldValues['ttype']=4) then
    begin
      label7.Caption:=FieldValues['dept_name'];
      self.dept_ptr:=FieldValues['rkey'];
    end
    else
    begin
      messagedlg('该部门编码不是成本中心或者职能部门!!!',mterror,[mbcancel],0);
      edit1.SetFocus;
    end;
  end;
end;

procedure TForm_entinvt.Edit2Exit(Sender: TObject);
begin
  if (trim(edit2.Text)<>'') and (activecontrol.Name<>'BitBtn2') then
  with dm.Qery do
  begin
    close;
    sql.Text:='select data0017.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,std_cost,'+#13+
              'data0002.UNIT_NAME'+#13+
              'from Data0017 inner join data0002'+#13+
              'on data0017.stock_unit_ptr=data0002.rkey'+#13+
              'where INV_PART_NUMBER ='''+trim(edit2.Text)+'''';
    open;

    if IsEmpty then
    begin
      messagedlg('材料编码输入错误!!!',mterror,[mbcancel],0);
      edit2.Text:='';
      edit2.SetFocus;
    end
    else if FieldValues['rkey']<>self.invent_ptr then
    begin
      label6.Caption:=FieldValues['INV_NAME']+'-'+FieldValues['INV_DESCRIPTION'];
      edit3.Text:=FieldValues['UNIT_NAME'];
      self.invent_ptr:=FieldValues['rkey'];

      with DM.ADOtemp do
      begin
        Active:=False;
        Parameters[0].Value:=invent_ptr;
        Parameters[1].Value:=DM.DS444RKEY.Value;
        Parameters[2].Value:=DM.DS444RKEY.Value;
        Parameters[3].Value:=whouse_ptr;
        Parameters[4].Value:=invent_ptr;
        Parameters[5].Value:=DM.DS444RKEY.Value;
        Parameters[6].Value:=whouse_ptr;
        Parameters[7].Value:=invent_ptr;
        Active:=True;
        Edit4.Text:=FieldValues['STD_PRICE'];
      end;
    end;
  end;
end;

procedure TForm_entinvt.BitBtn3Click(Sender: TObject);
var inputvar:Pdlginput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='warehouse_code/工厂代码/130,abbr_name/工厂名称/240';
    inputvar.Sqlstr:='select rkey,warehouse_code,abbr_name from data0015 order by rkey';
    inputvar.KeyField:='warehouse_code';
    inputvar.InPut_value:=edit6.Text;
    inputvar.AdoConn:=dm.Conn;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      edit6.Text:=frmpick_item_single.adsPick.FieldValues['warehouse_code'];
      label9.Caption:=frmpick_item_single.adsPick.FieldValues['abbr_name'];
      whouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure TForm_entinvt.Edit6Exit(Sender: TObject);
begin
  if (trim(edit6.Text)<>'') then
  with dm.Qery do
  begin
     close;
     sql.Text:='select rkey,warehouse_code,abbr_name from data0015'+#13+
              'where warehouse_code='''+trim(edit6.Text)+'''';
     open;
     if IsEmpty then
     begin
       messagedlg('工厂代码输入错误!!!',mterror,[mbcancel],0);
       edit6.Text:='';
       edit6.SetFocus;
     end
     else
     begin
       label9.Caption:=fieldvalues['abbr_name'];
       whouse_ptr:=fieldvalues['rkey'];
     end;
  end
  else
    Label9.Caption:='';
end;

procedure TForm_entinvt.Edit2Click(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('请确定工序');
    Edit1.SetFocus;
    Exit;
  end;
end;

procedure TForm_entinvt.Edit1Click(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
  begin
    ShowMessage('请先确定工厂');
    Edit6.SetFocus;
    Exit;
  end;
end;

end.
