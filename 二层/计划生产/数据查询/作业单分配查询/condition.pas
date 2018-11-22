unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_condition = class(TForm)
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
    DT2: TDateTimePicker;
    Label3: TLabel;
    DT1: TDateTimePicker;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  frm_condition: Tfrm_condition;

implementation
uses damo,constvar,pick_item_single;

{$R *.dfm}

procedure Tfrm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit1.Text);
 case listbox1.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:=' and d06.work_order_number like '+'''%'+edit1.text+'%''';
  1:sgrid1.Cells[2,sgrid_row]:=' and d25.manu_part_number like '+'''%'+edit1.text+'%''';
  2:
  begin
   sgrid1.Cells[2,sgrid_row]:=' and d06.wipmat_status='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
  3:sgrid1.Cells[2,sgrid_row]:=' and d05.empl_code='+''''+edit1.Text+'''';
  4:sgrid1.Cells[2,sgrid_row]:=' and d06_1.work_order_number like '+'''%'+edit1.text+'%''';
  5:sgrid1.Cells[2,sgrid_row]:=' and d25_1.manu_part_number like '+'''%'+edit1.text+'%''';
 end; //case结束
end;

procedure Tfrm_condition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名称';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
end;

procedure Tfrm_condition.ListBox1Click(Sender: TObject);
begin
  edit1.Visible:=listbox1.ItemIndex in [0,1,3,4,5];
  combobox1.Visible:=listbox1.ItemIndex=2;
  bitbtn4.Visible:=listbox1.ItemIndex=3;
  label1.Caption:=listbox1.Items[listbox1.itemindex]+'：';
  edit1.Text:='';
end;

procedure Tfrm_condition.Edit1Exit(Sender: TObject);
begin
  if (listbox1.ItemIndex=3) and (trim(edit1.Text)<>'') then
  with dm.aqtmp do
  begin
    sql.Text:='select empl_code from data0005 where empl_code='''+trim(edit1.Text)+'''';
    open;
    if isempty then
    begin
      showmessage('员工代码输入错误，请重新输入！');
      edit1.Text:='';
      edit1.SetFocus;
    end;
    close;
  end;
end;

procedure Tfrm_condition.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    button1.SetFocus;
end;

procedure Tfrm_condition.Button1Click(Sender: TObject);
var i:byte;
begin
  if (listbox1.ItemIndex in [0,1,3,4,5]) and (trim(edit1.Text)='') then
    exit;
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tfrm_condition.N1Click(Sender: TObject);
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

procedure Tfrm_condition.BitBtn2Click(Sender: TObject);
var i:byte;
begin  //重置，即清空sgrid数据
  for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure Tfrm_condition.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='empl_code/员工代码/130,employee_name/员工姓名/240';
    inputvar.Sqlstr:='select rkey,empl_code,employee_name from data0005 order by empl_code';
    inputvar.KeyField:='empl_code';
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['empl_code']);
      button1.SetFocus;
    end
    else edit1.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

end.
