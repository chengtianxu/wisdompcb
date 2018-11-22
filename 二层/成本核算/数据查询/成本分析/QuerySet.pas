unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    rgType: TRadioGroup;
    DTPk1: TDateTimePicker;
    DTpk2: TDateTimePicker;
    dttm1: TDateTimePicker;
    dttm2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox7: TCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common, uMD, uMain,constvar,pick_item_single;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  tmpstr:string;
  InputVar: PDlgInput;
begin
   case ListBox3.ItemIndex of
    3:tmpstr:= Pick_Prod_Type(edtValue.Text,dm.Conn,2);
    4:
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CODE/仓库代码/110,LOCATION/仓库名称/351';
  InputVar.Sqlstr:='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1'+
  ' order by code';
  inputvar.KeyField:='CODE';
  InputVar.AdoConn := dm.Conn ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    tmpstr:=frmPick_Item_Single.adsPick.Fieldbyname('CODE').AsString;
   end
  else
   edtvalue.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end;
    7:
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='warehouse_code/工厂代码/110,warehouse_name/工厂名称/300,'+
                   'abbr_name/工厂简称/100';
  InputVar.Sqlstr:='SELECT RKEY,warehouse_code,warehouse_name,abbr_name FROM Data0015 '+
  ' order by warehouse_code';
  inputvar.KeyField:='warehouse_code';
  inputvar.InPut_value:=edtvalue.Text;
  InputVar.AdoConn := dm.Conn ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    tmpstr:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_code').AsString;
   end
  else
   edtvalue.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end;

   end;

  if tmpstr <> '' then edtValue.Text := tmpstr;
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
 rma_ptr:string;
begin

  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then exit;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  case listbox3.itemindex of
  0,1,2,3,4,7:
   begin
    if  rgType.ItemIndex = 1 then
     begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:=' like '+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%'''
     end
    else
     begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
     end;
   end;
  5:
   begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=rgType.Items[rgType.itemindex];
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' +IntToStr(rgType.ItemIndex);
   end;
  6:
   begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+
    formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
    formatdatetime('hh:nn:ss',self.dttm1.Time)+'到'+
    formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
    formatdatetime('hh:nn:ss',self.dttm2.Time);

    sgrid1.Cells[2,sgrid1.RowCount-1]:=
    ' and '+v_Field_List_EN[ListBox3.ItemIndex]+ ' > '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
    formatdatetime('hh:nn:ss',self.dttm1.Time))+

    ' and '+v_Field_List_EN[ListBox3.ItemIndex]+ ' <= '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
    formatdatetime('hh:nn:ss',self.dttm2.Time));
   end;
  8:
   begin
     rma_ptr:='(';
     if CheckBox1.Checked then rma_ptr:=rma_ptr+'0,';
     if CheckBox2.Checked then rma_ptr:=rma_ptr+'1,';
     if CheckBox3.Checked then rma_ptr:=rma_ptr+'2,';
     if CheckBox4.Checked then rma_ptr:=rma_ptr+'3,';
     if CheckBox5.Checked then rma_ptr:=rma_ptr+'4,';
     if CheckBox6.Checked then rma_ptr:=rma_ptr+'5,';
     if CheckBox7.Checked then rma_ptr:=rma_ptr+'6,';
     if CheckBox8.Checked then rma_ptr:=rma_ptr+'7,';
     if CheckBox9.Checked then rma_ptr:=rma_ptr+'8,';
     rma_ptr:=Copy(rma_ptr,1,Length(rma_ptr)-1)+')';

    sgrid1.Cells[1,sgrid1.RowCount-1]:='in'+rma_ptr;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ' +rma_ptr;

   end;

  end;

  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  edtValue.Visible := (listbox3.ItemIndex < 5) or
                      (listbox3.ItemIndex = 7);
  BitBtn6.visible := (listbox3.ItemIndex = 3) or
                     (listbox3.ItemIndex = 4) or
                     (listbox3.ItemIndex = 7);
  button3.Enabled := (listbox3.ItemIndex = 5) or (listbox3.ItemIndex = 6);
  dtpk1.Visible := listbox3.ItemIndex = 6;
  dtpk2.Visible := dtpk1.Visible;
  dttm1.Visible := dtpk1.Visible;
  dttm2.Visible := dtpk1.Visible;
  label1.Visible:=dtpk1.Visible;
  label2.Visible:=dtpk1.Visible;
  rgtype.Visible := (listbox3.ItemIndex = 0) or
                   (listbox3.ItemIndex = 1) or
                   (listbox3.ItemIndex = 2) or
                   (listbox3.ItemIndex = 3) or
                   (listbox3.ItemIndex = 4) or
                   (listbox3.ItemIndex = 5) or
                   (listbox3.ItemIndex = 7);

  GroupBox1.Visible:=listbox3.ItemIndex= 8;
  {
  v_Field_List_CN := VarArrayOf(['作业单号','本厂编号','客户型号','产品类型',
  '仓库代码','产品属性','入库日期','工厂代码','入库类型']);
  }
  if  (listbox3.ItemIndex <> 5) then
   begin
    rgType.Items.Clear;
    rgType.Items.Add('等  于');
    rgType.Items.Add('相  似');
   end
  else
   begin
    rgType.Items.Clear;
    rgType.Items.Add('量  产');
    rgType.Items.Add('样  板');
   end;

  rgType.ItemIndex := 0;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (edtvalue.Text <> '') then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['作业单号','本厂编号','客户型号','产品类型',
  '仓库代码','产品属性','入库日期','工厂代码','入库类型']);
  v_Field_List_EN := VarArrayOf(['Data0006.work_order_number',
  'data0025.MANU_PART_NUMBER','data0025.Manu_Part_Desc',
  'Data0008.Prod_Code','data0016.code','data0025.ttype','data0372.indate','data0015.warehouse_code',
  'data0053.RMA_PTR']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  ListBox3Click(Sender);
   
end;

procedure TfrmQuerySet.edtValueChange(Sender: TObject);
begin
if edtvalue.Text <> '' then
 button3.Enabled:=true
else
 button3.Enabled:=false; 
end;

procedure TfrmQuerySet.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox2.Checked)
  or (CheckBox3.Checked) or (CheckBox4.Checked)
  or (CheckBox5.Checked)
  or (CheckBox6.Checked) or (CheckBox7.Checked)
  or (CheckBox8.Checked) or (CheckBox9.Checked)

  then
   Button3.Enabled := true
  else
   Button3.Enabled := false ;
end;

end.
