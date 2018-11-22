unit dispost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, Menus, Grids, DBGrids, DB,
  ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    Edit3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Label14: TLabel;
    Label13: TLabel;
    Edit5: TEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    PopupMenu2: TPopupMenu;
    DBMemo1: TDBMemo;
    Label15: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6Exit(Sender: TObject);
    procedure update_04(v_seed: string);
  private
    { Private declarations }
   rkey50:integer;
  public
    { Public declarations }
   quantityed:integer; 
  end;

var
  Form2: TForm2;
   function Power(x, y : extended) : extended;
implementation

uses damo, main, edit_rej, p_shipment,common;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
dm.ADO99.Close;
dm.ADO99.Parameters[0].Value:=dm.ADO414rkey.Value;
dm.ADO99.Open;
if dm.ADO414.State=dsinsert then //如果是新增
 begin
  dm.ADO04.Close;
  dm.ado04.Open;
  if dm.ADO04SEED_FLAG.Value<>1 then
   begin
    edit1.Text:=dm.ADO04SEED_VALUE.Value;
   end;
  self.quantityed:=0;
 end
else                          //如果编辑or检查
 begin
  edit1.Text:=dm.ADO414number.Value;
  edit3.Text:=dm.AQ414MANU_PART_NUMBER.Value;
  edit4.Text:=dm.AQ414MANU_PART_DESC.Value;
  bitbtn2.Enabled:=false;
  edit2.Text:=dm.AQ414number415.Value;
  self.rkey50:=dm.AQ414custpart_ptr.Value;
  self.quantityed:=dm.ADO414qty_rece.Value;
  edit6.Text:=dm.AQ414quantity.AsString;
  edit5.Text:=inttostr(dm.AQ414qty_received.Value-dm.AQ414qty_rece.Value);
  if dm.aq414type.Value=3 then
   label15.Caption :='退货重检'
  else
   label15.Caption :='返修重检';
 end;
end;

procedure TForm2.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
 IF KEY=CHR(46) THEN ABORT;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
f_shipment:=tf_shipment.Create(application);
if f_shipment.ADOQuery1.IsEmpty then
 showmessage('对不起,没有找到可用的出仓单号!')
else
if f_shipment.ShowModal=mrok then
 begin
  dm.ADO414d415_ptr.Value:=f_shipment.ADOQuery1rkey.Value;
  dm.ADO414qty_rece.Value:=f_shipment.ADOQuery1quantity.Value-
                           f_shipment.ADOQuery1qty_received.Value;
  edit3.Text :=f_shipment.ADOQuery1manu_PART_NUMBER.Value;
  edit4.Text :=f_shipment.ADOQuery1manu_PART_DESC.Value;
  edit2.Text :=f_shipment.ADOQuery1number.Value;
  edit5.Text :=f_shipment.ADOQuery1qty_received.AsString;
  edit6.Text :=f_shipment.ADOQuery1quantity.AsString;
  rkey50:=f_shipment.adoquery1custpart_ptr.value;
  if f_shipment.ADOQuery1type.Value=3 then
   label15.Caption :='退货重检'
  else
   label15.Caption :='返修重检';
  dbedit5.SetFocus;
 end;
f_shipment.Free
end;

procedure TForm2.N1Click(Sender: TObject);
begin
if self.rkey50<=0 then
 begin
  showmessage('请先选择出仓单号!');
  bitbtn2.SetFocus;
 end
else
 begin
form3:=tform3.Create(application);
form3.Edit2.Text:=inttostr(dm.ADO414qty_rece.Value-self.quantityed);
if form3.ShowModal=mrok then
 begin
  if not dm.ADO99.Locate('REJECT_CODE_PTR',strtoint(form3.Label5.Caption),[]) then
  begin
  dm.ADO99.Append;
  dm.ADO99CUSTOMER_PART_PTR.Value:=self.rkey50;
  dm.ADO99REJECT_CODE_PTR.Value:=strtoint(form3.Label5.Caption);
  dm.ADO99RMA_PTR.Value:=dm.ADO414rkey.Value;
  dm.ADO99EMPLOYEE_PTR.Value:=dm.ADO414empl_ptr.Value;
  dm.ADO99CSI_USER_PTR.Value:=strtoint(rkey73);
  dm.ADO99TDATE.Value:=form1.sort_datetime;
  dm.ADO99QUANTITY.Value:=strtoint(form3.Edit2.Text);
  dm.ADO99REFERENCE_NUMBER.Value:=form3.Edit3.Text;
  dm.ADO99.Post;
  self.quantityed:=self.quantityed+dm.ADO99QUANTITY.Value;
  bitbtn2.Enabled:=false;
  end
  else
   messagedlg('报废代码重复!',mterror,[mbcancel],0);
 end;
form3.Free;
 end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
if messagedlg('你确认要删除该项记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 quantityed:=self.quantityed-dm.ADO99QUANTITY.Value;
 dm.ADO99.Delete;
 if dm.ADO99.IsEmpty then bitbtn2.Enabled:=true;
end;
end;

procedure TForm2.DBEdit5Exit(Sender: TObject);
var
 v_max:integer;
begin
 v_max:= strtoint(edit6.Text)-strtoint(edit5.Text);

if (dm.ADO414qty_rece.Value<self.quantityed) or
   (dm.ADO414qty_rece.Value>v_max) then
 begin
   showmessage('输入数据必须在'+inttostr(quantityed)+'到'+inttostr(v_max)+'之间');
   dbedit5.SetFocus;
 end;
 DBEdit7.Field.Value:=DBEdit5.Field.Value;
 dm.ADO414qty_to_be_remaked.Value:=0;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO99.IsEmpty then
 n3.Enabled:=false
else
 n3.Enabled:=true; 
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
 showmessage('MRB编号不能为空!');
 edit1.SetFocus;
 exit;
end;
if dm.ADO414qty_rece.Value<>
dm.ADO414qty_to_be_reworked.Value+dm.ADO414qty_to_be_remaked.Value then
begin
 showmessage('检视数不等于返工数加报废数!');
 dbedit7.SetFocus;
 exit;
end;
if dm.ADO414qty_rece.Value<>self.quantityed then
 begin
 showmessage('检视数没有处理完成!');
 dbedit5.SetFocus;
 exit;
 end;
if dm.ADO414.State=dsinsert then
 begin
  dm.ADOConnection1.BeginTrans;
  dm.ADO414number.Value:=trim(edit1.Text);
  try
   dm.ADO414.Post;
   self.update_04(dm.ADO414number.Value); //更新控制码
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据保存失败请检查编号是否重复!');
   edit1.SetFocus;
   exit;
  end;
  dm.ADO99.First;
  while not dm.ADO99.Eof do
   begin
    dm.ADO99.Edit;
    dm.ADO99RMA_PTR.Value:=dm.ADO414rkey.Value;
    dm.ADO99.Post;
    dm.ADO99.Next;
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select quantity,qty_received,status from data0415');
    sql.Add('where rkey='+dm.ADO414d415_ptr.AsString);
    open;
    edit;
    fieldvalues['qty_received']:=fieldvalues['qty_received']+dm.ADO414qty_rece.Value;
    if fieldvalues['qty_received']=fieldvalues['quantity'] then
     fieldvalues['status']:= 4;     //已检视
    post;
   end;
  try
  dm.ADO99.UpdateBatch;
  dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据保存失败,请与管理员联系!');
   edit1.SetFocus;
   exit;
  end;
  self.ModalResult:=mrok;
 end
else
 begin
  dm.ADOConnection1.BeginTrans;
  dm.ADO414number.Value:=trim(edit1.Text);
  dm.ADO414status.Value:=1;
  try
   dm.ADO414.Post;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据保存失败请检查编号是否重复!');
   edit1.SetFocus;
   exit;
  end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select quantity,qty_received,status from data0415');
    sql.Add('where rkey='+dm.ADO414d415_ptr.AsString);
    open;
    edit;
    fieldvalues['qty_received']:=fieldvalues['qty_received']+dm.ADO414qty_rece.Value-
                                 dm.AQ414qty_rece.Value;

    if fieldvalues['qty_received']=fieldvalues['quantity'] then
     fieldvalues['status']:= 4;
    post;
   end;

  try
   dm.ADO99.UpdateBatch;
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据保存失败,请与管理员联系!');
   edit1.SetFocus;
   exit;
  end;
  self.ModalResult:=mrok;
 end;

end;

procedure TForm2.DBEdit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(dbedit7.Text)='' then dbedit7.Field.Value:=0;
if strtoint(trim(dbedit7.Text)) > dm.ADO414qty_rece.Value then
 dm.ADO414qty_to_be_reworked.Value:=dm.ADO414qty_rece.Value;
end;

procedure TForm2.DBEdit7Exit(Sender: TObject);
begin
DBEdit7.Text:=DBEdit5.Text;
dm.ADO414qty_to_be_remaked.Value:=dm.ADO414qty_rece.Value-
dm.ADO414qty_to_be_reworked.Value;
end;

procedure TForm2.DBEdit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(dbedit6.Text)='' then dbedit6.Field.Value:=0;
if strtoint(trim(dbedit6.Text)) > dm.ADO414qty_rece.Value then
 dm.ADO414qty_to_be_remaked.Value:=dm.ADO414qty_rece.Value;
end;

procedure TForm2.DBEdit6Exit(Sender: TObject);
begin
dm.ADO414qty_to_be_reworked.Value:=dm.ADO414qty_rece.Value-
dm.ADO414qty_to_be_remaked.Value;
end;

procedure TForm2.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Open;
 if dm.ADO04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.Ado04.Edit; //使前缀不变后缀加1
    dm.ADO04SEED_VALUE.Value := new_seed;
    dm.Ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.Ado04.Edit;
     dm.ADO04SEED_VALUE.Value := new_seed;
     dm.Ado04.Post;
    end;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

end.
