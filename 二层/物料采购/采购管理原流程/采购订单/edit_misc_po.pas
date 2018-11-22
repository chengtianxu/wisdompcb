unit edit_misc_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    Label15: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBComboBox2: TDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit4Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   price:double; 
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
uses damo, Unit_search;
{$R *.dfm}

procedure TForm10.FormActivate(Sender: TObject);
begin
 dbedit5.Field.Alignment := taleftjustify;
 dbedit3.Field.Alignment := taleftjustify;
 dbedit4.Field.Alignment := taleftjustify;
with dm.adoquery2 do
  begin                //查找采购单位
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT unit_code,unit_name');
   sql.add('from data0002');
   sql.Add('where rkey='+dm.ADO72UNIT_PTR.AsString);
   active:=true;
   edit2.Text := fieldbyname('unit_code').AsString;
   edit2.Font.Color:=clwindowtext;
   label10.Caption := fieldbyname('unit_name').AsString;
  end;
 price:=dm.ADO72UNIT_PRICE.Value; 
end;

procedure TForm10.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.Font.Color :=clblue;
  edit2.SelectAll;
 end;
end;

procedure TForm10.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label10.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO72UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('采购单位不能为空,请重新输入或选择',mtinformation,[mbok],0);
    label10.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_unit.free;
 end;
end;

procedure TForm10.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit2.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label10.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO72unit_ptr.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    dbedit3.SetFocus;
   end
  else
   edit2.SetFocus;
end;

procedure TForm10.DBEdit3Exit(Sender: TObject);
begin
if trim(dbedit3.Text)='' then dbedit3.Field.Value:='0';
 dbedit3.Font.Color := clwindowtext;
end;

procedure TForm10.DBEdit3Click(Sender: TObject);
begin
if dbedit3.Font.Color=clwindowtext then
 begin
  dbedit3.Font.Color:=clnone;
  dbedit3.SelectAll;
 end;
end;

procedure TForm10.DBEdit4Click(Sender: TObject);
begin
if dbedit4.Font.Color=clwindowtext then
 begin
  dbedit4.Font.Color:=clnone;
  dbedit4.SelectAll;
 end;
end;

procedure TForm10.DBEdit4Exit(Sender: TObject);
begin
if trim(dbedit4.Text)='' then dbedit4.Field.Value:='0';
dm.ADO72UNIT_PRICE.AsString:=formatfloat('0.000',
       dm.ADO72tax_price.Value/(1+dm.ADO72STATE_TAX.Value*0.01));
end;

procedure TForm10.DBEdit5Click(Sender: TObject);
begin
if dbedit5.Font.Color=clwindowtext then
 begin
  dbedit5.Font.Color:=clnone;
  dbedit5.SelectAll;
 end;
end;

procedure TForm10.DBEdit5Exit(Sender: TObject);
begin
if trim(dbedit5.Text)='' then dbedit5.Field.Value:='0';
 dbedit5.Font.Color := clwindowtext;
dm.ADO72UNIT_PRICE.AsString:=formatfloat('0.000',
       dm.ADO72tax_price.Value/(1+dm.ADO72STATE_TAX.Value*0.01));
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dbedit5.Field.Alignment := taRightJustify;
 dbedit3.Field.Alignment := taRightJustify;
 dbedit4.Field.Alignment := taRightJustify;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
if trim(dbedit2.Text) = '' then
 begin
  messagedlg('物品名称不能为空!',mtinformation,[mbok],0);
  dbedit2.SetFocus;
  exit;
 end;
if trim(dbedit1.Text) = '' then
 begin
  messagedlg('规格不能为空!',mtinformation,[mbok],0);
  dbedit1.SetFocus;
  exit;
 end;
if trim(dbcombobox1.Text) = '' then
 begin
  messagedlg('采购类别不能为空!',mtinformation,[mbok],0);
  dbcombobox1.SetFocus;
  exit;
 end;
if trim(edit2.Text) = '' then
 begin
  messagedlg('采购单位不能为空!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;

 if dm.ADO72QUAN_ORD.Value<dm.ADO72QUANTITY_RECEIVED.Value then
  begin
   messagedlg('数量不能少于已接收的数量',mtinformation,[mbok],0);
   dbedit3.SetFocus;
  end
 else
  begin
   v_close:=1;
   ModalResult:=mrok;
  end;
end;

procedure TForm10.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tdbedit).Text)>0
    then abort;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO72.Cancel;
end;

procedure TForm10.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ADO72.Cancel; 
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0075');
   sql.Add('order by DESCRIPTION');
   open;
   while not eof do
    begin
     dbcombobox1.Items.Add(fieldvalues['DESCRIPTION']);
     Next;
    end;
  end;
  dm.ADOQuery2.close;
end;

procedure TForm10.BitBtn2Exit(Sender: TObject);
begin
  form_unit.free;
end;

procedure TForm10.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

end.
