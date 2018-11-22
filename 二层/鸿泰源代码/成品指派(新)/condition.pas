unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls;

type
  Tfm_condition = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var
  fm_condition: Tfm_condition;

implementation
uses damo,constvar,pick_item_single,common;

{$R *.dfm}

procedure Tfm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit1.Text);
 case listbox1.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:=' and d60.sales_order='''+trim(edit1.Text)+'''';
  1:
   begin
    sgrid1.Cells[2,sgrid_row]:=' and d64.assign_type='+inttostr(combobox1.ItemIndex);
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   end;
  2:
   begin
    sgrid1.Cells[2,sgrid_row]:=' and d64.packing_slip_flag='+inttostr(combobox1.ItemIndex);
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   end;
  3:sgrid1.Cells[2,sgrid_row]:=' and d05.empl_code='''+trim(edit1.Text)+'''';
  4:sgrid1.Cells[2,sgrid_row]:=' and d10.cust_code='''+trim(edit1.Text)+'''';
  5:sgrid1.Cells[2,sgrid_row]:=' and d25.manu_part_number like ''%'+trim(edit1.Text)+'%''';
  6:sgrid1.Cells[2,sgrid_row]:=' and d25.manu_part_desc like ''%'+trim(edit1.Text)+'%''';
  7:sgrid1.Cells[2,sgrid_row]:=' and d15.warehouse_code='''+trim(edit1.Text)+'''';
 end;
end;

procedure Tfm_condition.ListBox1Click(Sender: TObject);
begin
 label1.Caption:=listbox1.Items[listbox1.itemindex]+'：';
 edit1.Text:='';
 edit1.Visible:=listbox1.ItemIndex in [0,3,4,5,6,7];
 combobox1.Visible:=listbox1.ItemIndex in [1,2];
 bitbtn4.Visible:=listbox1.ItemIndex in [3,4,7];
 button1.Enabled:=listbox1.ItemIndex in [1,2];
 case listbox1.ItemIndex of
  1:
  begin
   combobox1.Items.Clear;
   combobox1.items.Add('正常指派');
   combobox1.items.Add('退货指派');
   combobox1.Itemindex:=0;
  end;
  2:
  begin
   combobox1.Items.Clear;
   combobox1.items.Add('未装运');
   combobox1.items.Add('已装运');
   combobox1.Itemindex:=0;
  end;
 end; //end case
end;

procedure Tfm_condition.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then button1.Enabled:=true
  else button1.Enabled:=false;
end;

procedure Tfm_condition.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then button1.SetFocus;
end;

procedure Tfm_condition.Edit1Exit(Sender: TObject);
begin
 if (listbox1.ItemIndex in [3,4]) and (trim(edit1.Text)<>'') then
  with dm.aqtmp do
  begin
   close;
   case listbox1.ItemIndex of
   3:sql.Text:='select rkey from data0005 where empl_code='''+trim(edit1.Text)+'''';
   4:sql.Text:='select rkey from data0010 where cust_code='''+trim(edit1.Text)+'''';
   end; //end case
   open;
   if isempty then
   begin
    showmessage(label1.caption+'输入错误，请重新输入！');
    edit1.Text:='';
    edit1.SetFocus;
   end;
  end;
end;

procedure Tfm_condition.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  case listbox1.ItemIndex of
  3:
  begin
   inputvar.Fields:='code/雇员代码/130,employee_name/雇员名称/240';
   inputvar.Sqlstr:='select rkey,empl_code as code,employee_name from data0005 order by empl_code';
   inputvar.KeyField:='code';
  end;
  4:
  begin
   inputvar.Fields:='code/客户代码/130,customer_name/客户名称/240';
   inputvar.Sqlstr:='select rkey,cust_code as code,customer_name from data0010 order by cust_code';
   inputvar.KeyField:='code';
  end;
  7:
  begin
   inputvar.Fields:='code/工厂代码/100,warehouse_name/客户名称/240,ABBR_NAME/客户简称/100';
   inputvar.Sqlstr:='select rkey,warehouse_code as code,warehouse_name,ABBR_NAME '+
   'from data0015 order by warehouse_code';
   inputvar.KeyField:='code';
  end;
  end; //end case

  inputvar.InPut_value:=edit1.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['code']);
   button1.SetFocus;
  end
  else edit1.SetFocus;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure Tfm_condition.Button1Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tfm_condition.BitBtn2Click(Sender: TObject);
var i:byte;
begin  //重置，即清空sgrid数据
  for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;
procedure Tfm_condition.FormCreate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名称';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
  dtpk1.Date:=getsystem_date(dm.aqtmp,1);
  dtpk2.Date:=getsystem_date(dm.aqtmp,1);
  sgrid1.ColWidths[2]:=-1;
end;

procedure Tfm_condition.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount>2 then
  begin
   for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   sgrid1.RowCount:=sgrid1.RowCount-1;
  end
  else sgrid1.Rows[sgrid1.Row].Clear;
end;

procedure Tfm_condition.PopupMenu1Popup(Sender: TObject);
begin
 if (sgrid1.Row>0) and (sgrid1.Row<sgrid1.RowCount-1) then
  n1.Enabled:=true
 else n1.Enabled:=false;
end;

end.
