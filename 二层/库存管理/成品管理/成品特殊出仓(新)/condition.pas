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
uses damo,constvar,pick_item_single;

{$R *.dfm}

procedure Tfm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit1.Text);
 case listbox1.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:=' and data0415.number='''+trim(edit1.Text)+'''';
  1:
   begin
    sgrid1.Cells[2,sgrid_row]:=' and data0415.type='+inttostr(combobox1.ItemIndex+1);
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   end;
  2:
   begin
    sgrid1.Cells[2,sgrid_row]:=' and data0415.status='+inttostr(combobox1.ItemIndex+1);
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   end;
  3:sgrid1.Cells[2,sgrid_row]:=' and data0010.cust_code='''+trim(edit1.Text)+'''';
  4:sgrid1.Cells[2,sgrid_row]:=' and data0025.manu_part_number like ''%'+trim(edit1.Text)+'%''';
  5:sgrid1.Cells[2,sgrid_row]:=' and data0025.manu_part_desc like ''%'+trim(edit1.Text)+'%''';
 end;
end;

procedure Tfm_condition.ListBox1Click(Sender: TObject);
begin
 label1.Caption:=listbox1.Items[listbox1.itemindex]+'：';
 edit1.Text:='';
 edit1.Visible:=listbox1.ItemIndex in [0,3,4,5];
 combobox1.Visible:=listbox1.ItemIndex in [1,2];
 bitbtn4.Visible:=listbox1.ItemIndex=3;
 button1.Enabled:=listbox1.ItemIndex in [1,2];
 case listbox1.ItemIndex of
  1:
  begin
   combobox1.Items.Clear;
   combobox1.items.Add('直接出仓');
   combobox1.items.Add('委外退货出仓');
   combobox1.items.Add('退货重检出仓');
   combobox1.items.Add('正常重检出仓');
   combobox1.Itemindex:=0;
  end;
  2:
  begin
   combobox1.Items.Clear;
   combobox1.items.Add('待提交');
   combobox1.items.Add('已提交');
   combobox1.items.Add('已出仓');
   combobox1.items.Add('已检视');
   combobox1.items.Add('被退回');
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
 if (listbox1.ItemIndex=3) and (trim(edit1.Text)<>'') then
  with dm.aqtmp do
  begin
   close;
   sql.Text:='select rkey from data0010 where cust_code='''+trim(edit1.Text)+'''';
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
  inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
  inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
  inputvar.KeyField:='cust_code';

  inputvar.InPut_value:=edit1.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
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
  dtpk1.Date:=now-10;
  dtpk2.Date:=now;
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
